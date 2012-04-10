//
//  Created by claprun on 4/5/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Named.h"

@class MCLCategory;


@interface MCLSpell : NSObject <Named>
@property(nonatomic, readwrite, copy) NSString *name;
@property(nonatomic, readwrite, copy) NSString *type;
@property(nonatomic, readwrite, copy) NSString *range;
@property(nonatomic, readwrite, copy) NSString *duration;
@property(nonatomic, readwrite, copy) NSString *drain;
@property(nonatomic, readwrite, copy) NSString *damage;
@property(nonatomic, readwrite) BOOL direct;
@property(nonatomic, readwrite) BOOL area;
@property(nonatomic, readwrite) BOOL usingElementalEffects;


@property(nonatomic, weak) MCLCategory *category;


- (MCLSpell *)initWithName:(NSString *)string;

+ (MCLSpell *)spellNamed:(NSString *)string;
@end