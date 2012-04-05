//
//  Created by claprun on 3/22/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MCLSkill.h"
#import "MCLSkillCategory.h"


@implementation MCLSkill {

@private
  NSString *_name;
  NSString *_attribute;
  NSString *_details;
  BOOL _canDefault;
  NSMutableArray *_specializations;
  __weak MCLSkillCategory *_category;
}
@synthesize name = _name;
@synthesize attribute = _attribute;
@synthesize details = _details;
@synthesize canDefault = _canDefault;
@synthesize specializations = _specializations;
@synthesize category = _category;


- (id)initWithName:(NSString *)name attribute:(NSString *)attribute {
  self = [super init];
  if (self) {
    _name = name;
    _attribute = attribute;
  }

  return self;

}

- (void)setCategory:(MCLSkillCategory *)category {
  _category = category;
  [category addItem:self];
}

- (NSString *)description {
  return [NSString stringWithFormat:@"Skill named '%@' linked to '%@' with defaulting %s.\nCategory: %@\nSpecializations: %@\nDetails:\n%@", _name, _attribute, _canDefault ? "Yes" : "No", _category.name, _specializations.description, _details];
}


+ (MCLSkill *)skillNamed:(NSString *)skillName linkedAttribute:(NSString *)attributeName {
  return [[MCLSkill alloc] initWithName:skillName attribute:attributeName];
}


@end