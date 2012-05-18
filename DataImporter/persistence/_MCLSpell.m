// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MCLSpell.m instead.

#import "_MCLSpell.h"

const struct MCLSpellAttributes MCLSpellAttributes = {
    .area = @"area",
    .damage = @"damage",
    .direct = @"direct",
    .drain = @"drain",
    .duration = @"duration",
    .range = @"range",
    .type = @"type",
    .usingElementalEffects = @"usingElementalEffects",
};

const struct MCLSpellRelationships MCLSpellRelationships = {
};

const struct MCLSpellFetchedProperties MCLSpellFetchedProperties = {
};

@implementation MCLSpellID
@end

@implementation _MCLSpell

+ (id)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
  NSParameterAssert(moc_);
  return [NSEntityDescription insertNewObjectForEntityForName:@"MCLSpell" inManagedObjectContext:moc_];
}

+ (NSString *)entityName {
  return @"MCLSpell";
}

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)moc_ {
  NSParameterAssert(moc_);
  return [NSEntityDescription entityForName:@"MCLSpell" inManagedObjectContext:moc_];
}

- (MCLSpellID *)objectID {
  return (MCLSpellID *) [super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
  NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

  if ([key isEqualToString:@"areaValue"]) {
    NSSet *affectingKey = [NSSet setWithObject:@"area"];
    keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
  }
  if ([key isEqualToString:@"directValue"]) {
    NSSet *affectingKey = [NSSet setWithObject:@"direct"];
    keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
  }
  if ([key isEqualToString:@"usingElementalEffectsValue"]) {
    NSSet *affectingKey = [NSSet setWithObject:@"usingElementalEffects"];
    keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
  }

  return keyPaths;
}


@dynamic area;


- (BOOL)areaValue {
  NSNumber *result = [self area];
  return [result boolValue];
}

- (void)setAreaValue:(BOOL)value_ {
  [self setArea:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveAreaValue {
  NSNumber *result = [self primitiveArea];
  return [result boolValue];
}

- (void)setPrimitiveAreaValue:(BOOL)value_ {
  [self setPrimitiveArea:[NSNumber numberWithBool:value_]];
}


@dynamic damage;


@dynamic direct;


- (BOOL)directValue {
  NSNumber *result = [self direct];
  return [result boolValue];
}

- (void)setDirectValue:(BOOL)value_ {
  [self setDirect:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveDirectValue {
  NSNumber *result = [self primitiveDirect];
  return [result boolValue];
}

- (void)setPrimitiveDirectValue:(BOOL)value_ {
  [self setPrimitiveDirect:[NSNumber numberWithBool:value_]];
}


@dynamic drain;


@dynamic duration;


@dynamic range;


@dynamic type;


@dynamic usingElementalEffects;


- (BOOL)usingElementalEffectsValue {
  NSNumber *result = [self usingElementalEffects];
  return [result boolValue];
}

- (void)setUsingElementalEffectsValue:(BOOL)value_ {
  [self setUsingElementalEffects:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveUsingElementalEffectsValue {
  NSNumber *result = [self primitiveUsingElementalEffects];
  return [result boolValue];
}

- (void)setPrimitiveUsingElementalEffectsValue:(BOOL)value_ {
  [self setPrimitiveUsingElementalEffects:[NSNumber numberWithBool:value_]];
}


@end
