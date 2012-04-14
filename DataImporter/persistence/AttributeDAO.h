//
//  AttributeDAO.h
//  DataImporter
//
//  Created by Christophe Laprun on 4/14/12.
//  Copyright (c) 2012 JBoss, a division of Red Hat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface AttributeDAO : NSManagedObject

@property (nonatomic, retain) NSString * name;

@end
