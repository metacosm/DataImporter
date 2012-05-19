// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MCLNamed.h instead.

#import <CoreData/CoreData.h>


extern const struct MCLNamedAttributes {
  __unsafe_unretained NSString *name;
} MCLNamedAttributes;

extern const struct MCLNamedRelationships {
} MCLNamedRelationships;

extern const struct MCLNamedFetchedProperties {
} MCLNamedFetchedProperties;


@interface MCLNamedID : NSManagedObjectID {
}
@end

@interface _MCLNamed : NSManagedObject {
}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;

+ (NSString *)entityName;

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)moc_;

- (MCLNamedID *)objectID;


@property(nonatomic, strong) NSString *name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;






@end

@interface _MCLNamed (CoreDataGeneratedAccessors)

@end

@interface _MCLNamed (CoreDataGeneratedPrimitiveAccessors)


- (NSString *)primitiveName;

- (void)setPrimitiveName:(NSString *)value;


@end
