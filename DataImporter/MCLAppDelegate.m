//
//  MCLAppDelegate.m
//  DataImporter
//
//  Created by Chris Laprun on 03/18/12.
//  Copyright (c) 2012 Metacosm Concepts Laboratory. All rights reserved.
//

#import "MCLAppDelegate.h"
#import "MCLSkillImporter.h"
#import "MCLSkillCategory.h"

@implementation MCLAppDelegate

@synthesize window = _window;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  MCLSkillImporter *skillImporter = [[MCLSkillImporter alloc] init];
  [skillImporter importSkillsFrom:@"/Users/claprun/Downloads/skills.html"];
  NSDictionary *categories = [MCLSkillCategory categories];
  for (MCLSkillCategory *category in [categories allValues]) {
    NSLog(@"%@", category);
  }

}

@end