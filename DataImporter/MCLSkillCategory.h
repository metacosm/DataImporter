//
//  Created by claprun on 3/22/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface MCLSkillCategory : NSObject {
}

@property(readonly, copy) NSString *name;
@property(readwrite, weak, nonatomic) MCLSkillCategory *parent;

- (id)initWithName:(NSString *)name;

- (void)addSubCategory:(MCLSkillCategory *)category;

+ (MCLSkillCategory *)forName:(NSString *)string;
@end