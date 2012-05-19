// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MCLSpell.h instead.

#import <CoreData/CoreData.h>
#import "MCLCategorized.h"

extern const struct MCLSpellAttributes {
  __unsafe_unretained NSString *area;
  __unsafe_unretained NSString *damage;
  __unsafe_unretained NSString *direct;
  __unsafe_unretained NSString *drain;
  __unsafe_unretained NSString *duration;
  __unsafe_unretained NSString *range;
  __unsafe_unretained NSString *type;
  __unsafe_unretained NSString *usingElementalEffects;
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


@property(nonatomic, strong) NSNumber *area;


@property BOOL areaValue;

- (BOOL)areaValue;

- (void)setAreaValue:(BOOL)value_;

//- (BOOL)validateArea:(id*)value_ error:(NSError**)error_;




@property(nonatomic, strong) NSString *damage;


//- (BOOL)validateDamage:(id*)value_ error:(NSError**)error_;




@property(nonatomic, strong) NSNumber *direct;


@property BOOL directValue;

- (BOOL)directValue;

- (void)setDirectValue:(BOOL)value_;

//- (BOOL)validateDirect:(id*)value_ error:(NSError**)error_;




@property(nonatomic, strong) NSString *drain;


//- (BOOL)validateDrain:(id*)value_ error:(NSError**)error_;




@property(nonatomic, strong) NSString *duration;


//- (BOOL)validateDuration:(id*)value_ error:(NSError**)error_;




@property(nonatomic, strong) NSString *range;


//- (BOOL)validateRange:(id*)value_ error:(NSError**)error_;




@property(nonatomic, strong) NSString *type;


//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;




@property(nonatomic, strong) NSNumber *usingElementalEffects;


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
