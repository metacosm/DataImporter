// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MCLAttribute.m instead.

#import "_MCLAttribute.h"

const struct MCLAttributeAttributes MCLAttributeAttributes = {
    .name = @"name",
};

const struct MCLAttributeRelationships MCLAttributeRelationships = {
};

const struct MCLAttributeFetchedProperties MCLAttributeFetchedProperties = {
};

@implementation MCLAttributeID
@end

@implementation _MCLAttribute

+ (id)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
  NSParameterAssert(moc_);
  return [NSEntityDescription insertNewObjectForEntityForName:@"MCLAttribute" inManagedObjectContext:moc_];
}

+ (NSString *)entityName {
  return @"MCLAttribute";
}

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)moc_ {
  NSParameterAssert(moc_);
  return [NSEntityDescription entityForName:@"MCLAttribute" inManagedObjectContext:moc_];
}

- (MCLAttributeID *)objectID {
  return (MCLAttributeID *) [super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
  NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];


  return keyPaths;
}


@dynamic name;


@end
