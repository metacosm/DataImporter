// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MCLCategorized.m instead.

#import "_MCLCategorized.h"

const struct MCLCategorizedAttributes MCLCategorizedAttributes = {
};

const struct MCLCategorizedRelationships MCLCategorizedRelationships = {
    .category = @"category",
};

const struct MCLCategorizedFetchedProperties MCLCategorizedFetchedProperties = {
};

@implementation MCLCategorizedID
@end

@implementation _MCLCategorized

+ (id)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
  NSParameterAssert(moc_);
  return [NSEntityDescription insertNewObjectForEntityForName:@"MCLCategorized" inManagedObjectContext:moc_];
}

+ (NSString *)entityName {
  return @"MCLCategorized";
}

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)moc_ {
  NSParameterAssert(moc_);
  return [NSEntityDescription entityForName:@"MCLCategorized" inManagedObjectContext:moc_];
}

- (MCLCategorizedID *)objectID {
  return (MCLCategorizedID *) [super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
  NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];


  return keyPaths;
}


@dynamic category;


@end
