//
//  Created by claprun on 3/22/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MCLSkill.h"
#import "InnerBandCore.h"
#import "_MCLAttribute.h"
#import "MCLAttribute.h"
#import "MCLCategory.h"


@implementation MCLSkill {

}

- (BOOL)validateDetails:(id *)details error:(NSError **)error {
  if (!*details || ((NSString *) *details).length == 0) {
    return NO;
  }

  return YES;
}

- (NSString *)description {
  NSMutableString *specializationsNames = [[NSMutableString alloc] init];
  for (MCLSkill *specialization in self.specializations) {
    [specializationsNames appendFormat:@"  - %@\n", specialization.name];
  }

  return [NSString stringWithFormat:@"Skill named '%@' linked to '%@' with defaulting %s.\nCategory: %@\nSpecializations:\n%@Details:\n%@", self.name, self.attribute, self.canDefaultValue ? "Yes" : "No", self.category.name, specializationsNames, self.details];
}


- (void)addSpecialization:(NSString *)specializationName {
  MCLSkill *const specialization = [MCLSkill skillNamed:specializationName linkedAttribute:self.attribute];
  [self addSpecializationsObject:specialization];
}

+ (MCLSkill *)skillNamed:(NSString *)skillName linkedAttributeNamed:(NSString *)attributeName {
  return [MCLSkill skillNamed:skillName linkedAttribute:[MCLAttribute attributeNamed:attributeName]];
}

+ (MCLSkill *)skillNamed:(NSString *)skillName linkedAttribute:(MCLAttribute *)attribute {
  MCLSkill *skill = [MCLSkill firstWithKey:MCLNamedAttributes.name value:skillName];
  if (skill) {
    NSString *const existingAttribute = skill.attribute.name;
    if (existingAttribute && ![existingAttribute isEqualToString:attribute.name]) {
      [NSException raise:@"Invalid skill - attribute reference" format:@"Skill %@ isn't linked to %@ attribute but to %@ attribute", skillName, attribute.name, existingAttribute];
    }

    return skill;
  }
  else {
    skill = [MCLSkill create];
    skill.name = skillName;
    skill.attribute = attribute;

    return skill;

  }
}


@end