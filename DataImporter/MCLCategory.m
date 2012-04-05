//
//  Created by claprun on 3/22/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MCLCategory.h"


static NSMutableDictionary *categories = nil;

@implementation MCLCategory {

@private
  NSString *_name;
  __weak MCLCategory *_parent;
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


- (void)setParent:(MCLCategory *)category {
  _parent = category;
  [_parent addSubCategory:self];

}

- (void)addSubCategory:(MCLCategory *)category {
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

+ (MCLCategory *)forName:(NSString *)name {
  id category = [categories objectForKey:name];
  if (!category) {
    category = [[MCLCategory alloc] initWithName:name];
    [categories setObject:category forKey:name];
  }
  return category;

}

+ (NSDictionary *)categories {
  return categories;

}
@end