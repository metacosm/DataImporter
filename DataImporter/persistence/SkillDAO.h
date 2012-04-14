//
//  SkillDAO.h
//  DataImporter
//
//  Created by Christophe Laprun on 4/14/12.
//  Copyright (c) 2012 JBoss, a division of Red Hat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SkillDAO;

@interface SkillDAO : NSManagedObject

@property (nonatomic, retain) NSString * details;
@property (nonatomic) BOOL canDefault;
@property (nonatomic, retain) SkillDAO *parent;
@property (nonatomic, retain) NSSet *specializations;
@property (nonatomic, retain) NSManagedObject *attribute;
@end

@interface SkillDAO (CoreDataGeneratedAccessors)

- (void)addSpecializationsObject:(SkillDAO *)value;
- (void)removeSpecializationsObject:(SkillDAO *)value;
- (void)addSpecializations:(NSSet *)values;
- (void)removeSpecializations:(NSSet *)values;

@end
