//
//  Created by claprun on 3/22/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class MCLSkill;


@interface MCLCategory : NSObject {
}

@property(readonly, copy) NSString *name;
@property(readwrite, weak, nonatomic) MCLCategory *parent;
@property(readonly, strong) NSDictionary *items;

- (id)initWithName:(NSString *)name;

- (void)addSubCategory:(MCLCategory *)category;

- (void)addItem:(id)item;

+ (MCLCategory *)forName:(NSString *)string;

+ (NSDictionary *)categories;
@end