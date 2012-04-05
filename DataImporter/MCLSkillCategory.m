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
  NSMutableDictionary *_items;
}

@synthesize name = _name;
@synthesize parent = _parent;
@synthesize items = _items;


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
    _items = [NSMutableDictionary dictionaryWithCapacity:7];
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

- (NSString *)description {
  return [NSString stringWithFormat:@"%@ (parent: %@)\nSkills:\n%@", self.name, self.parent.name, self.items];
}


- (void)addItem:(id)item {
  if (item) {
    [_items setObject:item forKey:item.name];
  }

}

+ (MCLSkillCategory *)forName:(NSString *)name {
  id category = [categories objectForKey:name];
  if (!category) {
    category = [[MCLSkillCategory alloc] initWithName:name];
    [categories setObject:category forKey:name];
  }
  return category;

}

+ (NSDictionary *)categories {
  return categories;

}
@end