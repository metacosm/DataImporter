// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MCLCategorized.h instead.

#import <CoreData/CoreData.h>
#import "MCLNamed.h"

extern const struct MCLCategorizedAttributes {
} MCLCategorizedAttributes;

extern const struct MCLCategorizedRelationships {
  __unsafe_unretained NSString *category;
} MCLCategorizedRelationships;

extern const struct MCLCategorizedFetchedProperties {
} MCLCategorizedFetchedProperties;

@class MCLCategory;


@interface MCLCategorizedID : NSManagedObjectID {
}
@end

@interface _MCLCategorized : MCLNamed {
}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;

+ (NSString *)entityName;

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)moc_;

- (MCLCategorizedID *)objectID;


@property(nonatomic, strong) MCLCategory *category;

//- (BOOL)validateCategory:(id*)value_ error:(NSError**)error_;





@end

@interface _MCLCategorized (CoreDataGeneratedAccessors)

@end

@interface _MCLCategorized (CoreDataGeneratedPrimitiveAccessors)


- (MCLCategory *)primitiveCategory;

- (void)setPrimitiveCategory:(MCLCategory *)value;


@end
