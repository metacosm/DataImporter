//
//  Created by claprun on 3/22/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MCLSkillCategory.h"


static NSMutableDictionary *categories = nil;

@implementation MCLSkillCategory {

@private
  NSString *_name;
  __weak MCLSkillCategory *_parent;
  NSMutableDictionary *subCategories;
}
@synthesize name = _name;
@synthesize parent = _parent;

+ (void)initialize {
  [super initialize];

  if (!categories) {
    categories = [NSMutableDictionary dictionaryWithCapacity:7];
  }
}


- (id)initWithName:(NSString *)name {
  self = [super init];
  if (self) {
    _name = name;
    subCategories = [NSMutableDictionary dictionaryWithCapacity:7];
  }

  return self;

}


- (void)setParent:(MCLSkillCategory *)category {
  _parent = category;
  [_parent addSubCategory:self];

}

- (void)addSubCategory:(MCLSkillCategory *)category {
  [subCategories setObject:category forKey:category.name];

}

+ (MCLSkillCategory *)forName:(NSString *)name {
  id category = [categories objectForKey:name];
  if (!category) {
    category = [[MCLSkillCategory alloc] initWithName:name];
  }
  return category;

}
@end