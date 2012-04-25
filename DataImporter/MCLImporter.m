//
//  Created by claprun on 25/04/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MCLImporter.h"
#import "MCLCategory.h"


@implementation MCLImporter {

}

@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize managedObjectContext = __managedObjectContext;


// Returns the directory the application uses to store the Core Data store file. This code uses a directory named "info.metacosm.DataImporter" in the user's Downloads directory.
- (NSURL *)applicationFilesDirectory {
  NSFileManager *fileManager = [NSFileManager defaultManager];
  NSURL *appSupportURL = [[fileManager URLsForDirectory:NSDownloadsDirectory inDomains:NSUserDomainMask] lastObject];
  return [appSupportURL URLByAppendingPathComponent:@"info.metacosm.DataImporter"];
}

// Creates if necessary and returns the managed object model for the application.
- (NSManagedObjectModel *)managedObjectModel {
  if (__managedObjectModel) {
    return __managedObjectModel;
  }

  __managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
  return __managedObjectModel;
}

// Returns the persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it. (The directory for the store is created, if necessary.)
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
  if (__persistentStoreCoordinator) {
    return __persistentStoreCoordinator;
  }

  NSManagedObjectModel *mom = [self managedObjectModel];
  if (!mom) {
    NSLog(@"%@:%@ No model to generate a store from", [self class], NSStringFromSelector(_cmd));
    return nil;
  }

  NSFileManager *fileManager = [NSFileManager defaultManager];
  NSURL *applicationFilesDirectory = [self applicationFilesDirectory];
  NSError *error = nil;

  NSDictionary *properties = [applicationFilesDirectory resourceValuesForKeys:[NSArray arrayWithObject:NSURLIsDirectoryKey] error:&error];

  if (!properties) {
    BOOL ok = NO;
    if ([error code] == NSFileReadNoSuchFileError) {
      ok = [fileManager createDirectoryAtPath:[applicationFilesDirectory path] withIntermediateDirectories:YES attributes:nil error:&error];
    }
    if (!ok) {
      [[NSApplication sharedApplication] presentError:error];
      return nil;
    }
  } else {
    if (![[properties objectForKey:NSURLIsDirectoryKey] boolValue]) {
      // Customize and localize this error.
      NSString *failureDescription = [NSString stringWithFormat:@"Expected a folder to store application data, found a file (%@).", [applicationFilesDirectory path]];

      NSMutableDictionary *dict = [NSMutableDictionary dictionary];
      [dict setValue:failureDescription forKey:NSLocalizedDescriptionKey];
      error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:101 userInfo:dict];

      [[NSApplication sharedApplication] presentError:error];
      return nil;
    }
  }

  NSURL *url = [applicationFilesDirectory URLByAppendingPathComponent:@"DataImporter.storedata"];
  NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
  if (![coordinator addPersistentStoreWithType:NSXMLStoreType configuration:nil URL:url options:nil error:&error]) {
    [[NSApplication sharedApplication] presentError:error];
    return nil;
  }
  __persistentStoreCoordinator = coordinator;

  return __persistentStoreCoordinator;
}

// Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
- (NSManagedObjectContext *)managedObjectContext {
  if (__managedObjectContext) {
    return __managedObjectContext;
  }

  NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
  if (!coordinator) {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:@"Failed to initialize the store" forKey:NSLocalizedDescriptionKey];
    [dict setValue:@"There was an error building up the data file." forKey:NSLocalizedFailureReasonErrorKey];
    NSError *error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
    [[NSApplication sharedApplication] presentError:error];
    return nil;
  }
  __managedObjectContext = [[NSManagedObjectContext alloc] init];
  [__managedObjectContext setPersistentStoreCoordinator:coordinator];

  return __managedObjectContext;
}

// Returns the NSUndoManager for the application. In this case, the manager returned is that of the managed object context for the application.
- (NSUndoManager *)windowWillReturnUndoManager:(NSWindow *)window {
  return [[self managedObjectContext] undoManager];
}

// Performs the save action for the application, which is to send the save: message to the application's managed object context. Any encountered errors are presented to the user.
- (IBAction)saveAction:(id)sender {
  NSError *error = nil;

  if (![[self managedObjectContext] commitEditing]) {
    NSLog(@"%@:%@ unable to commit editing before saving", [self class], NSStringFromSelector(_cmd));
  }

  if (![[self managedObjectContext] save:&error]) {
    [[NSApplication sharedApplication] presentError:error];
  }
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender {
  // Save changes in the application's managed object context before the application terminates.

  if (!__managedObjectContext) {
    return NSTerminateNow;
  }

  if (![[self managedObjectContext] commitEditing]) {
    NSLog(@"%@:%@ unable to commit editing to terminate", [self class], NSStringFromSelector(_cmd));
    return NSTerminateCancel;
  }

  if (![[self managedObjectContext] hasChanges]) {
    return NSTerminateNow;
  }

  NSError *error = nil;
  if (![[self managedObjectContext] save:&error]) {

    // Customize this code block to include application-specific recovery steps.
    BOOL result = [sender presentError:error];
    if (result) {
      return NSTerminateCancel;
    }

    NSString *question = NSLocalizedString(@"Could not save changes while quitting. Quit anyway?", @"Quit without saves error question message");
    NSString *info = NSLocalizedString(@"Quitting now will lose any changes you have made since the last successful save", @"Quit without saves error question info");
    NSString *quitButton = NSLocalizedString(@"Quit anyway", @"Quit anyway button title");
    NSString *cancelButton = NSLocalizedString(@"Cancel", @"Cancel button title");
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:question];
    [alert setInformativeText:info];
    [alert addButtonWithTitle:quitButton];
    [alert addButtonWithTitle:cancelButton];

    NSInteger answer = [alert runModal];

    if (answer == NSAlertAlternateReturn) {
      return NSTerminateCancel;
    }
  }

  return NSTerminateNow;
}

- (NSData *)dataFrom:(NSString *)pathOrURL {
  return nil;

}

- (MCLCategory *)subCategoryWithParent:(MCLCategory *)currentCategory named:(NSString *)subCategoryName counter:(int)subCategoryCounter {
  return nil;

}

- (BOOL)matchesSubCategory:(NSString *)currentChildName {
  return [currentChildName isEqualToString:@"hr"];
}

- (id)createElementInCategory:(MCLCategory *)currentCategory subCategory:(MCLCategory *)currentSubCategory from:(NSString *)childText {

  return nil;
}

- (BOOL)isProcessingElement:(id)currentElement withCurrentChildName:(NSString *)currentChildName {

  return currentElement != nil;
}

- (BOOL)doneAfterProcessing:(id)currentElement fromElement:(NSXMLElement *)child withText:(NSString *)childText {
  // NSLog(@"%@", currentElement);
  return YES;
}

- (void)furtherProcessSubCategory:(MCLCategory *)subCategory from:(NSXMLElement *)child withText:(NSString *)childText {
  return;
}

- (NSArray *)importFrom:(NSString *)pathOrURL {
  NSData *data = [self dataFrom:pathOrURL];

  NSXMLDocument *document = [[NSXMLDocument alloc] initWithData:data options:NSXMLDocumentTidyHTML error:nil];

  // html / body / table / tr / td
  // for some reason tr is not the first and only child of the table element (maybe text?)
  NSXMLNode *const content = [[[[[document rootElement] childAtIndex:1] childAtIndex:0] childAtIndex:1] childAtIndex:0];
  NSArray *children = [content children];
  MCLCategory *currentCategory = nil;
  MCLCategory *currentSubCategory = nil;
  id currentElement = nil;
  int globalCategoryCount = 0;
  int globalSubCategoryCount = 0;
  int globalElementCount = 0;
  int subCategoryCounter = 0;

  for (NSXMLElement *child in children) {
    NSString *currentChildName = child.name;

    // skip everything until we find a category
    if (!currentCategory && ![currentChildName isEqualToString:@"h3"]) {
      continue;
    }

    // get the child text
    NSString *childText = [[child stringValue] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    NSLog(@"Looking at %@", childText);

    // we found a category
    if ([currentChildName isEqualToString:@"h3"]) {
      currentCategory = [MCLCategory forName:childText atTopLevel:YES];
//      NSLog(@"Category '%@'", childText);

      globalCategoryCount++;
      subCategoryCounter = 1;
      currentSubCategory = [self subCategoryWithParent:currentCategory named:nil counter:subCategoryCounter++];
      if (currentSubCategory) {
        globalSubCategoryCount++;
      }
      currentElement = nil;

      continue;
    }

    // we found a subcategory
    if (currentCategory && [self matchesSubCategory:currentChildName]) {
      currentSubCategory = [self subCategoryWithParent:currentCategory named:childText counter:subCategoryCounter++];
      if (currentSubCategory) {
        globalSubCategoryCount++;
      }
      currentElement = nil;

      continue;
    }

    // we found an item to import
    if ((currentCategory || currentSubCategory) && [currentChildName isEqualToString:@"h5"]) {
      currentElement = [self createElementInCategory:currentCategory subCategory:currentSubCategory from:childText];

      continue;
    }

    // process the spell details
    if ([self isProcessingElement:currentElement withCurrentChildName:currentChildName]) {
      if ([self doneAfterProcessing:currentElement fromElement:child withText:childText]) {
        globalElementCount++;
        currentElement = nil;
      }

      continue;
    }

    [self furtherProcessSubCategory:currentSubCategory from:child withText:childText];

  }

  NSLog(@"Total Categories: %i", globalCategoryCount);
  NSLog(@"Total Subcategories: %i", globalSubCategoryCount);
  NSLog(@"Total elements: %i", globalElementCount);
  return nil;

}


@end