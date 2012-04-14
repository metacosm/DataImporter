//
//  CategoryDAO.h
//  DataImporter
//
//  Created by Christophe Laprun on 4/14/12.
//  Copyright (c) 2012 JBoss, a division of Red Hat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NamedDAO;

@interface CategoryDAO : NSManagedObject

@property (nonatomic, retain) NSString * details;
@property (nonatomic, retain) NSSet *items;
@end

@interface CategoryDAO (CoreDataGeneratedAccessors)

- (void)addItemsObject:(NamedDAO *)value;
- (void)removeItemsObject:(NamedDAO *)value;
- (void)addItems:(NSSet *)values;
- (void)removeItems:(NSSet *)values;

@end
