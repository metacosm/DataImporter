//
//  Created by claprun on 4/5/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MCLSpell.h"
#import "MCLCategory.h"


@implementation MCLSpell {

@private
  NSString *_name;
  NSString *_type;
  NSString *_range;
  NSString *_duration;
  NSString *_drain;
  BOOL _direct;
  BOOL _area;
  BOOL _usingElementalEffects;
  __weak MCLCategory *_category;
}
@synthesize name = _name;
@synthesize type = _type;
@synthesize range = _range;
@synthesize duration = _duration;
@synthesize drain = _drain;
@synthesize direct = _direct;
@synthesize area = _area;
@synthesize usingElementalEffects = _usingElementalEffects;
@synthesize category = _category;

- (id)initWithName:(NSString *)name {
  self = [super init];
  if (self) {
    _name = name;
  }

  return self;

}

- (NSString *)description {
  return self.name;
}


- (void)setCategory:(MCLCategory *)category {
  _category = category;
  [category addItem:self];
}

+ (MCLSpell *)spellNamed:(NSString *)name {
  return [[MCLSpell alloc] initWithName:name];

}
@end