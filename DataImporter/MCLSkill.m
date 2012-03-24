//
//  Created by claprun on 3/22/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MCLSkill.h"


@implementation MCLSkill {

@private
  NSString *_name;
  NSString *_attribute;
  NSString *_details;
  BOOL _canDefault;
  NSMutableArray *_specializations;
}
@synthesize name = _name;
@synthesize attribute = _attribute;
@synthesize details = _details;
@synthesize canDefault = _canDefault;
@synthesize specializations = _specializations;


- (id)initWithName:(NSString *)name attribute:(NSString *)attribute {
  self = [super init];
  if (self) {
    _name = name;
    _attribute = attribute;
  }

  return self;

}

- (NSString *)description {
  return [NSString stringWithFormat:@"Skill named '%@' linked to '%@' with defaulting %s.\nSpecializations: %@\nDetails:\n%@", _name, _attribute, _canDefault ? "Yes" : "No", _specializations.description, _details];
}


+ (MCLSkill *)skillNamed:(NSString *)skillName linkedAttribute:(NSString *)attributeName {
  return [[MCLSkill alloc] initWithName:skillName attribute:attributeName];
}


@end