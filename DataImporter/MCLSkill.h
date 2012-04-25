//
//  Created by claprun on 3/22/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Named.h"

@class MCLCategory;


@interface MCLSkill : NSObject <Named>

@property(readonly, copy) NSString *name;
@property(readonly, copy) NSString *attribute;
@property(readwrite, copy, nonatomic) NSString *details;
@property(readwrite, weak, nonatomic) MCLCategory *category;

@property(nonatomic, assign) BOOL canDefault;

@property(nonatomic, strong) NSMutableArray *specializations;

- (id)initWithName:(NSString *)name attribute:(NSString *)attribute;


+ (MCLSkill *)skillNamed:(NSString *)skillName linkedAttribute:(NSString *)attributeName;
@end