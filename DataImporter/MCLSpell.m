//
//  Created by claprun on 4/5/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MCLSpell.h"
#import "MCLCategory.h"
#import "MCLDetectionSpell.h"
#import "InnerBandCore.h"


@implementation MCLSpell {
}

- (NSString *)description {
  return [NSString stringWithFormat:@"Spell '%@' Type: '%@' Range: '%@' Damage: '%@' Duration: '%@' Drain: '%@'", self.name, self.type, self.range, self.damage, self.duration, self.drain];
}


- (void)setCategory:(MCLCategory *)category {
  [self willChangeValueForKey:MCLCategorizedRelationships.category];

  [self setPrimitiveCategory:category];
  [category addItem:self];

  [self didChangeValueForKey:MCLCategorizedRelationships.category];
}

+ (MCLSpell *)spellNamed:(NSString *)name inCategory:(MCLCategory *)category {

  MCLSpell *spell = [MCLSpell firstWithKey:MCLNamedAttributes.name value:name];
  if (spell) {
    if (category && ![spell.category isEqual:category]) {
      [NSException raise:@"Invalid spell - category reference" format:@"Spell %@ isn't in %@ category but in %@ category", name, category.name, spell.category.name];
    }

    return spell;
  }
  else {
    if ([category.name hasPrefix:@"Detection"]) {
      spell = [MCLDetectionSpell create];
    } else {
      spell = [MCLSpell create];
    }

    spell.name = name;
    spell.category = category;

    return spell;
  }
}
@end