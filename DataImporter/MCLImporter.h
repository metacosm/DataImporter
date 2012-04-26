//
//  Created by claprun on 25/04/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

typedef enum {
  SKILLS,
  SPELLS,
  UNKNOWN
} ImporterType;

static NSString *const SR4 = @"SR4";

@interface MCLImporter : NSObject

- (NSArray *)importFrom:(NSString *)pathOrURL;

- (NSString *)typeAsString;

@property(readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property(readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property(readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property(readonly, nonatomic) NSString *version;
@property(readonly, nonatomic) ImporterType type;

+ (void)import:(ImporterType)type from:(NSString *)pathOrURL withVersion:(NSString *)dataVersion;
@end