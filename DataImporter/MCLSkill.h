//
//  Created by claprun on 3/22/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "_MCLSkill.h"

@class MCLCategory;


@interface MCLSkill : _MCLSkill

+ (MCLSkill *)skillNamed:(NSString *)skillName linkedAttributeNamed:(NSString *)attributeName;

- (void)addSpecialization:(NSString *)specializationName;
@end