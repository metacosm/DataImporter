// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MCLSkill.m instead.

#import "_MCLSkill.h"

const struct MCLSkillAttributes MCLSkillAttributes = {
    .canDefault = @"canDefault",
    .details = @"details",
};

const struct MCLSkillRelationships MCLSkillRelationships = {
    .attribute = @"attribute",
    .parent = @"parent",
    .specializations = @"specializations",
};

const struct MCLSkillFetchedProperties MCLSkillFetchedProperties = {
};

@implementation MCLSkillID
@end

@implementation _MCLSkill

+ (id)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
  NSParameterAssert(moc_);
  return [NSEntityDescription insertNewObjectForEntityForName:@"MCLSkill" inManagedObjectContext:moc_];
}

+ (NSString *)entityName {
  return @"MCLSkill";
}

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)moc_ {
  NSParameterAssert(moc_);
  return [NSEntityDescription entityForName:@"MCLSkill" inManagedObjectContext:moc_];
}

- (MCLSkillID *)objectID {
  return (MCLSkillID *) [super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
  NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

  if ([key isEqualToString:@"canDefaultValue"]) {
    NSSet *affectingKey = [NSSet setWithObject:@"canDefault"];
    keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
  }

  return keyPaths;
}


@dynamic canDefault;


- (BOOL)canDefaultValue {
  NSNumber *result = [self canDefault];
  return [result boolValue];
}

- (void)setCanDefaultValue:(BOOL)value_ {
  [self setCanDefault:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveCanDefaultValue {
  NSNumber *result = [self primitiveCanDefault];
  return [result boolValue];
}

- (void)setPrimitiveCanDefaultValue:(BOOL)value_ {
  [self setPrimitiveCanDefault:[NSNumber numberWithBool:value_]];
}


@dynamic details;


@dynamic attribute;


@dynamic parent;


@dynamic specializations;


- (NSMutableSet *)specializationsSet {
  [self willAccessValueForKey:@"specializations"];

  NSMutableSet *result = (NSMutableSet *) [self mutableSetValueForKey:@"specializations"];

  [self didAccessValueForKey:@"specializations"];
  return result;
}


@end
