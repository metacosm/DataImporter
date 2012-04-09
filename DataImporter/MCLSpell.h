//
//  Created by claprun on 4/5/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Named.h"

@class MCLCategory;


@interface MCLSpell : NSObject <Named>
@property(readonly, copy) NSString *name;
@property(readonly, copy) NSString *type;
@property(readonly, copy) NSString *range;
@property(readonly, copy) NSString *duration;
@property(readonly, copy) NSString *drain;
@property(readonly) BOOL direct;
@property(readonly) BOOL area;
@property(readonly) BOOL usingElementalEffects;


@property(nonatomic, weak) MCLCategory *category;

- (MCLSpell *)initWithName:(NSString *)string;

+ (MCLSpell *)spellNamed:(NSString *)string;
@end