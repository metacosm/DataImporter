// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MCLSpell.h instead.

#import <CoreData/CoreData.h>
#import "MCLCategorized.h"

extern const struct MCLSpellAttributes {
  NSString *area;
  NSString *damage;
  NSString *direct;
  NSString *drain;
  NSString *duration;
  NSString *range;
  NSString *type;
  NSString *usingElementalEffects;
} MCLSpellAttributes;

extern const struct MCLSpellRelationships {
} MCLSpellRelationships;

extern const struct MCLSpellFetchedProperties {
} MCLSpellFetchedProperties;


@interface MCLSpellID : NSManagedObjectID {
}
@end

@interface _MCLSpell : MCLCategorized {
}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;

+ (NSString *)entityName;

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)moc_;

- (MCLSpellID *)objectID;


@property(nonatomic, retain) NSNumber *area;


@property BOOL areaValue;

- (BOOL)areaValue;

- (void)setAreaValue:(BOOL)value_;

//- (BOOL)validateArea:(id*)value_ error:(NSError**)error_;




@property(nonatomic, retain) NSString *damage;


//- (BOOL)validateDamage:(id*)value_ error:(NSError**)error_;




@property(nonatomic, retain) NSNumber *direct;


@property BOOL directValue;

- (BOOL)directValue;

- (void)setDirectValue:(BOOL)value_;

//- (BOOL)validateDirect:(id*)value_ error:(NSError**)error_;




@property(nonatomic, retain) NSString *drain;


//- (BOOL)validateDrain:(id*)value_ error:(NSError**)error_;




@property(nonatomic, retain) NSString *duration;


//- (BOOL)validateDuration:(id*)value_ error:(NSError**)error_;




@property(nonatomic, retain) NSString *range;


//- (BOOL)validateRange:(id*)value_ error:(NSError**)error_;




@property(nonatomic, retain) NSString *type;


//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;




@property(nonatomic, retain) NSNumber *usingElementalEffects;


@property BOOL usingElementalEffectsValue;

- (BOOL)usingElementalEffectsValue;

- (void)setUsingElementalEffectsValue:(BOOL)value_;

//- (BOOL)validateUsingElementalEffects:(id*)value_ error:(NSError**)error_;






@end

@interface _MCLSpell (CoreDataGeneratedAccessors)

@end

@interface _MCLSpell (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber *)primitiveArea;

- (void)setPrimitiveArea:(NSNumber *)value;

- (BOOL)primitiveAreaValue;

- (void)setPrimitiveAreaValue:(BOOL)value_;


- (NSString *)primitiveDamage;

- (void)setPrimitiveDamage:(NSString *)value;


- (NSNumber *)primitiveDirect;

- (void)setPrimitiveDirect:(NSNumber *)value;

- (BOOL)primitiveDirectValue;

- (void)setPrimitiveDirectValue:(BOOL)value_;


- (NSString *)primitiveDrain;

- (void)setPrimitiveDrain:(NSString *)value;


- (NSString *)primitiveDuration;

- (void)setPrimitiveDuration:(NSString *)value;


- (NSString *)primitiveRange;

- (void)setPrimitiveRange:(NSString *)value;


- (NSString *)primitiveType;

- (void)setPrimitiveType:(NSString *)value;


- (NSNumber *)primitiveUsingElementalEffects;

- (void)setPrimitiveUsingElementalEffects:(NSNumber *)value;

- (BOOL)primitiveUsingElementalEffectsValue;

- (void)setPrimitiveUsingElementalEffectsValue:(BOOL)value_;


@end
