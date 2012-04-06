//
//  Created by claprun on 3/22/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MCLCategory.h"
#import "Named.h"


static NSMutableDictionary *categories = nil;
static NSMutableDictionary *topLevelCategories = nil;

@implementation MCLCategory {

@private
  NSString *_name;
  __weak MCLCategory *_parent;
  NSMutableDictionary *subCategories;
  NSMutableDictionary *_items;
  NSString *_details;
}

@synthesize name = _name;
@synthesize parent = _parent;
@synthesize items = _items;
@synthesize details = _details;


+ (void)initialize {
  [super initialize];

  if (!categories) {
    categories = [NSMutableDictionary dictionaryWithCapacity:101];
    topLevelCategories = [NSMutableDictionary dictionaryWithCapacity:7];
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
  return [self descriptionWithIndent:@"\t"];
}

- (NSString *)descriptionWithIndent:(NSString *)indent {
  NSMutableString *description = [NSMutableString stringWithCapacity:1024];
  [description appendString:self.name];

  if (subCategories.count > 0) {
    for (id key in [[subCategories allKeys] sortedArrayUsingSelector:@selector(compare:)]) {
      [description appendFormat:@"\n%@+ %@", indent, [[subCategories valueForKey:key] descriptionWithIndent:[indent stringByAppendingString:@"\t"]]];
    }
  }

  if (self.items.count > 0) {
    for (id item in self.items.allValues) {
      [description appendFormat:@"\n%@- %@", indent, item];
    }
  }

  if (self.details) {
    [description appendFormat:@"\n%@Details:\n%@%@", indent, indent, self.details];
  }

  return description;
}


- (void)addItem:(id <Named>)item {
  if (item) {
    [_items setObject:item forKey:item.name];
  }

}

+ (MCLCategory *)forName:(NSString *)name {
  return [self forName:name atTopLevel:NO];

}

+ (MCLCategory *)forName:(NSString *)name atTopLevel:(BOOL)isTop {
  NSDictionary *lookupSpot = isTop ? topLevelCategories : categories;

  id category = [lookupSpot objectForKey:name];
  if (!category) {
    category = [[MCLCategory alloc] initWithName:name];
    [categories setObject:category forKey:name];

    if (isTop) {
      [topLevelCategories setObject:category forKey:name];
    }

  }
  return category;

}

+ (NSDictionary *)categories:(BOOL)topLevelOnly {
  return topLevelOnly ? topLevelCategories : categories;

}
@end