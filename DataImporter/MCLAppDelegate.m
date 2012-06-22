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

@implementation MCLAppDelegate

@synthesize window = _window;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  [MCLImporter import:SKILLS from:@"/Users/claprun/Downloads/skills.html" withVersion:SR4];
  [MCLImporter import:SPELLS from:@"/Users/claprun/Downloads/spells.html" withVersion:SR4];

  NSArray *const categories = [[MCLCategory categories:YES] sortedArrayUsingSelector:@selector(compare:)];

  for (NSString *category in categories) {
    NSLog(@"\n%@\n", category);
  }

}

@end