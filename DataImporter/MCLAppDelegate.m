//
//  MCLAppDelegate.m
//  DataImporter
//
//  Created by Chris Laprun on 03/18/12.
//  Copyright (c) 2012 Metacosm Concepts Laboratory. All rights reserved.
//

#import "MCLAppDelegate.h"
#import "MCLSkillImporter.h"

@implementation MCLAppDelegate

@synthesize window = _window;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  [MCLImporter import:SKILLS from:@"/Users/claprun/Downloads/skills.html" withVersion:SR4];
  [MCLImporter import:SPELLS from:@"/Users/claprun/Downloads/spells.html" withVersion:SR4];

  /*NSDictionary *categories = [MCLCategory categories:YES];
  NSArray *const sortedKeys = [[categories allKeys] sortedArrayUsingSelector:@selector(compare:)];

  for (NSString *key in sortedKeys) {
    NSLog(@"\n%@\n", [categories valueForKey:key]);
  }*/

}

@end