//
//  Created by claprun on 4/5/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Named.h"
#import "_MCLSpell.h"

@class MCLCategory;


@interface MCLSpell : _MCLSpell

+ (MCLSpell *)spellNamed:(NSString *)name inCategory:(MCLCategory *)category;
@end