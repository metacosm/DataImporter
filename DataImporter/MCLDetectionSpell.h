//
//  Created by claprun on 4/10/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "MCLSpell.h"


@interface MCLDetectionSpell : MCLSpell
@property(readwrite, nonatomic) BOOL active;
@property(readwrite, nonatomic, copy) NSString *mode;
@end