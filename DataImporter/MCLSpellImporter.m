//
//  Created by claprun on 4/5/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MCLSpellImporter.h"
#import "MCLCategory.h"
#import "MCLSpell.h"
#import "MCLDetectionSpell.h"


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
  // Replace entities before processing
  NSString *stringContent = [NSString stringWithContentsOfFile:pathOrURL encoding:NSUTF8StringEncoding error:nil];
  stringContent = [stringContent stringByReplacingOccurrencesOfString:@"&divide;" withString:@"/"];
  stringContent = [stringContent stringByReplacingOccurrencesOfString:@"&#8211;" withString:@"-"];
  stringContent = [stringContent stringByReplacingOccurrencesOfString:@"&#8226;" withString:@""];
  NSData *data = [stringContent dataUsingEncoding:NSUTF8StringEncoding];


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

        // fix for improper formating for [Sense] Removal
        const NSUInteger location = [spellName rangeOfString:@"[Sense] Removal"].location;
        if (location != NSNotFound && ![spellName hasPrefix:@"Mass"]) {
          spellName = [spellName substringFromIndex:location];
        }

        currentSpell = [MCLSpell spellNamed:spellName inCategory:currentSubCategory != nil ? currentSubCategory : currentCategory];

        // details from spell name
        NSString *const spellDetails = [childText substringWithRange:[match rangeAtIndex:2]];
        if ([spellDetails rangeOfString:@"Elemental"].location != NSNotFound) {
          currentSpell.usingElementalEffects = YES;
        }
        currentSpell.direct = [spellDetails rangeOfString:@"Direct"].location != NSNotFound;

        // only for detection spells
        if ([currentSpell isMemberOfClass:[MCLDetectionSpell class]]) {
          MCLDetectionSpell *detectionSpell = (MCLDetectionSpell *) currentSpell;

          // fix for cryptesthesia
          if ([currentSpell.name rangeOfString:@"Cryptesthesia"].location != NSNotFound) {
            detectionSpell.active = NO;
            detectionSpell.mode = @"Directional";
          } else {
            detectionSpell.active = [spellDetails rangeOfString:@"Active"].location != NSNotFound;
            const NSUInteger start = [spellDetails rangeOfString:@","].location + 1;
            const NSUInteger end = [spellDetails length] - start - 1;
            detectionSpell.mode = [spellDetails substringWithRange:NSMakeRange(start, end)];
          }

        }
      }
      else {
        NSLog(@"'%@' didn't match spell regex", childText);
      }

      continue;
    }

    // process the spell details
    if (currentSpell && [currentChildName isEqualToString:@"h6"]) {
      NSString *TYPE = @"Type: ";
      NSString *RANGE = @"Range: ";
      NSString *DAMAGE = @"Damage: ";
      NSString *DURATION = @"Duration: ";
      NSString *DV = @"DV: ";
      NSString *type;
      NSString *range;
      NSString *damage;
      NSString *duration;

      NSScanner *scanner = [NSScanner scannerWithString:childText];
      while (!scanner.isAtEnd) {
        if ([scanner scanString:TYPE intoString:NULL] &&
            [scanner scanUpToString:@"R" intoString:&type] &&
            [scanner scanString:RANGE intoString:NULL] &&
            [scanner scanUpToString:@"D" intoString:&range]) {

          if ([scanner scanString:DAMAGE intoString:NULL] && [scanner scanUpToString:@"D" intoString:&damage]) {
            currentSpell.damage = [damage stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

          }

          if ([scanner scanString:DURATION intoString:NULL] &&
              [scanner scanUpToString:@"D" intoString:&duration] &&
              [scanner scanString:DV intoString:NULL]) {

            currentSpell.type = [type stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

            currentSpell.range = [range stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            currentSpell.area = [currentSpell.range rangeOfString:@"(A)"].location != NSNotFound;


            currentSpell.duration = [duration stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

            currentSpell.drain = [[childText substringFromIndex:[scanner scanLocation]] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

            [scanner setScanLocation:childText.length];
          }
        }

      }

      // NSLog(@"%@", currentSpell);
    }

    // process the subcategory details
    if (currentSubCategory && ([currentChildName isEqualToString:@"p"])) {
      currentSubCategory.details = currentSubCategory.details ? [currentSubCategory.details stringByAppendingString:[@"\n" stringByAppendingString:childText]] : childText;

      continue;
    }

    // deal with the Increase Reflexes special case
    if (currentSubCategory && [currentChildName isEqualToString:@"ul"]) {
      for (id li in [child children]) {
        currentSubCategory.details = [currentSubCategory.details stringByAppendingString:[@"\n- " stringByAppendingString:[[li stringValue] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]]];
      }

      continue;
    }

  }

  return nil;
}

@end