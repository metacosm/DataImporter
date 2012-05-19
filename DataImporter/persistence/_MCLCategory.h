// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MCLCategory.h instead.

#import <CoreData/CoreData.h>
#import "MCLNamed.h"

extern const struct MCLCategoryAttributes {
  __unsafe_unretained NSString *details;
} MCLCategoryAttributes;

extern const struct MCLCategoryRelationships {
  __unsafe_unretained NSString *items;
  __unsafe_unretained NSString *parent;
  __unsafe_unretained NSString *subCategories;
} MCLCategoryRelationships;

extern const struct MCLCategoryFetchedProperties {
} MCLCategoryFetchedProperties;

@class MCLCategorized;
@class MCLCategory;
@class MCLCategory;


@interface MCLCategoryID : NSManagedObjectID {
}
@end

@interface _MCLCategory : MCLNamed {
}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;

+ (NSString *)entityName;

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)moc_;

- (MCLCategoryID *)objectID;


@property(nonatomic, strong) NSString *details;


//- (BOOL)validateDetails:(id*)value_ error:(NSError**)error_;





@property(nonatomic, strong) NSSet *items;

- (NSMutableSet *)itemsSet;


@property(nonatomic, strong) MCLCategory *parent;

//- (BOOL)validateParent:(id*)value_ error:(NSError**)error_;




@property(nonatomic, strong) NSSet *subCategories;

- (NSMutableSet *)subCategoriesSet;


@end

@interface _MCLCategory (CoreDataGeneratedAccessors)

- (void)addItems:(NSSet *)value_;

- (void)removeItems:(NSSet *)value_;

- (void)addItemsObject:(MCLCategorized *)value_;

- (void)removeItemsObject:(MCLCategorized *)value_;

- (void)addSubCategories:(NSSet *)value_;

- (void)removeSubCategories:(NSSet *)value_;

- (void)addSubCategoriesObject:(MCLCategory *)value_;

- (void)removeSubCategoriesObject:(MCLCategory *)value_;

@end

@interface _MCLCategory (CoreDataGeneratedPrimitiveAccessors)


- (NSString *)primitiveDetails;

- (void)setPrimitiveDetails:(NSString *)value;


- (NSMutableSet *)primitiveItems;

- (void)setPrimitiveItems:(NSMutableSet *)value;


- (MCLCategory *)primitiveParent;

- (void)setPrimitiveParent:(MCLCategory *)value;


- (NSMutableSet *)primitiveSubCategories;

- (void)setPrimitiveSubCategories:(NSMutableSet *)value;


@end
