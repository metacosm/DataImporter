//
//  Created by claprun on 3/22/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class MCLSkill;


@interface MCLSkillCategory : NSObject {
}

@property(readonly, copy) NSString *name;
@property(readwrite, weak, nonatomic) MCLSkillCategory *parent;
@property(readonly, strong) NSDictionary *skills;

- (id)initWithName:(NSString *)name;

- (void)addSubCategory:(MCLSkillCategory *)category;

- (void)addSkill:(MCLSkill *)skill;

+ (MCLSkillCategory *)forName:(NSString *)string;

+ (NSDictionary *)categories;
@end