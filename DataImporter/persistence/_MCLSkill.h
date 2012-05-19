// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MCLSkill.h instead.

#import <CoreData/CoreData.h>
#import "MCLCategorized.h"

extern const struct MCLSkillAttributes {
  __unsafe_unretained NSString *canDefault;
  __unsafe_unretained NSString *details;
} MCLSkillAttributes;

extern const struct MCLSkillRelationships {
  __unsafe_unretained NSString *attribute;
  __unsafe_unretained NSString *parent;
  __unsafe_unretained NSString *specializations;
} MCLSkillRelationships;

extern const struct MCLSkillFetchedProperties {
} MCLSkillFetchedProperties;

@class MCLAttribute;
@class MCLSkill;
@class MCLSkill;


@interface MCLSkillID : NSManagedObjectID {
}
@end

@interface _MCLSkill : MCLCategorized {
}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;

+ (NSString *)entityName;

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)moc_;

- (MCLSkillID *)objectID;


@property(nonatomic, strong) NSNumber *canDefault;


@property BOOL canDefaultValue;

- (BOOL)canDefaultValue;

- (void)setCanDefaultValue:(BOOL)value_;

//- (BOOL)validateCanDefault:(id*)value_ error:(NSError**)error_;




@property(nonatomic, strong) NSString *details;


//- (BOOL)validateDetails:(id*)value_ error:(NSError**)error_;





@property(nonatomic, strong) MCLAttribute *attribute;

//- (BOOL)validateAttribute:(id*)value_ error:(NSError**)error_;




@property(nonatomic, strong) MCLSkill *parent;

//- (BOOL)validateParent:(id*)value_ error:(NSError**)error_;




@property(nonatomic, strong) NSSet *specializations;

- (NSMutableSet *)specializationsSet;


@end

@interface _MCLSkill (CoreDataGeneratedAccessors)

- (void)addSpecializations:(NSSet *)value_;

- (void)removeSpecializations:(NSSet *)value_;

- (void)addSpecializationsObject:(MCLSkill *)value_;

- (void)removeSpecializationsObject:(MCLSkill *)value_;

@end

@interface _MCLSkill (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber *)primitiveCanDefault;

- (void)setPrimitiveCanDefault:(NSNumber *)value;

- (BOOL)primitiveCanDefaultValue;

- (void)setPrimitiveCanDefaultValue:(BOOL)value_;


- (NSString *)primitiveDetails;

- (void)setPrimitiveDetails:(NSString *)value;


- (MCLAttribute *)primitiveAttribute;

- (void)setPrimitiveAttribute:(MCLAttribute *)value;


- (MCLSkill *)primitiveParent;

- (void)setPrimitiveParent:(MCLSkill *)value;


- (NSMutableSet *)primitiveSpecializations;

- (void)setPrimitiveSpecializations:(NSMutableSet *)value;


@end
