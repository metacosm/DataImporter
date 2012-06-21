//
//  InnerBand
//
//  InnerBand - Making the iOS SDK greater from within!
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

@class CoreDataStore;

#if !defined(__clang__) || __clang_major__ < 3
#ifndef __bridge
#define __bridge
#endif

#ifndef __bridge_retain
#define __bridge_retain
#endif

#ifndef __bridge_retained
#define __bridge_retained
#endif

#ifndef __autoreleasing
#define __autoreleasing
#endif

#ifndef __strong
#define __strong
#endif

#ifndef __unsafe_unretained
#define __unsafe_unretained
#endif

#ifndef __weak
#define __weak
#endif
#endif

#if __has_feature(objc_arc)
#define SAFE_ARC_PROP_RETAIN strong
#define SAFE_ARC_RETAIN(x) (x)
#define SAFE_ARC_RELEASE(x)
#define SAFE_ARC_AUTORELEASE(x) (x)
#define SAFE_ARC_BLOCK_COPY(x) (x)
#define SAFE_ARC_BLOCK_RELEASE(x)
#define SAFE_ARC_SUPER_DEALLOC()
#define SAFE_ARC_AUTORELEASE_POOL_START() @autoreleasepool {
#define SAFE_ARC_AUTORELEASE_POOL_END() }
#else
    #define SAFE_ARC_PROP_RETAIN retain
    #define SAFE_ARC_RETAIN(x) ([(x) retain])
    #define SAFE_ARC_RELEASE(x) ([(x) release])
    #define SAFE_ARC_AUTORELEASE(x) ([(x) autorelease])
    #define SAFE_ARC_BLOCK_COPY(x) (Block_copy(x))
    #define SAFE_ARC_BLOCK_RELEASE(x) (Block_release(x))
    #define SAFE_ARC_SUPER_DEALLOC() ([super dealloc])
    #define SAFE_ARC_AUTORELEASE_POOL_START() NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    #define SAFE_ARC_AUTORELEASE_POOL_END() [pool release];
#endif


#if __has_feature(objc_arc)
#define SAFE_RELEASE(obj)
#define SAFE_TIMER_RELEASE(obj)
#else
    #define SAFE_RELEASE(obj) ([obj release], obj = nil)
    #define SAFE_TIMER_RELEASE(obj) ([obj invalidate], [obj release], obj = nil)
#endif


#define SEL(x) @selector(x)
#define L(key) (NSLocalizedString((key), nil))


typedef NSInteger (^ib_enum_bool_t)(id);

typedef id (^ib_enum_id_t)(id);

typedef void (^ib_http_proc_t)(NSData *, NSInteger);


#import <Foundation/Foundation.h>

@interface NSArray (InnerBand)

- (NSArray *)sortedArrayAsDiacriticInsensitiveCaseInsensitive;

- (NSArray *)sortedArrayAsDiacriticInsensitive;

- (NSArray *)sortedArrayAsCaseInsensitive;

- (NSArray *)sortedArray;

- (NSArray *)reversedArray;

- (NSArray *)shuffledArray;

- (id)firstObject;

- (NSArray *)map:(ib_enum_id_t)blk;

@end


@interface NSDate (InnerBand)

@property(nonatomic, readonly) NSInteger utcYear;
@property(nonatomic, readonly) NSInteger utcMonth;
@property(nonatomic, readonly) NSInteger utcDay;
@property(nonatomic, readonly) NSInteger utcHour;
@property(nonatomic, readonly) NSInteger utcMinute;
@property(nonatomic, readonly) NSInteger utcSecond;

@property(nonatomic, readonly) NSInteger year;
@property(nonatomic, readonly) NSInteger month;
@property(nonatomic, readonly) NSInteger day;
@property(nonatomic, readonly) NSInteger hour;
@property(nonatomic, readonly) NSInteger minute;
@property(nonatomic, readonly) NSInteger second;

+ (NSDate *)dateDaysAgo:(NSInteger)numDays;

+ (NSDate *)dateWeeksAgo:(NSInteger)numWeeks;

- (NSString *)formattedDateStyle:(NSDateFormatterStyle)dateStyle;

- (NSString *)formattedTimeStyle:(NSDateFormatterStyle)timeStyle;

- (NSString *)formattedDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;

- (NSString *)formattedDatePattern:(NSString *)datePattern;

- (NSString *)formattedUTCDateStyle:(NSDateFormatterStyle)dateStyle;

- (NSString *)formattedUTCTimeStyle:(NSDateFormatterStyle)timeStyle;

- (NSString *)formattedUTCDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;

- (NSString *)formattedUTCDatePattern:(NSString *)datePattern;

- (NSDate *)dateAsMidnight;

- (BOOL)isSameDay:(NSDate *)rhs;

@end


#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface NSManagedObject (InnerBand)


+ (id)create;

+ (id)createInStore:(CoreDataStore *)store;


+ (NSArray *)all;

+ (NSArray *)allForPredicate:(NSPredicate *)predicate;

+ (NSArray *)allForPredicate:(NSPredicate *)predicate orderBy:(NSString *)key ascending:(BOOL)ascending;

+ (NSArray *)allOrderedBy:(NSString *)key ascending:(BOOL)ascending;

+ (NSArray *)allInStore:(CoreDataStore *)store;

+ (NSArray *)allForPredicate:(NSPredicate *)predicate inStore:(CoreDataStore *)store;

+ (NSArray *)allForPredicate:(NSPredicate *)predicate orderBy:(NSString *)key ascending:(BOOL)ascending inStore:(CoreDataStore *)store;

+ (NSArray *)allOrderedBy:(NSString *)key ascending:(BOOL)ascending inStore:(CoreDataStore *)store;

+ (id)first;

+ (id)firstWithKey:(NSString *)key value:(NSObject *)value;

+ (id)firstInStore:(CoreDataStore *)store;

+ (id)firstWithKey:(NSString *)key value:(NSObject *)value inStore:(CoreDataStore *)store;


+ (void)destroyAll;

+ (void)destroyAllInStore:(CoreDataStore *)store;

- (void)destroy;

@end


#import <Foundation/Foundation.h>

@interface NSMutableArray (InnerBand)

+ (NSMutableArray *)arrayUnretaining;

- (void)sortDiacriticInsensitiveCaseInsensitive;

- (void)sortDiacriticInsensitive;

- (void)sortCaseInsensitive;

- (void)pushObject:(id)obj;

- (id)popObject;

- (id)shiftObject;

- (void)unshiftObject:(id)obj;

- (void)deleteIf:(ib_enum_bool_t)blk;

- (void)shuffle;

- (void)reverse;

@end


#import <Foundation/Foundation.h>

@interface NSMutableString (InnerBand)

- (void)trim;

@end


@interface NSNumber (InnerBand)

- (NSString *)formattedCurrency;

- (NSString *)formattedFlatCurrency;

- (NSString *)formattedCurrencyWithMinusSign;

- (NSString *)formattedDecimal;

- (NSString *)formattedFlatDecimal;

- (NSString *)formattedSpellOut;

@end


@interface NSObject (InnerBand)

- (id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3;

- (id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3 withObject:(id)p4;

- (void)performSelectorInBackground:(SEL)selector withObject:(id)p1 withObject:(id)p2;

- (void)performSelectorInBackground:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3;

- (void)performSelectorInBackground:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3 withObject:(id)p4;

@end


#import <Foundation/Foundation.h>


@interface NSString (InnerBand)

- (NSComparisonResult)diacriticInsensitiveCaseInsensitiveSort:(NSString *)rhs;

- (NSComparisonResult)diacriticInsensitiveSort:(NSString *)rhs;

- (NSComparisonResult)caseInsensitiveSort:(NSString *)rhs;

- (NSString *)asBundlePath;

- (NSString *)asDocumentsPath;

- (BOOL)contains:(NSString *)substring;

- (BOOL)contains:(NSString *)substring options:(NSStringCompareOptions)options;

- (NSString *)trimmedString;

@end


#import <Foundation/Foundation.h>

typedef enum {
  kGTMXMLCharModeEncodeQUOT = 0,
  kGTMXMLCharModeEncodeAMP = 1,
  kGTMXMLCharModeEncodeAPOS = 2,
  kGTMXMLCharModeEncodeLT = 3,
  kGTMXMLCharModeEncodeGT = 4,
  kGTMXMLCharModeValid = 99,
  kGTMXMLCharModeInvalid = 100,
} IBXMLCharMode;

@interface NSString (XMLEncoding)

- (NSString *)stringWithXMLSanitizingAndEscaping;

- (NSString *)stringWithXMLSanitizing;

@end


#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataStore : NSObject {
  NSManagedObjectContext *_managedObjectContext;
}

@property(nonatomic, readonly) NSManagedObjectContext *context;

+ (CoreDataStore *)mainStore;

+ (CoreDataStore *)createStore;

+ (CoreDataStore *)createStoreWithContext:(NSManagedObjectContext *)context;

- (id)initWithContext:(NSManagedObjectContext *)context;

/* Clears all data from peristent store and re-initializes (great for unit testing!) */
- (void)clearAllData;

/* Saves context. */
- (void)save;

/* Create a new entity by name. */
- (NSManagedObject *)createNewEntityByName:(NSString *)entityName;

/* Remove entity. */
- (void)removeEntity:(NSManagedObject *)entity;

/* Remove all objects of an entity. */
- (void)removeAllEntitiesByName:(NSString *)entityName;


/* Returns ALL objects for an entity. */
- (NSArray *)allForEntity:(NSString *)entityName error:(NSError **)error;

/* Returns ALL objects for an entity given a predicate. */
- (NSArray *)allForEntity:(NSString *)entityName predicate:(NSPredicate *)predicate error:(NSError **)error;

/* Returns ALL objects for an entity given a predicate and sorting. */
- (NSArray *)allForEntity:(NSString *)entityName predicate:(NSPredicate *)predicate orderBy:(NSString *)key ascending:(BOOL)ascending error:(NSError **)error;

/* Returns ALL objects for an entity ordered by a field. */
- (NSArray *)allForEntity:(NSString *)entityName orderBy:(NSString *)key ascending:(BOOL)ascending error:(NSError **)error;


/* Returns a single entity by name. */
- (NSManagedObject *)entityByName:(NSString *)entityName error:(NSError **)error;

/* Returns a single entity with the specified key/value. */
- (NSManagedObject *)entityByName:(NSString *)entityName key:(NSString *)key value:(NSObject *)value error:(NSError **)error;


/* Returns object based on URI representation. */
- (NSManagedObject *)entityByURI:(NSURL *)uri;

/* Returns object based on Object ID. */
- (NSManagedObject *)entityByObjectID:(NSManagedObjectID *)oid;


/* Returns an entity description by name. */
- (NSEntityDescription *)entityDescriptionForEntity:(NSString *)entityName;


@end


#import <Foundation/Foundation.h>


@interface DispatchMessage : NSObject {
  NSMutableDictionary *userInfo_;
}

@property(nonatomic, copy, readonly) NSString *name;
@property(nonatomic, readonly) NSDictionary *userInfo;
@property(nonatomic, assign, getter=isAsynchronous) BOOL asynchronous;

- (id)initWithName:(NSString *)name userInfo:(NSDictionary *)userInfo;

- (id)initWithName:(NSString *)name andObjectsAndKeys:(id)firstObject, ... NS_REQUIRES_NIL_TERMINATION;

+ (id)messageWithName:(NSString *)name userInfo:(NSDictionary *)userInfo;

+ (id)messageWithName:(NSString *)name andObjectsAndKeys:(id)firstObject, ... NS_REQUIRES_NIL_TERMINATION;

- (NSString *)name;

- (NSDictionary *)userInfo;

- (void)setUserInfoValue:(id)value forKey:(NSString *)key;

- (void)inputData:(NSData *)input;

- (NSData *)outputData;

@end


#import <Foundation/Foundation.h>

@class DispatchMessage;

@interface MessageCenter : NSObject {
}

+ (NSInteger)getCountOfListeningSources;

+ (void)setDebuggingEnabled:(BOOL)enabled;

+ (BOOL)isDebuggingEnabled;

+ (void)addGlobalMessageListener:(NSString *)name target:(NSObject *)target action:(SEL)action;

+ (void)addMessageListener:(NSString *)name source:(NSObject *)source target:(NSObject *)target action:(SEL)action;

+ (void)removeMessageListener:(NSString *)name source:(NSObject *)source target:(NSObject *)target action:(SEL)action;

+ (void)removeMessageListener:(NSString *)name source:(NSObject *)source target:(NSObject *)target;

+ (void)removeMessageListener:(NSString *)name target:(NSObject *)target action:(SEL)action;

+ (void)removeMessageListenersForTarget:(NSObject *)name;

+ (void)sendGlobalMessage:(DispatchMessage *)message;

+ (void)sendGlobalMessageNamed:(NSString *)name;

+ (void)sendGlobalMessageNamed:(NSString *)name withUserInfo:(NSDictionary *)userInfo;

+ (void)sendGlobalMessageNamed:(NSString *)name withUserInfoKey:(NSObject *)key andValue:(NSObject *)value;

+ (void)sendGlobalMessageNamed:(NSString *)name withObjectsAndKeys:(id)firstObject, ... NS_REQUIRES_NIL_TERMINATION;

+ (void)sendMessage:(DispatchMessage *)message forSource:(NSObject *)source;

+ (void)sendMessageNamed:(NSString *)name forSource:(NSObject *)source;

+ (void)sendMessageNamed:(NSString *)name withUserInfo:(NSDictionary *)userInfo forSource:(NSObject *)source;

+ (void)sendMessageNamed:(NSString *)name withUserInfoKey:(NSObject *)key andValue:(NSObject *)value forSource:(NSObject *)source;

+ (void)sendMessageNamed:(NSString *)name forSource:(NSObject *)source withObjectsAndKeys:(id)firstObject, ... NS_REQUIRES_NIL_TERMINATION;

@end


#import <Foundation/Foundation.h>

@class DispatchMessage;

@interface MessageProcessor : NSObject {
  DispatchMessage *_message;
  NSArray *_targetActions;
}

- (id)initWithMessage:(DispatchMessage *)message targetActions:(NSArray *)targetActions;

- (void)process;

@end


#import <Foundation/Foundation.h>

@interface TargetAction : NSObject

@property(nonatomic, assign) NSObject *target;
@property(nonatomic, copy) NSString *action;

@end


@interface BlockBasedDispatchMessage : DispatchMessage {

  void (^inputBlock_)(NSData *);

  NSData *(^outputBlock_)(void);

}

+ (id)messageWithName:(NSString *)name isAsynchronous:(BOOL)isAsync input:(void (^)(NSData *))inputBlock output:(NSData * (^)(void))outputBlock;

@end


#import <Foundation/Foundation.h>

/*
 * 
 * MessageCenter will dispatch an HTTPGetRequestMessage after it processes the URL request you provide it.
 * When specifying a URL, you can provide substitution parameters using the syntax [MYPARAM] and
 * then providing the values for those parameters in the userInfo dictionary.
 *
 * INPUT: none
 * OUTPUT: the HTTP response data on success, nil on error
 *
 * USER INFO:
 *    HTTP_STATUS_CODE - HTTP status code of result
 *
 */

#define HTTP_STATUS_CODE @"HTTP_STATUS_CODE"

@interface HTTPGetRequestMessage : DispatchMessage {
  NSString *_url;
  NSMutableData *_responseData;
  NSMutableDictionary *_headersDict;
  ib_http_proc_t _processBlock;
}

+ (id)messageWithName:(NSString *)name userInfo:(NSDictionary *)userInfo url:(NSString *)url;

+ (id)messageWithName:(NSString *)name userInfo:(NSDictionary *)userInfo url:(NSString *)url processBlock:(ib_http_proc_t)processBlock;

- (void)addHeaderValue:(NSString *)value forKey:(NSString *)key;

@end


#import <Foundation/Foundation.h>

#define HTTP_STATUS_CODE @"HTTP_STATUS_CODE"

@interface HTTPPostRequestMessage : DispatchMessage {
  NSString *_url;
  NSString *_body;
  NSMutableData *_responseData;
  NSMutableDictionary *_headersDict;
  ib_http_proc_t _processBlock;
}

+ (id)messageWithName:(NSString *)name userInfo:(NSDictionary *)userInfo url:(NSString *)url body:(NSString *)body;

+ (id)messageWithName:(NSString *)name userInfo:(NSDictionary *)userInfo url:(NSString *)url body:(NSString *)body processBlock:(ib_http_proc_t)processBlock;

- (void)addHeaderValue:(NSString *)value forKey:(NSString *)key;

@end


#import <Foundation/Foundation.h>

@interface SequencedMessage : DispatchMessage {
  NSMutableArray *_messageSequence;
  NSData *_outputOfLastMessage;
}

- (id)initWithName:(NSString *)name userInfo:(NSDictionary *)userInfo sequence:(NSArray *)messageSequence;

+ (id)messageWithName:(NSString *)name userInfo:(NSDictionary *)userInfo sequence:(NSArray *)messageSequence;

@end

