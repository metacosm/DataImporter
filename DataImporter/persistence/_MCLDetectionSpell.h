// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MCLDetectionSpell.h instead.

#import <CoreData/CoreData.h>
#import "MCLSpell.h"

extern const struct MCLDetectionSpellAttributes {
  __unsafe_unretained NSString *active;
  __unsafe_unretained NSString *mode;
} MCLDetectionSpellAttributes;

extern const struct MCLDetectionSpellRelationships {
} MCLDetectionSpellRelationships;

extern const struct MCLDetectionSpellFetchedProperties {
} MCLDetectionSpellFetchedProperties;


@interface MCLDetectionSpellID : NSManagedObjectID {
}
@end

@interface _MCLDetectionSpell : MCLSpell {
}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;

+ (NSString *)entityName;

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)moc_;

- (MCLDetectionSpellID *)objectID;


@property(nonatomic, strong) NSNumber *active;


@property BOOL activeValue;

- (BOOL)activeValue;

- (void)setActiveValue:(BOOL)value_;

//- (BOOL)validateActive:(id*)value_ error:(NSError**)error_;




@property(nonatomic, strong) NSString *mode;


//- (BOOL)validateMode:(id*)value_ error:(NSError**)error_;






@end

@interface _MCLDetectionSpell (CoreDataGeneratedAccessors)

@end

@interface _MCLDetectionSpell (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber *)primitiveActive;

- (void)setPrimitiveActive:(NSNumber *)value;

- (BOOL)primitiveActiveValue;

- (void)setPrimitiveActiveValue:(BOOL)value_;


- (NSString *)primitiveMode;

- (void)setPrimitiveMode:(NSString *)value;


@end
