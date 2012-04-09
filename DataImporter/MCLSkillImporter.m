//
//  Created by claprun on 3/18/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MCLSkillImporter.h"
#import "MCLCategory.h"
#import "MCLSkill.h"

static NSRegularExpression *SKILL_REGEX = nil;


@implementation MCLSkillImporter {

}

+ (void)initialize {
  [super initialize];

  if (!SKILL_REGEX) {
    SKILL_REGEX = [NSRegularExpression regularExpressionWithPattern:@"\\s*([^\\(\\)]+)\\s*\\(\\s*(\\w+)\\s*\\)\\s*"
                                                            options:NSRegularExpressionCaseInsensitive
                                                              error:NULL];

  }

}


- (NSArray *)importSkillsFrom:(NSString *)pathOrURL {
  NSFileManager *fileManager = [NSFileManager defaultManager];
  NSData *const data = [fileManager contentsAtPath:pathOrURL];

  NSXMLDocument *document = [[NSXMLDocument alloc] initWithData:data options:NSXMLDocumentTidyHTML error:nil];

  // html / body / table / tr / td
  // for some reason tr is not the first and only child of the table element (maybe text?)
  NSXMLNode *const content = [[[[[document rootElement] childAtIndex:1] childAtIndex:0] childAtIndex:1] childAtIndex:0];
  NSArray *children = [content children];
  MCLCategory *currentCategory = nil;
  MCLCategory *currentSubCategory = nil;
  MCLSkill *currentSkill = nil;

  for (NSXMLElement *child in children) {
    NSString *currentChildName = child.name;

    // skip everything until we find a category
    if (!currentCategory && ![currentChildName isEqualToString:@"h3"]) {
      continue;
    }

    // get the child text
    NSString *childText = [[child stringValue] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    // NSLog(@"Looking at %@", childText);

    // we found a category
    if ([currentChildName isEqualToString:@"h3"]) {
      currentCategory = [MCLCategory forName:childText atTopLevel:YES];
      currentSubCategory = nil;
      currentSkill = nil;
//      NSLog(@"Category '%@'", childText);

      continue;
    }

    // we found a subcategory
    if (currentCategory && [currentChildName isEqualToString:@"h4"]) {
      currentSubCategory = [MCLCategory forName:childText];
      currentSubCategory.parent = currentCategory;
      currentSkill = nil;
//      NSLog(@"\tSub-category '%@'", childText);

      continue;
    }

    // we found a skill
    if ((currentCategory || currentSubCategory) && [currentChildName isEqualToString:@"h5"]) {
      NSTextCheckingResult *match = [SKILL_REGEX firstMatchInString:childText
                                                            options:0
                                                              range:NSMakeRange(0, [childText length])];

      if (match) {
        NSString *skillName = [[childText substringWithRange:[match rangeAtIndex:1]] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        NSString *attributeName = [childText substringWithRange:[match rangeAtIndex:2]];
        currentSkill = [MCLSkill skillNamed:skillName linkedAttribute:attributeName];

      }
      else {
        NSLog(@"'%@' didn't match skill regex", currentChildName);
      }

      continue;
    }

    // process the skill details
    if (currentSkill) {

      currentSkill.category = currentSubCategory != nil ? currentSubCategory : currentCategory;

      // details
      if ([currentChildName isEqualToString:@"p"]) {
        currentSkill.details = childText;

        continue;
      }

      // default and specializations
      if ([currentChildName isEqualToString:@"ul"]) {
        NSUInteger childCount = [child childCount];
        if (childCount == 2 || childCount == 3) {
          BOOL canDefault = !NSEqualRanges(NSMakeRange(NSNotFound, 0), [[[child childAtIndex:0] stringValue] rangeOfString:@"Yes" options:NSCaseInsensitiveSearch]);
          currentSkill.canDefault = canDefault;

          // we need to remove Specializations and trim the strings
          NSString *concatenatedSpecs = [[child childAtIndex:1] stringValue];
          NSArray *unfilteredSpecs = [concatenatedSpecs componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@":,"]];
          NSMutableArray *filtered = [NSMutableArray arrayWithCapacity:[unfilteredSpecs count]];
          for (NSString *unfilteredSpec in unfilteredSpecs) {
            if ([unfilteredSpec hasPrefix:@"Special"]) {
              continue;

            }

            [filtered addObject:[unfilteredSpec stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];

          }

          // special case for climbing
          if (childCount == 3) {
            [filtered replaceObjectAtIndex:filtered.count - 1
                                withObject:[filtered.lastObject stringByAppendingString:[[child childAtIndex:2] stringValue]]];
          }

          currentSkill.specializations = filtered;

        }
        else {
          NSLog(@"Didn't get all the details for skill %@", currentSkill.name);
        }

        // NSLog(@"\t\t%@", currentSkill);

        // if we arrive here, we're done with the current skill
        currentSkill = nil;


        continue;
      }
    }

  }

  return nil;
}

@end