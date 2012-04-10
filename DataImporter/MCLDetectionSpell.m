//
//  Created by claprun on 4/10/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MCLDetectionSpell.h"


@implementation MCLDetectionSpell {

@private
  BOOL _active;
  NSString *_mode;
}
@synthesize active = _active;
@synthesize mode = _mode;

- (NSString *)description {
  NSString *spellDesc = [super description];
  return [spellDesc stringByAppendingFormat:@" Active: %s Mode: %@", self.active ? "Yes" : "No", self.mode];
}


@end