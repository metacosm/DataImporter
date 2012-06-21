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

- (MCLCategory *)subCategoryWithParent:(MCLCategory *)currentCategory named:(NSString *)subCategoryName counter:(int)subCategoryCounter {
  MCLCategory *currentSubCategory = [MCLCategory forName:[currentCategory.name stringByAppendingFormat:@" %i", subCategoryCounter] withParent:currentCategory];

//  NSLog(@"\tSub-category '%@'", currentSubCategory.name);

  return currentSubCategory;
}

- (NSData *)dataFrom:(NSString *)pathOrURL {
// Replace entities before processing
  NSString *stringContent = [NSString stringWithContentsOfFile:pathOrURL encoding:NSUTF8StringEncoding error:nil];
  stringContent = [stringContent stringByReplacingOccurrencesOfString:@"&divide;" withString:@"/"];
  stringContent = [stringContent stringByReplacingOccurrencesOfString:@"&#8211;" withString:@"-"];
  stringContent = [stringContent stringByReplacingOccurrencesOfString:@"&#8226;" withString:@""];
  NSData *data = [stringContent dataUsingEncoding:NSUTF8StringEncoding];
  return data;
}

- (id)createElementInCategory:(MCLCategory *)currentCategory subCategory:(MCLCategory *)currentSubCategory from:(NSString *)childText {

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

    MCLSpell *currentSpell = [MCLSpell spellNamed:spellName inCategory:currentSubCategory != nil ? currentSubCategory : currentCategory];

    // details from spell name
    NSString *const spellDetails = [childText substringWithRange:[match rangeAtIndex:2]];
    if ([spellDetails rangeOfString:@"Elemental"].location != NSNotFound) {
      currentSpell.usingElementalEffectsValue = YES;
    }
    currentSpell.directValue = [spellDetails rangeOfString:@"Direct"].location != NSNotFound;

    // only for detection spells
    if ([currentSpell isMemberOfClass:[MCLDetectionSpell class]]) {
      MCLDetectionSpell *detectionSpell = (MCLDetectionSpell *) currentSpell;

      // fix for cryptesthesia
      if ([currentSpell.name rangeOfString:@"Cryptesthesia"].location != NSNotFound) {
        detectionSpell.active = NO;
        detectionSpell.mode = @"Directional";
      } else {
        detectionSpell.activeValue = [spellDetails rangeOfString:@"Active"].location != NSNotFound;
        const NSUInteger start = [spellDetails rangeOfString:@","].location + 1;
        const NSUInteger end = [spellDetails length] - start - 1;
        detectionSpell.mode = [spellDetails substringWithRange:NSMakeRange(start, end)];
      }

    }

    return currentSpell;
  }
  else {
    NSLog(@"'%@' didn't match spell regex", childText);

    return nil;
  }
}

- (BOOL)isProcessingElement:(id)currentElement withCurrentChildName:(NSString *)currentChildName {
  return currentElement && [currentChildName isEqualToString:@"h6"];
}

- (BOOL)doneAfterProcessing:(id)currentElement fromElement:(NSXMLElement *)child withText:(NSString *)childText {
  if ([currentElement isMemberOfClass:[MCLSpell class]]) {
    MCLSpell *spell = (MCLSpell *) currentElement;
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
          spell.damage = [damage stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

        }

        if ([scanner scanString:DURATION intoString:NULL] &&
            [scanner scanUpToString:@"D" intoString:&duration] &&
            [scanner scanString:DV intoString:NULL]) {

          spell.type = [type stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

          spell.range = [range stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
          spell.areaValue = [spell.range rangeOfString:@"(A)"].location != NSNotFound;


          spell.duration = [duration stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

          spell.drain = [[childText substringFromIndex:[scanner scanLocation]] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

          [scanner setScanLocation:childText.length];
        }
      }

    }
  }

  // NSLog(@"%@", currentSpell);
  return YES;
}

- (BOOL)matchesSubCategory:(NSString *)currentChildName {
  return [currentChildName isEqualToString:@"hr"];
}

- (void)furtherProcessSubCategory:(MCLCategory *)subCategory from:(NSXMLElement *)child withText:(NSString *)childText {
  NSString *const childName = child.name;

  // process the subcategory details
  if (subCategory && ([childName isEqualToString:@"p"])) {
    subCategory.details = subCategory.details ? [subCategory.details stringByAppendingString:[@"\n" stringByAppendingString:childText]] : childText;

    return;
  }

  // deal with the Increase Reflexes special case
  if (subCategory && [childName isEqualToString:@"ul"]) {
    for (id li in [child children]) {
      subCategory.details = [subCategory.details stringByAppendingString:[@"\n- " stringByAppendingString:[[li stringValue] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]]];
    }

    return;
  }
}

- (NSString *)typeAsString {
  return @"spells";
}

@end