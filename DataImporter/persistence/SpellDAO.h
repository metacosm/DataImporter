//
//  SpellDAO.h
//  DataImporter
//
//  Created by Christophe Laprun on 4/14/12.
//  Copyright (c) 2012 JBoss, a division of Red Hat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface SpellDAO : NSManagedObject

@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * range;
@property (nonatomic, retain) NSString * duration;
@property (nonatomic, retain) NSString * drain;
@property (nonatomic, retain) NSString * damage;
@property (nonatomic) BOOL direct;
@property (nonatomic) BOOL area;
@property (nonatomic) BOOL usingElementalEffects;

@end
