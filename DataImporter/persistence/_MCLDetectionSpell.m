// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MCLDetectionSpell.m instead.

#import "_MCLDetectionSpell.h"

const struct MCLDetectionSpellAttributes MCLDetectionSpellAttributes = {
    .active = @"active",
    .mode = @"mode",
};

const struct MCLDetectionSpellRelationships MCLDetectionSpellRelationships = {
};

const struct MCLDetectionSpellFetchedProperties MCLDetectionSpellFetchedProperties = {
};

@implementation MCLDetectionSpellID
@end

@implementation _MCLDetectionSpell

+ (id)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
  NSParameterAssert(moc_);
  return [NSEntityDescription insertNewObjectForEntityForName:@"MCLDetectionSpell" inManagedObjectContext:moc_];
}

+ (NSString *)entityName {
  return @"MCLDetectionSpell";
}

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)moc_ {
  NSParameterAssert(moc_);
  return [NSEntityDescription entityForName:@"MCLDetectionSpell" inManagedObjectContext:moc_];
}

- (MCLDetectionSpellID *)objectID {
  return (MCLDetectionSpellID *) [super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
  NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

  if ([key isEqualToString:@"activeValue"]) {
    NSSet *affectingKey = [NSSet setWithObject:@"active"];
    keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
  }

  return keyPaths;
}


@dynamic active;


- (BOOL)activeValue {
  NSNumber *result = [self active];
  return [result boolValue];
}

- (void)setActiveValue:(BOOL)value_ {
  [self setActive:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveActiveValue {
  NSNumber *result = [self primitiveActive];
  return [result boolValue];
}

- (void)setPrimitiveActiveValue:(BOOL)value_ {
  [self setPrimitiveActive:[NSNumber numberWithBool:value_]];
}


@dynamic mode;


@end
