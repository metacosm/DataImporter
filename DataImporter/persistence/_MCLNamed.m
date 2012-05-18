// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MCLNamed.m instead.

#import "_MCLNamed.h"

const struct MCLNamedAttributes MCLNamedAttributes = {
    .name = @"name",
};

const struct MCLNamedRelationships MCLNamedRelationships = {
};

const struct MCLNamedFetchedProperties MCLNamedFetchedProperties = {
};

@implementation MCLNamedID
@end

@implementation _MCLNamed

+ (id)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
  NSParameterAssert(moc_);
  return [NSEntityDescription insertNewObjectForEntityForName:@"MCLNamed" inManagedObjectContext:moc_];
}

+ (NSString *)entityName {
  return @"MCLNamed";
}

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)moc_ {
  NSParameterAssert(moc_);
  return [NSEntityDescription entityForName:@"MCLNamed" inManagedObjectContext:moc_];
}

- (MCLNamedID *)objectID {
  return (MCLNamedID *) [super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
  NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];


  return keyPaths;
}


@dynamic name;


@end
