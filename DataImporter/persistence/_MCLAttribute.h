// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MCLAttribute.h instead.

#import <CoreData/CoreData.h>


extern const struct MCLAttributeAttributes {
  NSString *name;
} MCLAttributeAttributes;

extern const struct MCLAttributeRelationships {
} MCLAttributeRelationships;

extern const struct MCLAttributeFetchedProperties {
} MCLAttributeFetchedProperties;


@interface MCLAttributeID : NSManagedObjectID {
}
@end

@interface _MCLAttribute : NSManagedObject {
}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;

+ (NSString *)entityName;

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)moc_;

- (MCLAttributeID *)objectID;


@property(nonatomic, retain) NSString *name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;






@end

@interface _MCLAttribute (CoreDataGeneratedAccessors)

@end

@interface _MCLAttribute (CoreDataGeneratedPrimitiveAccessors)


- (NSString *)primitiveName;

- (void)setPrimitiveName:(NSString *)value;


@end
