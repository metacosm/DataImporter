//
//  Created by claprun on 3/22/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@protocol Named;


@interface MCLCategory : NSObject {
}

@property(readonly, copy) NSString *name;
@property(readwrite, weak, nonatomic) MCLCategory *parent;
@property(readonly, strong) NSDictionary *items;
@property(readwrite, copy, nonatomic) NSString *details;

- (id)initWithName:(NSString *)name;

- (void)addSubCategory:(MCLCategory *)category;

- (void)addItem:(id <Named>)item;

+ (MCLCategory *)forName:(NSString *)string;

+ (MCLCategory *)forName:(NSString *)name atTopLevel:(BOOL)isTop;

+ (NSDictionary *)categories:(BOOL)topLevelOnly;
@end