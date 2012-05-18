// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MCLCategory.m instead.

#import "_MCLCategory.h"

const struct MCLCategoryAttributes MCLCategoryAttributes = {
    .details = @"details",
};

const struct MCLCategoryRelationships MCLCategoryRelationships = {
    .items = @"items",
    .parent = @"parent",
    .subCategories = @"subCategories",
};

const struct MCLCategoryFetchedProperties MCLCategoryFetchedProperties = {
};

@implementation MCLCategoryID
@end

@implementation _MCLCategory

+ (id)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
  NSParameterAssert(moc_);
  return [NSEntityDescription insertNewObjectForEntityForName:@"MCLCategory" inManagedObjectContext:moc_];
}

+ (NSString *)entityName {
  return @"MCLCategory";
}

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)moc_ {
  NSParameterAssert(moc_);
  return [NSEntityDescription entityForName:@"MCLCategory" inManagedObjectContext:moc_];
}

- (MCLCategoryID *)objectID {
  return (MCLCategoryID *) [super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
  NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];


  return keyPaths;
}


@dynamic details;


@dynamic items;


- (NSMutableSet *)itemsSet {
  [self willAccessValueForKey:@"items"];

  NSMutableSet *result = (NSMutableSet *) [self mutableSetValueForKey:@"items"];

  [self didAccessValueForKey:@"items"];
  return result;
}


@dynamic parent;


@dynamic subCategories;


- (NSMutableSet *)subCategoriesSet {
  [self willAccessValueForKey:@"subCategories"];

  NSMutableSet *result = (NSMutableSet *) [self mutableSetValueForKey:@"subCategories"];

  [self didAccessValueForKey:@"subCategories"];
  return result;
}


@end
