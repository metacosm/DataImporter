//
//  Created by claprun on 4/5/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MCLSpellImporter.h"
#import "MCLCategory.h"
#import "MCLSpell.h"


static NSRegularExpression *SPELL_REGEX = nil;

@implementation MCLSpellImporter {

}

+ (void)initialize {
  [super initialize];

  if (!SPELL_REGEX) {
    SPELL_REGEX = [NSRegularExpression regularExpressionWithPattern:@"\\s*([^\\(\\)]+)\\s*\\(?\\s*(.*)\\s*\\)?\\s*"
                                                            options:NSRegularExpressionCaseInsensitive
                                                              error:NULL];

  }

}

- (MCLCategory *)subCategoryWithParent:(MCLCategory *)currentCategory Counter:(int *)subCategoryCounter {
  MCLCategory *currentSubCategory = [MCLCategory forName:[currentCategory.name stringByAppendingFormat:@" %i", (*subCategoryCounter)++]];
  currentSubCategory.parent = currentCategory;

//  NSLog(@"\tSub-category '%@'", currentSubCategory.name);

  return currentSubCategory;
}

- (NSArray *)importFrom:(NSString *)pathOrURL {
  NSData *data;
  if ([pathOrURL hasPrefix:@"http"]) {
    // Create the request.
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@""]
                                                cachePolicy:NSURLRequestUseProtocolCachePolicy
                                            timeoutInterval:60.0];
// create the connection with the request
// and start loading the data
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    if (theConnection) {
      // Create the NSMutableData to hold the received data.
      // receivedData is an instance variable declared elsewhere.
      data = [NSMutableData data];
    } else {
      // Inform the user that the connection failed.
    }

  } else {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    data = [fileManager contentsAtPath:pathOrURL];
  }


  NSXMLDocument *document = [[NSXMLDocument alloc] initWithData:data options:NSXMLDocumentTidyHTML error:nil];

  // html / body / table / tr / td
  // for some reason tr is not the first and only child of the table element (maybe text?)
  NSXMLNode *const content = [[[[[document rootElement] childAtIndex:1] childAtIndex:0] childAtIndex:1] childAtIndex:0];
  NSArray *children = [content children];
  MCLCategory *currentCategory = nil;
  MCLCategory *currentSubCategory = nil;
  MCLSpell *currentSpell = nil;
  int subCategoryCounter = 0;

  for (NSXMLElement *child in children) {
    NSString *currentChildName = child.name;

    // skip everything until we find a category
    if (!currentCategory && ![currentChildName isEqualToString:@"h3"]) {
      continue;
    }

    // get the child text
    NSString *childText = [[child stringValue] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    NSLog(@"Looking at %@", childText);

    // we found a category
    if ([currentChildName isEqualToString:@"h3"]) {
      currentCategory = [MCLCategory forName:childText atTopLevel:YES];
//      NSLog(@"Category '%@'", childText);

      subCategoryCounter = 1;
      currentSubCategory = [self subCategoryWithParent:currentCategory Counter:&subCategoryCounter];
      currentSpell = nil;

      continue;
    }

    // we found a subcategory
    if (currentCategory && [currentChildName isEqualToString:@"hr"]) {
      currentSubCategory = [self subCategoryWithParent:currentCategory Counter:&subCategoryCounter];
      currentSpell = nil;

      continue;
    }

    // we found a spell
    if ((currentCategory || currentSubCategory) && [currentChildName isEqualToString:@"h5"]) {
      NSTextCheckingResult *match = [SPELL_REGEX firstMatchInString:childText
                                                            options:0
                                                              range:NSMakeRange(0, [childText length])];

      if (match) {
        NSString *spellName = [[childText substringWithRange:[match rangeAtIndex:1]] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        currentSpell = [MCLSpell spellNamed:spellName];
        currentSpell.category = currentSubCategory != nil ? currentSubCategory : currentCategory;

//        NSLog(@"\t\tSpell: '%@'", spellName);
      }
      else {
        NSLog(@"'%@' didn't match spell regex", childText);
      }

      continue;
    }

    // process the subcategory details
    if (currentSubCategory && !currentSubCategory.details && [currentChildName isEqualToString:@"p"]) {
      currentSubCategory.details = childText;

      continue;
    }

  }

  return nil;
}

@end