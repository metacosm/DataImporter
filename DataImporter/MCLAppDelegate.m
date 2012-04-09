//
//  MCLAppDelegate.m
//  DataImporter
//
//  Created by Chris Laprun on 03/18/12.
//  Copyright (c) 2012 Metacosm Concepts Laboratory. All rights reserved.
//

#import "MCLAppDelegate.h"
#import "MCLSkillImporter.h"
#import "MCLCategory.h"
#import "MCLSpellImporter.h"

@implementation MCLAppDelegate

@synthesize window = _window;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  MCLSkillImporter *skillImporter = [[MCLSkillImporter alloc] init];
  [skillImporter importFrom:@"/Users/claprun/Downloads/skills.html"];

  MCLSpellImporter *spellImporter = [[MCLSpellImporter alloc] init];
  [spellImporter importFrom:@"/Users/claprun/Downloads/spells.html"];

  NSDictionary *categories = [MCLCategory categories:YES];
  NSArray *const sortedKeys = [[categories allKeys] sortedArrayUsingSelector:@selector(compare:)];

  for (NSString *key in sortedKeys) {
    NSLog(@"\n%@\n", [categories valueForKey:key]);
  }

}

@end