//
//  Created by claprun on 3/22/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MCLCategory.h"
#import "InnerBandCore.h"
#import "MCLCategorized.h"


@implementation MCLCategory {
}

- (void)addSubCategory:(MCLCategory *)category {
  [self addSubCategoriesObject:category];

}

- (NSString *)description {
  return [self descriptionWithIndent:@"\t"];
}

- (NSString *)descriptionWithIndent:(NSString *)indent {
  NSMutableString *description = [NSMutableString stringWithCapacity:1024];
  [description appendString:self.name];

  if (self.subCategories.count > 0) {
    for (id category in [[self.subCategories allObjects] sortedArrayUsingSelector:@selector(compare:)]) {
      [description appendFormat:@"\n%@+ %@", indent, [category descriptionWithIndent:[indent stringByAppendingString:@"\t"]]];
    }
  }

  if (self.items.count > 0) {
    for (id item in self.items.allObjects) {
      [description appendFormat:@"\n%@- %@", indent, item];
    }
  }

  if (self.details) {
    [description appendFormat:@"\n%@Details:\n%@%@", indent, indent, self.details];
  }

  return description;
}


- (void)addItem:(MCLCategorized *)item {
  [self addItemsObject:item];

}

+ (MCLCategory *)forName:(NSString *)name withParent:(MCLCategory *)parent {
  // first check if the category we want already exists
  MCLCategory *category = [MCLCategory firstWithKey:@"name" value:name];
  if (category) {

    if (![parent isEqual:category.parent]) {
      [NSException raise:@"Invalid category hierarchy" format:@"%@ doesn't have %@ as parent!", name, parent];
    }
    else {
      return category;
    }
  }
  else {
    category = [MCLCategory create];
    category.name = name;
    category.parent = parent;
    [parent addSubCategory:category];
  }

  return category;
}

- (NSComparisonResult)compare:(MCLCategory *)category {
  return [self.name compare:category.name];
}

+ (NSArray *)categories:(BOOL)topLevelOnly {
  return topLevelOnly ? [MCLCategory allForPredicate:[NSPredicate predicateWithFormat:@"parent = nil"]] : [MCLCategory all];

}
@end