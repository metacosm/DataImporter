//
//  Created by claprun on 3/22/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "_MCLCategory.h"

@protocol Named;
@class MCLCategorized;


@interface MCLCategory : _MCLCategory {
}
- (void)addSubCategory:(MCLCategory *)category;

- (void)addItem:(MCLCategorized *)item;

+ (NSArray *)categories:(BOOL)topLevelOnly;

+ (MCLCategory *)forName:(NSString *)string withParent:(MCLCategory *)category;
@end