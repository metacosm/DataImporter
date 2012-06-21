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

#import "InnerBandCore.h"


NSNumber *BOX_INT(NSInteger x) {
  return [NSNumber numberWithInt:x];
}


NSString *DOCUMENTS_DIR(void) {
  return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


@implementation NSArray (InnerBand)

- (NSArray *)sortedArrayAsDiacriticInsensitiveCaseInsensitive {
  return [self sortedArrayUsingSelector:@selector(diacriticInsensitiveCaseInsensitiveSort:)];
}

- (NSArray *)sortedArrayAsDiacriticInsensitive {
  return [self sortedArrayUsingSelector:@selector(diacriticInsensitiveSort:)];
}

- (NSArray *)sortedArrayAsCaseInsensitive {
  return [self sortedArrayUsingSelector:@selector(caseInsensitiveSort:)];
}

- (NSArray *)sortedArray {
  return [self sortedArrayUsingSelector:@selector(compare:)];
}

- (NSArray *)reversedArray {
  NSMutableArray *reversedArray = [NSMutableArray arrayWithCapacity:self.count];
  NSEnumerator *enumerator = [self reverseObjectEnumerator];

  for (id iObject in enumerator) {
    [reversedArray addObject:iObject];
  }

  return SAFE_ARC_AUTORELEASE([reversedArray copy]);
}

- (NSArray *)shuffledArray {
  NSMutableArray *shuffledArray = [NSMutableArray arrayWithArray:self];

  [shuffledArray shuffle];

  return SAFE_ARC_AUTORELEASE([shuffledArray copy]);
}

- (id)firstObject {
  return (self.count > 0) ? [self objectAtIndex:0] : nil;
}

#pragma mark -


- (NSArray *)map:(ib_enum_id_t)blk {
  NSMutableArray *mappedArray = [NSMutableArray array];

  for (NSInteger i = (self.count - 1); i >= 0; --i) {
    [mappedArray unshiftObject:blk([self objectAtIndex:i])];
  }

  return mappedArray;
}

@end


@implementation NSDate (InnerBand)

+ (NSDate *)dateDaysAgo:(NSInteger)numDays {
  NSCalendar *_calendar = [NSCalendar currentCalendar];
  NSDateComponents *_datecomp = [_calendar components:NSDayCalendarUnit fromDate:[NSDate date]];
  [_datecomp setDay:[_datecomp day] - numDays];
  return [_calendar dateFromComponents:_datecomp];
}

+ (NSDate *)dateWeeksAgo:(NSInteger)numWeeks {
  NSCalendar *_calendar = [NSCalendar currentCalendar];
  NSDateComponents *_datecomp = [_calendar components:NSWeekCalendarUnit fromDate:[NSDate date]];
  [_datecomp setWeek:[_datecomp week] - numWeeks];
  return [_calendar dateFromComponents:_datecomp];
}

- (NSInteger)utcYear {
  NSCalendar *_calendar = [NSCalendar currentCalendar];
  [_calendar setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
  NSDateComponents *_datecomp = [_calendar components:NSYearCalendarUnit fromDate:self];
  return [_datecomp year];
}

- (NSInteger)utcMonth {
  NSCalendar *_calendar = [NSCalendar currentCalendar];
  [_calendar setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
  NSDateComponents *_datecomp = [_calendar components:NSMonthCalendarUnit fromDate:self];
  return [_datecomp month];
}

- (NSInteger)utcDay {
  NSCalendar *_calendar = [NSCalendar currentCalendar];
  [_calendar setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
  NSDateComponents *_datecomp = [_calendar components:NSDayCalendarUnit fromDate:self];
  return [_datecomp day];
}

- (NSInteger)utcHour {
  NSCalendar *_calendar = [NSCalendar currentCalendar];
  [_calendar setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
  NSDateComponents *_datecomp = [_calendar components:NSHourCalendarUnit fromDate:self];
  return [_datecomp hour];
}

- (NSInteger)utcMinute {
  NSCalendar *_calendar = [NSCalendar currentCalendar];
  [_calendar setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
  NSDateComponents *_datecomp = [_calendar components:NSMinuteCalendarUnit fromDate:self];
  return [_datecomp minute];
}

- (NSInteger)utcSecond {
  NSCalendar *_calendar = [NSCalendar currentCalendar];
  [_calendar setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
  NSDateComponents *_datecomp = [_calendar components:NSSecondCalendarUnit fromDate:self];
  return [_datecomp second];
}

- (NSInteger)year {
  NSCalendar *_calendar = [NSCalendar currentCalendar];
  NSDateComponents *_datecomp = [_calendar components:NSYearCalendarUnit fromDate:self];
  return [_datecomp year];
}

- (NSInteger)month {
  NSCalendar *_calendar = [NSCalendar currentCalendar];
  NSDateComponents *_datecomp = [_calendar components:NSMonthCalendarUnit fromDate:self];
  return [_datecomp month];
}

- (NSInteger)day {
  NSCalendar *_calendar = [NSCalendar currentCalendar];
  NSDateComponents *_datecomp = [_calendar components:NSDayCalendarUnit fromDate:self];
  return [_datecomp day];
}

- (NSInteger)hour {
  NSCalendar *_calendar = [NSCalendar currentCalendar];
  NSDateComponents *_datecomp = [_calendar components:NSHourCalendarUnit fromDate:self];
  return [_datecomp hour];
}

- (NSInteger)minute {
  NSCalendar *_calendar = [NSCalendar currentCalendar];
  NSDateComponents *_datecomp = [_calendar components:NSMinuteCalendarUnit fromDate:self];
  return [_datecomp minute];
}

- (NSInteger)second {
  NSCalendar *_calendar = [NSCalendar currentCalendar];
  NSDateComponents *_datecomp = [_calendar components:NSSecondCalendarUnit fromDate:self];
  return [_datecomp second];
}

- (NSString *)formattedUTCDateStyle:(NSDateFormatterStyle)dateStyle {
  NSDateFormatter *format = SAFE_ARC_AUTORELEASE([[NSDateFormatter alloc] init]);

  [format setDateStyle:dateStyle];
  [format setTimeStyle:NSDateFormatterNoStyle];
  [format setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];

  return [format stringFromDate:self];
}

- (NSString *)formattedUTCTimeStyle:(NSDateFormatterStyle)timeStyle {
  NSDateFormatter *format = SAFE_ARC_AUTORELEASE([[NSDateFormatter alloc] init]);

  [format setDateStyle:NSDateFormatterNoStyle];
  [format setTimeStyle:timeStyle];
  [format setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];

  return [format stringFromDate:self];
}

- (NSString *)formattedUTCDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle {
  NSDateFormatter *format = SAFE_ARC_AUTORELEASE([[NSDateFormatter alloc] init]);

  [format setDateStyle:dateStyle];
  [format setTimeStyle:timeStyle];
  [format setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];

  return [format stringFromDate:self];
}

- (NSString *)formattedUTCDatePattern:(NSString *)datePattern {
  //
  // format document: http://unicode.org/reports/tr35/tr35-6.html#Date_Format_Patterns
  //
  NSDateFormatter *format = SAFE_ARC_AUTORELEASE([[NSDateFormatter alloc] init]);

  [format setDateFormat:datePattern];
  [format setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];

  return [format stringFromDate:self];
}

- (NSString *)formattedDateStyle:(NSDateFormatterStyle)dateStyle {
  NSDateFormatter *format = SAFE_ARC_AUTORELEASE([[NSDateFormatter alloc] init]);

  [format setDateStyle:dateStyle];
  [format setTimeStyle:NSDateFormatterNoStyle];

  return [format stringFromDate:self];
}

- (NSString *)formattedTimeStyle:(NSDateFormatterStyle)timeStyle {
  NSDateFormatter *format = SAFE_ARC_AUTORELEASE([[NSDateFormatter alloc] init]);

  [format setDateStyle:NSDateFormatterNoStyle];
  [format setTimeStyle:timeStyle];

  return [format stringFromDate:self];
}

- (NSString *)formattedDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle {
  NSDateFormatter *format = SAFE_ARC_AUTORELEASE([[NSDateFormatter alloc] init]);

  [format setDateStyle:dateStyle];
  [format setTimeStyle:timeStyle];

  return [format stringFromDate:self];
}

- (NSString *)formattedDatePattern:(NSString *)datePattern {
  //
  // format document: http://unicode.org/reports/tr35/tr35-6.html#Date_Format_Patterns
  //
  NSDateFormatter *format = SAFE_ARC_AUTORELEASE([[NSDateFormatter alloc] init]);

  [format setDateFormat:datePattern];

  return [format stringFromDate:self];
}

- (NSDate *)dateAsMidnight {
  NSCalendar *_calendar = [NSCalendar currentCalendar];
  [_calendar setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
  NSDateComponents *_datecomp = [_calendar components:NSMonthCalendarUnit | NSDayCalendarUnit | NSYearCalendarUnit fromDate:self];
  return [_calendar dateFromComponents:_datecomp];
}

- (BOOL)isSameDay:(NSDate *)rhs {
  NSCalendar *calendar = [NSCalendar currentCalendar];
  NSDateComponents *comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:self];
  NSDateComponents *compsRHS = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:rhs];

  return [comps year] == [compsRHS year] && [comps month] == [compsRHS month] && [comps day] == [compsRHS day];
}

@end


#import <objc/runtime.h>

@class CoreDataStore;

@implementation NSManagedObject (InnerBand)

+ (id)create {
  return [self createInStore:[CoreDataStore mainStore]];
}

+ (id)createInStore:(CoreDataStore *)store {
  return [store createNewEntityByName:NSStringFromClass(self.class)];
}

+ (NSArray *)all {
  return [self allInStore:[CoreDataStore mainStore]];
}

+ (NSArray *)allForPredicate:(NSPredicate *)predicate {
  return [self allForPredicate:predicate inStore:[CoreDataStore mainStore]];
}

+ (NSArray *)allForPredicate:(NSPredicate *)predicate orderBy:(NSString *)key ascending:(BOOL)ascending {
  return [self allForPredicate:predicate orderBy:key ascending:ascending inStore:[CoreDataStore mainStore]];
}

+ (NSArray *)allOrderedBy:(NSString *)key ascending:(BOOL)ascending {
  return [self allOrderedBy:key ascending:ascending inStore:[CoreDataStore mainStore]];
}

+ (NSArray *)allInStore:(CoreDataStore *)store {
  NSError *error = nil;
  return [store allForEntity:NSStringFromClass(self.class) error:&error];
}

+ (NSArray *)allForPredicate:(NSPredicate *)predicate inStore:(CoreDataStore *)store {
  NSError *error = nil;
  return [store allForEntity:NSStringFromClass(self.class) predicate:predicate error:&error];
}

+ (NSArray *)allForPredicate:(NSPredicate *)predicate orderBy:(NSString *)key ascending:(BOOL)ascending inStore:(CoreDataStore *)store {
  NSError *error = nil;
  return [store allForEntity:NSStringFromClass(self.class) predicate:predicate orderBy:key ascending:ascending error:&error];
}

+ (NSArray *)allOrderedBy:(NSString *)key ascending:(BOOL)ascending inStore:(CoreDataStore *)store {
  NSError *error = nil;
  return [store allForEntity:NSStringFromClass(self.class) orderBy:key ascending:ascending error:&error];
}

+ (id)first {
  return [self firstInStore:[CoreDataStore mainStore]];
}

+ (id)firstWithKey:(NSString *)key value:(NSObject *)value {
  return [self firstWithKey:key value:value inStore:[CoreDataStore mainStore]];
}

+ (id)firstInStore:(CoreDataStore *)store {
  NSError *error = nil;
  return [store entityByName:NSStringFromClass(self.class) error:&error];
}

+ (id)firstWithKey:(NSString *)key value:(NSObject *)value inStore:(CoreDataStore *)store {
  NSError *error = nil;
  return [store entityByName:NSStringFromClass(self.class) key:key value:value error:&error];
}

- (void)destroy {
  [self.managedObjectContext deleteObject:self];
}

+ (void)destroyAll {
  return [self destroyAllInStore:[CoreDataStore mainStore]];
}

+ (void)destroyAllInStore:(CoreDataStore *)store {
  return [store removeAllEntitiesByName:NSStringFromClass(self.class)];
}

@end


static const void *IBRetainNoOp(CFAllocatorRef allocator, const void *value) {
  return value;
}

static void IBReleaseNoOp(CFAllocatorRef allocator, const void *value) {
}

@implementation NSMutableArray (InnerBand)

+ (NSMutableArray *)arrayUnretaining {
  CFArrayCallBacks callbacks = kCFTypeArrayCallBacks;
  callbacks.retain = IBRetainNoOp;
  callbacks.release = IBReleaseNoOp;

#if __has_feature(objc_arc)
  return (__bridge_transfer NSMutableArray *) CFArrayCreateMutable(nil, 0, &callbacks);
#else
        return [(NSMutableArray*)CFArrayCreateMutable(nil, 0, &callbacks) autorelease];
    #endif
}

- (void)sortDiacriticInsensitiveCaseInsensitive {
  [self sortUsingSelector:@selector(diacriticInsensitiveCaseInsensitiveSort:)];
}

- (void)sortDiacriticInsensitive {
  [self sortUsingSelector:@selector(diacriticInsensitiveSort:)];
}

- (void)sortCaseInsensitive {
  [self sortUsingSelector:@selector(caseInsensitiveSort:)];
}

#pragma mark -

- (void)pushObject:(id)obj {
  [self addObject:obj];
}

- (id)popObject {
  id pop = SAFE_ARC_AUTORELEASE(SAFE_ARC_RETAIN([self lastObject]));

  [self removeLastObject];

  return pop;
}

- (id)shiftObject {
  if (self.count > 0) {
    id shft = SAFE_ARC_AUTORELEASE(SAFE_ARC_RETAIN([self objectAtIndex:0]));

    [self removeObjectAtIndex:0];
    return shft;
  }

  return nil;
}

- (void)unshiftObject:(id)obj {
  [self insertObject:obj atIndex:0];
}

#pragma mark -

- (void)deleteIf:(ib_enum_bool_t)blk {
  for (NSInteger i = (self.count - 1); i >= 0; --i) {
    if (blk([self objectAtIndex:i])) {
      [self removeObjectAtIndex:i];
    }
  }
}

#pragma mark -

- (void)shuffle {
  // shuffle it 3 times because 3 is magical
  for (NSInteger times = 0; times < 3; ++times) {
    for (NSInteger i = self.count - 1; i >= 0; --i) {
      NSInteger fromIndex = arc4random() % self.count;
      NSInteger toIndex = arc4random() % self.count;

      [self exchangeObjectAtIndex:fromIndex withObjectAtIndex:toIndex];
    }
  }
}

- (void)reverse {
  for (NSInteger i = 0, j = self.count - 1; i < j; ++i, --j) {
    [self exchangeObjectAtIndex:i withObjectAtIndex:j];
  }
}

@end


@implementation NSMutableString (InnerBand)

- (void)trim {
  NSString *trimmedString = [self trimmedString];

  // replace self
  [self replaceCharactersInRange:NSMakeRange(0, self.length) withString:trimmedString];
}

@end


@implementation NSNumber (InnerBand)

- (NSString *)formattedCurrency {
  NSNumberFormatter *format = SAFE_ARC_AUTORELEASE([[NSNumberFormatter alloc] init]);

  [format setNumberStyle:NSNumberFormatterCurrencyStyle];

  return [format stringFromNumber:self];
}

- (NSString *)formattedFlatCurrency {
  NSNumberFormatter *format = SAFE_ARC_AUTORELEASE([[NSNumberFormatter alloc] init]);

  [format setNumberStyle:NSNumberFormatterDecimalStyle];
  [format setMinimumFractionDigits:2];
  [format setMaximumFractionDigits:2];

  return [format stringFromNumber:self];
}

- (NSString *)formattedCurrencyWithMinusSign {
  NSNumberFormatter *format = SAFE_ARC_AUTORELEASE([[NSNumberFormatter alloc] init]);

  [format setNumberStyle:NSNumberFormatterCurrencyStyle];
  [format setNegativeFormat:@"-$#,##0.00"];

  return [format stringFromNumber:self];
}

- (NSString *)formattedDecimal {
  NSNumberFormatter *format = SAFE_ARC_AUTORELEASE([[NSNumberFormatter alloc] init]);

  [format setNumberStyle:NSNumberFormatterDecimalStyle];

  return [format stringFromNumber:self];
}

- (NSString *)formattedFlatDecimal {
  NSNumberFormatter *format = SAFE_ARC_AUTORELEASE([[NSNumberFormatter alloc] init]);

  [format setNumberStyle:NSNumberFormatterDecimalStyle];
  [format setGroupingSeparator:@""];

  return [format stringFromNumber:self];
}

- (NSString *)formattedSpellOut {
  NSNumberFormatter *format = SAFE_ARC_AUTORELEASE([[NSNumberFormatter alloc] init]);

  [format setNumberStyle:NSNumberFormatterSpellOutStyle];

  return [format stringFromNumber:self];
}

@end


@implementation NSObject (InnerBand)

- (id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3 {
  NSMethodSignature *sig = [self methodSignatureForSelector:selector];
  if (sig) {
    NSInvocation *invo = [NSInvocation invocationWithMethodSignature:sig];
    [invo setTarget:self];
    [invo setSelector:selector];
    [invo setArgument:&p1 atIndex:2];
    [invo setArgument:&p2 atIndex:3];
    [invo setArgument:&p3 atIndex:4];
    [invo invoke];
    if (sig.methodReturnLength) {
      id anObject;
      [invo getReturnValue:&anObject];
      return anObject;
    } else {
      return nil;
    }
  } else {
    return nil;
  }
}

- (id)performSelector:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3 withObject:(id)p4 {
  NSMethodSignature *sig = [self methodSignatureForSelector:selector];
  if (sig) {
    NSInvocation *invo = [NSInvocation invocationWithMethodSignature:sig];
    [invo setTarget:self];
    [invo setSelector:selector];
    [invo setArgument:&p1 atIndex:2];
    [invo setArgument:&p2 atIndex:3];
    [invo setArgument:&p3 atIndex:4];
    [invo setArgument:&p4 atIndex:5];
    [invo invoke];
    if (sig.methodReturnLength) {
      id anObject;
      [invo getReturnValue:&anObject];
      return anObject;
    } else {
      return nil;
    }
  } else {
    return nil;
  }
}

- (void)performSelectorInBackground:(SEL)selector withObject:(id)p1 withObject:(id)p2 {
  NSMethodSignature *sig = [self methodSignatureForSelector:selector];

  if (sig) {
    NSInvocation *invo = [NSInvocation invocationWithMethodSignature:sig];
    [invo setTarget:self];
    [invo setSelector:selector];
    [invo setArgument:&p1 atIndex:2];
    [invo setArgument:&p2 atIndex:3];
    [invo retainArguments];
    [invo performSelectorInBackground:@selector(invoke) withObject:nil];
  }
}

- (void)performSelectorInBackground:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3 {
  NSMethodSignature *sig = [self methodSignatureForSelector:selector];

  if (sig) {
    NSInvocation *invo = [NSInvocation invocationWithMethodSignature:sig];
    [invo setTarget:self];
    [invo setSelector:selector];
    [invo setArgument:&p1 atIndex:2];
    [invo setArgument:&p2 atIndex:3];
    [invo setArgument:&p3 atIndex:4];
    [invo retainArguments];
    [invo performSelectorInBackground:@selector(invoke) withObject:nil];
  }
}

- (void)performSelectorInBackground:(SEL)selector withObject:(id)p1 withObject:(id)p2 withObject:(id)p3 withObject:(id)p4 {
  NSMethodSignature *sig = [self methodSignatureForSelector:selector];

  if (sig) {
    NSInvocation *invo = [NSInvocation invocationWithMethodSignature:sig];
    [invo setTarget:self];
    [invo setSelector:selector];
    [invo setArgument:&p1 atIndex:2];
    [invo setArgument:&p2 atIndex:3];
    [invo setArgument:&p3 atIndex:4];
    [invo setArgument:&p4 atIndex:5];
    [invo retainArguments];
    [invo performSelectorInBackground:@selector(invoke) withObject:nil];
  }
}

@end


@implementation NSString (InnerBand)

- (NSComparisonResult)diacriticInsensitiveCaseInsensitiveSort:(NSString *)rhs {
  return [self compare:rhs options:NSDiacriticInsensitiveSearch | NSCaseInsensitiveSearch];
}

- (NSComparisonResult)diacriticInsensitiveSort:(NSString *)rhs {
  return [self compare:rhs options:NSDiacriticInsensitiveSearch];
}

- (NSComparisonResult)caseInsensitiveSort:(NSString *)rhs {
  return [self compare:rhs options:NSCaseInsensitiveSearch];
}

- (NSString *)asBundlePath {
  NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
  return [resourcePath stringByAppendingPathComponent:self];
}

- (NSString *)asDocumentsPath {
  __strong static NSString *documentsPath = nil;

  if (!documentsPath) {
    NSArray *dirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);

    documentsPath = SAFE_ARC_RETAIN([dirs objectAtIndex:0]);
  }

  return [documentsPath stringByAppendingPathComponent:self];
}

- (BOOL)contains:(NSString *)substring {
  return ([self rangeOfString:substring].location != NSNotFound);
}

- (BOOL)contains:(NSString *)substring options:(NSStringCompareOptions)options {
  return ([self rangeOfString:substring options:options].location != NSNotFound);
}

- (NSString *)trimmedString {
  return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end


static NSString *entityList[] = {
    @"&quot;",
    @"&amp;",
    @"&apos;",
    @"&lt;",
    @"&gt;",
};

IBXMLCharMode XMLModeForUnichar(UniChar c);

static NSString *AutoreleasedCloneForXML(NSString *src, BOOL escaping);

IBXMLCharMode XMLModeForUnichar(UniChar c) {
  // Per XML spec Section 2.2 Characters
  //   ( http://www.w3.org/TR/REC-xml/#charsets )
  if (c <= 0xd7ff) {
    if (c >= 0x20) {
      switch (c) {
        case 34:
          return kGTMXMLCharModeEncodeQUOT;
        case 38:
          return kGTMXMLCharModeEncodeAMP;
        case 39:
          return kGTMXMLCharModeEncodeAPOS;
        case 60:
          return kGTMXMLCharModeEncodeLT;
        case 62:
          return kGTMXMLCharModeEncodeGT;
        default:
          return kGTMXMLCharModeValid;
      }
    } else {
      if (c == '\n')
        return kGTMXMLCharModeValid;
      if (c == '\r')
        return kGTMXMLCharModeValid;
      if (c == '\t')
        return kGTMXMLCharModeValid;
      return kGTMXMLCharModeInvalid;
    }
  }

  if (c < 0xE000)
    return kGTMXMLCharModeInvalid;

  if (c <= 0xFFFD)
    return kGTMXMLCharModeValid;

  return kGTMXMLCharModeInvalid;
}

static NSString *AutoreleasedCloneForXML(NSString *src, BOOL escaping) {
  NSUInteger length = [src length];

  if (!length) {
    return src;
  }

  NSMutableString *finalString = [NSMutableString string];

  // this block is common between GTMNSString+HTML and GTMNSString+XML but
  // it's so short that it isn't really worth trying to share.
  const UniChar *buffer = CFStringGetCharactersPtr((__bridge CFStringRef) src);

  if (!buffer) {
    // We want this buffer to be autoreleased.
    NSMutableData *data = [NSMutableData dataWithLength:length * sizeof(UniChar)];
    if (!data) {
      return nil;
    }
    [src getCharacters:[data mutableBytes]];
    buffer = [data bytes];
  }

  const UniChar *goodRun = buffer;
  NSUInteger goodRunLength = 0;

  for (NSUInteger i = 0; i < length; ++i) {

    IBXMLCharMode cMode = XMLModeForUnichar(buffer[i]);

    // valid chars go as is, and if we aren't doing entities, then
    // everything goes as is.
    if ((cMode == kGTMXMLCharModeValid) ||
        (!escaping && (cMode != kGTMXMLCharModeInvalid))) {
      // goes as is
      goodRunLength += 1;
    } else {
      // it's something we have to encode or something invalid

      // start by adding what we already collected (if anything)
      if (goodRunLength) {
        CFStringAppendCharacters((__bridge CFMutableStringRef) finalString,
            goodRun,
            goodRunLength);
        goodRunLength = 0;
      }

      // if it wasn't invalid, add the encoded version
      if (cMode != kGTMXMLCharModeInvalid) {
        // add this encoded
        [finalString appendString:entityList[cMode]];
      }

      // update goodRun to point to the next UniChar
      goodRun = buffer + i + 1;
    }
  }

  // anything left to add?
  if (goodRunLength) {
    CFStringAppendCharacters((__bridge CFMutableStringRef) finalString,
        goodRun,
        goodRunLength);
  }
  return finalString;
}

@implementation NSString (XMLEncoding)

- (NSString *)stringWithXMLSanitizingAndEscaping {
  return AutoreleasedCloneForXML(self, YES);
}

- (NSString *)stringWithXMLSanitizing {
  return AutoreleasedCloneForXML(self, NO);
}

@end


__strong static NSManagedObjectModel *gManagedObjectModel;
__strong static NSPersistentStoreCoordinator *gPersistentStoreCoordinator;

static CoreDataStore *gMainStoreInstance;

@interface CoreDataStore ()

- (void)createManagedObjectContext;

@end

@implementation CoreDataStore

+ (CoreDataStore *)mainStore {
  @synchronized (self) {
    if (!gMainStoreInstance) {
      gMainStoreInstance = [[CoreDataStore alloc] init];
    }
  }

  return gMainStoreInstance;
}

+ (CoreDataStore *)createStore {
  return SAFE_ARC_AUTORELEASE([[CoreDataStore alloc] init]);
}

+ (void)initialize {
  NSError *error = nil;

  // create the global managed object model
  gManagedObjectModel = SAFE_ARC_RETAIN([NSManagedObjectModel mergedModelFromBundles:nil]);

  // create the global persistent store
  gPersistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:gManagedObjectModel];

  NSString *storeLocation = [DOCUMENTS_DIR() stringByAppendingPathComponent:@"CoreDataStore.sqlite"];
  NSURL *storeURL = [NSURL fileURLWithPath:storeLocation];

  if (![gPersistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
    NSLog(@"Error creating persistantStoreCoordinator: %@, %@", error, [error userInfo]);
    abort();
  }
}

+ (CoreDataStore *)createStoreWithContext:(NSManagedObjectContext *)context {
  return SAFE_ARC_AUTORELEASE([[CoreDataStore alloc] initWithContext:context]);
}

- (id)init {
  if ((self = [super init])) {
    [self createManagedObjectContext];
  }

  return self;
}

- (id)initWithContext:(NSManagedObjectContext *)context {
  if ((self = [super init])) {
    _managedObjectContext = SAFE_ARC_RETAIN(context);
  }

  return self;
}

- (void)dealloc {
  SAFE_ARC_RELEASE(_managedObjectContext);
  SAFE_ARC_SUPER_DEALLOC();
}

#pragma mark -

- (NSManagedObjectContext *)context {
  return _managedObjectContext;
}

- (void)clearAllData {
  NSError *error = nil;

  // clear existing stack
  SAFE_ARC_RELEASE(gManagedObjectModel);
  SAFE_ARC_RELEASE(gPersistentStoreCoordinator);
  SAFE_ARC_RELEASE(_managedObjectContext);

  gManagedObjectModel = nil;
  gPersistentStoreCoordinator = nil;
  _managedObjectContext = nil;

  // remove persistence file
  NSString *storeLocation = [DOCUMENTS_DIR() stringByAppendingPathComponent:@"CoreDataStore.sqlite"];
  NSURL *storeURL = [NSURL fileURLWithPath:storeLocation];

  // remove
  @try {
    [[NSFileManager defaultManager] removeItemAtPath:storeURL.path error:&error];
  } @catch (NSException *exception) {
    // ignore, totally normal
  }

  // init again
  [CoreDataStore initialize];
  [self createManagedObjectContext];
}

/**
 Save the context.
 */
- (void)save {
  NSError *error = nil;

  if ([_managedObjectContext hasChanges] && ![_managedObjectContext save:&error]) {
    NSArray *detailedErrors = [[error userInfo] objectForKey:NSDetailedErrorsKey];

    if (detailedErrors != nil && [detailedErrors count] > 0) {
      for (NSError *detailedError in detailedErrors) {
        NSLog(@"  DetailedError: %@", [detailedError userInfo]);
      }
    }
    else {
      NSLog(@"  %@", [error userInfo]);
    }
  }
}

#pragma mark - Deprecated Accessors (Use NSManagedObject+InnerBand)

- (NSArray *)allForEntity:(NSString *)entityName error:(NSError **)error {
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];

  // execute
  NSArray *ret = [_managedObjectContext executeFetchRequest:request error:error];

  return ret;
}

- (NSArray *)allForEntity:(NSString *)entityName predicate:(NSPredicate *)predicate error:(NSError **)error {
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];

  // predicate
  [request setPredicate:predicate];

  // execute
  return [_managedObjectContext executeFetchRequest:request error:error];
}

- (NSArray *)allForEntity:(NSString *)entityName predicate:(NSPredicate *)predicate orderBy:(NSString *)key ascending:(BOOL)ascending error:(NSError **)error {
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
  NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:key ascending:ascending];

  // predicate
  [request setPredicate:predicate];
  [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];

  // execute
  return [_managedObjectContext executeFetchRequest:request error:error];
}

- (NSArray *)allForEntity:(NSString *)entityName orderBy:(NSString *)key ascending:(BOOL)ascending error:(NSError **)error {
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
  NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:key ascending:ascending];

  // predicate
  [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];

  // execute
  return [_managedObjectContext executeFetchRequest:request error:error];
}

- (NSManagedObject *)entityByName:(NSString *)entityName error:(NSError **)error {
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];

  // execute
  NSArray *values = [_managedObjectContext executeFetchRequest:request error:error];

  if (values.count > 0) {
    // this method is designed for accessing a single object, but if there's more just give the first
    return (NSManagedObject *) [values objectAtIndex:0];
  }

  return nil;
}

- (NSManagedObject *)entityByName:(NSString *)entityName key:(NSString *)key value:(NSObject *)value error:(NSError **)error {
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", key, value];
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];

  // predicate
  [request setPredicate:predicate];

  // execute
  NSArray *values = [_managedObjectContext executeFetchRequest:request error:error];

  if (values.count > 0) {
    // this method is designed for accessing a single object, but if there's more just give the first
    return (NSManagedObject *) [values objectAtIndex:0];
  }

  return nil;
}

- (NSManagedObject *)entityByURI:(NSURL *)uri {
  NSManagedObjectID *oid = [gPersistentStoreCoordinator managedObjectIDForURIRepresentation:uri];

  return [self entityByObjectID:oid];
}

- (NSManagedObject *)entityByObjectID:(NSManagedObjectID *)oid {
  if (oid) {
    return [_managedObjectContext objectWithID:oid];
  }

  return nil;
}

- (NSManagedObject *)createNewEntityByName:(NSString *)entityName {
  return [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:_managedObjectContext];
}

- (void)removeEntity:(NSManagedObject *)entity {
  @try {
    [_managedObjectContext deleteObject:entity];
  } @catch (id exception) {}
}

/* Remove all objects of an entity. */
- (void)removeAllEntitiesByName:(NSString *)entityName {
  NSError *error = nil;

  // get all objects for entity
  // TODO: we can fetch these in a more minimalistic way, would be faster, so do it if we have time
  NSArray *objects = [self allForEntity:entityName error:&error];

  for (NSManagedObject *iObject in objects) {
    [_managedObjectContext deleteObject:iObject];
  }
}

- (NSEntityDescription *)entityDescriptionForEntity:(NSString *)entityName {
  return [NSEntityDescription entityForName:entityName inManagedObjectContext:_managedObjectContext];
}

#pragma mark -

- (void)createManagedObjectContext {
  _managedObjectContext = [[NSManagedObjectContext alloc] init];
  [_managedObjectContext setPersistentStoreCoordinator:gPersistentStoreCoordinator];
}

@end


@implementation DispatchMessage

@synthesize asynchronous = asynchronous_;
@synthesize name = name_;

- (id)init {
  self = [super init];

  if (self) {
    name_ = nil;
    userInfo_ = [[NSMutableDictionary alloc] init];
    asynchronous_ = NO;
  }

  return self;
}

- (id)initWithName:(NSString *)name userInfo:(NSDictionary *)userInfo {
  self = [super init];

  if (self) {
    name_ = [name copy];
    userInfo_ = [userInfo mutableCopy];
  }

  return self;
}

- (id)initWithName:(NSString *)name andObjectsAndKeys:(id)firstObject, ... {
  self = [super init];

  if (self) {
    // construct user info
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    id currentObject = nil;
    id currentKey = nil;
    va_list argList;

    if (firstObject) {
      va_start(argList, firstObject);
      currentObject = firstObject;

      do {
        currentKey = va_arg(argList, id);
        [userInfo setObject:currentObject forKey:currentKey];
      } while ((currentObject = va_arg(argList, id)));

      va_end(argList);
    }

    name_ = [name copy];
    userInfo_ = [userInfo mutableCopy];
  }

  return self;
}

+ (id)messageWithName:(NSString *)name andObjectsAndKeys:(id)firstObject, ... {
  // construct user info
  NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
  id currentObject = nil;
  id currentKey = nil;
  va_list argList;

  if (firstObject) {
    va_start(argList, firstObject);
    currentObject = firstObject;

    do {
      currentKey = va_arg(argList, id);
      [userInfo setObject:currentObject forKey:currentKey];
    } while ((currentObject = va_arg(argList, id)));

    va_end(argList);
  }

  DispatchMessage *message = [[DispatchMessage alloc] initWithName:name userInfo:userInfo];

  va_end(argList);

  return SAFE_ARC_AUTORELEASE(message);
}

+ (id)messageWithName:(NSString *)name userInfo:(NSDictionary *)userInfo {
  DispatchMessage *message = [[DispatchMessage alloc] initWithName:name userInfo:userInfo];

  return SAFE_ARC_AUTORELEASE(message);
}

- (void)dealloc {
  SAFE_ARC_RELEASE(name_);
  SAFE_ARC_RELEASE(userInfo_);
  SAFE_ARC_SUPER_DEALLOC();
}

#pragma mark -

- (NSDictionary *)userInfo {
  return SAFE_ARC_AUTORELEASE([userInfo_ copy]);
}

- (void)setUserInfoValue:(id)value forKey:(NSString *)key {
  [userInfo_ setValue:value forKey:key];
}

#pragma mark -

- (void)inputData:(NSData *)input {
  // input and do nothing
}

- (NSData *)outputData {
  // output nothing
  return nil;
}

@end


@interface MessageCenter (private)

+ (NSMutableArray *)getTargetActionsForMessageName:(NSString *)name source:(NSObject *)source;

+ (NSMutableArray *)getTargetActionsForMessageName:(NSString *)name sourceDescription:(NSString *)sourceDescription;

+ (void)runProcessorInThread:(DispatchMessage *)message targetActions:(NSArray *)targetActions;

@end

static NSMutableDictionary *_messageListeners = nil;

static BOOL _debuggingEnabled = NO;

static NSString *getSourceIdentifier(NSObject *obj) {
  return [NSString stringWithFormat:@"%p", obj];
}

@implementation MessageCenter

+ (NSInteger)getCountOfListeningSources {
  return [_messageListeners count];
}

+ (void)setDebuggingEnabled:(BOOL)enabled {
  _debuggingEnabled = enabled;
}

+ (BOOL)isDebuggingEnabled {
  return _debuggingEnabled;
}

#pragma mark -

+ (void)initialize {
  _messageListeners = [[NSMutableDictionary alloc] init];
}

#pragma mark -

+ (void)addGlobalMessageListener:(NSString *)name target:(NSObject *)target action:(SEL)action {
  [MessageCenter addMessageListener:name source:nil target:target action:action];
}

+ (void)addMessageListener:(NSString *)name source:(NSObject *)source target:(NSObject *)target action:(SEL)action {
  // remove existing listener (avoids duplication)
  [MessageCenter removeMessageListener:name source:source target:target action:action];

  // add listener
  NSMutableArray *targetActions = [MessageCenter getTargetActionsForMessageName:name source:source];
  TargetAction *targetAction = SAFE_ARC_AUTORELEASE([[TargetAction alloc] init]);

  targetAction.target = target;
  targetAction.action = NSStringFromSelector(action);

  [targetActions addObject:targetAction];
}

#pragma mark -

+ (void)removeMessageListener:(NSString *)name source:(NSObject *)source target:(NSObject *)target action:(SEL)action {
  NSMutableArray *targetActions = [MessageCenter getTargetActionsForMessageName:name source:source];

  // remove all matching target/action pairs
  for (NSInteger i = targetActions.count - 1; i >= 0; --i) {
    TargetAction *targetAction = (TargetAction *) [targetActions objectAtIndex:i];
    NSObject *iTarget = targetAction.target;

    // remove if matched
    if (iTarget == target) {
      SEL iAction = NSSelectorFromString(targetAction.action);

      if (iAction == action) {
        [targetActions removeObjectAtIndex:i];
      }
    }
  }
}

+ (void)removeMessageListener:(NSString *)name source:(NSObject *)source target:(NSObject *)target {
  NSMutableArray *targetActions = [MessageCenter getTargetActionsForMessageName:name source:source];

  // remove all matching targets
  for (NSInteger i = targetActions.count - 1; i >= 0; --i) {
    TargetAction *targetAction = (TargetAction *) [targetActions objectAtIndex:i];
    NSObject *iTarget = targetAction.target;

    // remove if matched
    if (iTarget == target) {
      [targetActions removeObjectAtIndex:i];
    }
  }
}

+ (void)removeMessageListener:(NSString *)name target:(NSObject *)target action:(SEL)action {
  for (NSMutableDictionary *iMessageNames in _messageListeners) {
    for (NSMutableArray *iTargetActions in iMessageNames) {
      // remove all matching target/action pairs
      for (NSInteger i = iTargetActions.count - 1; i >= 0; --i) {
        TargetAction *targetAction = (TargetAction *) [iTargetActions objectAtIndex:i];
        NSObject *iTarget = targetAction.target;

        // remove if matched
        if (iTarget == target) {
          SEL iAction = NSSelectorFromString(targetAction.action);

          if (iAction == action) {
            [iTargetActions removeObjectAtIndex:i];
          }
        }
      }
    }
  }
}

+ (void)removeMessageListenersForTarget:(NSObject *)target {
  for (NSString *iSourceDescription in _messageListeners) {
    NSMutableDictionary *targetActionsByName = [_messageListeners objectForKey:iSourceDescription];
    for (NSString *iTargetActionName in targetActionsByName) {
      NSMutableArray *iTargetActions = [targetActionsByName objectForKey:iTargetActionName];

      // remove all matching target/action pairs
      for (NSInteger i = iTargetActions.count - 1; i >= 0; --i) {
        TargetAction *targetAction = (TargetAction *) [iTargetActions objectAtIndex:i];
        NSObject *iTarget = targetAction.target;

        // remove if matched
        if (iTarget == target) {
          [iTargetActions removeObjectAtIndex:i];
        }
      }
    }
  }
}

#pragma mark -

+ (void)sendGlobalMessageNamed:(NSString *)name {
  [MessageCenter sendMessageNamed:name forSource:nil];
}

+ (void)sendGlobalMessageNamed:(NSString *)name withUserInfo:(NSDictionary *)userInfo {
  [MessageCenter sendMessageNamed:name withUserInfo:userInfo forSource:nil];
}

+ (void)sendGlobalMessageNamed:(NSString *)name withUserInfoKey:(NSObject *)key andValue:(NSObject *)value {
  NSDictionary *userInfo = [NSDictionary dictionaryWithObject:value forKey:key];
  [MessageCenter sendGlobalMessageNamed:name withUserInfo:userInfo];
}

+ (void)sendGlobalMessageNamed:(NSString *)name withObjectsAndKeys:(id)firstObject, ... {
  NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
  id currentObject = nil;
  id currentKey = nil;
  va_list argList;

  if (firstObject) {
    va_start(argList, firstObject);
    currentObject = firstObject;

    do {
      currentKey = va_arg(argList, id);
      [userInfo setObject:currentObject forKey:currentKey];
    } while ((currentObject = va_arg(argList, id)));

    va_end(argList);
  }

  [MessageCenter sendMessageNamed:name withUserInfo:userInfo forSource:nil];
}

+ (void)sendGlobalMessage:(DispatchMessage *)message {
  [MessageCenter sendMessage:message forSource:nil];
}

+ (void)sendMessageNamed:(NSString *)name forSource:(NSObject *)source {
  DispatchMessage *message = [DispatchMessage messageWithName:name userInfo:nil];

  // dispatch
  [MessageCenter sendMessage:message forSource:source];
}

+ (void)sendMessageNamed:(NSString *)name withUserInfo:(NSDictionary *)userInfo forSource:(NSObject *)source {
  DispatchMessage *message = [DispatchMessage messageWithName:name userInfo:userInfo];

  // dispatch
  [MessageCenter sendMessage:message forSource:source];
}

+ (void)sendMessageNamed:(NSString *)name withUserInfoKey:(NSObject *)key andValue:(NSObject *)value forSource:(NSObject *)source {
  NSDictionary *userInfo = [NSDictionary dictionaryWithObject:value forKey:key];
  [MessageCenter sendMessageNamed:name withUserInfo:userInfo forSource:source];
}

+ (void)sendMessageNamed:(NSString *)name forSource:(NSObject *)source withObjectsAndKeys:(id)firstObject, ... {
  // construct user info
  NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
  id currentObject = nil;
  id currentKey = nil;
  va_list argList;

  if (firstObject) {
    va_start(argList, firstObject);
    currentObject = firstObject;

    do {
      currentKey = va_arg(argList, id);
      [userInfo setObject:currentObject forKey:currentKey];
    } while ((currentObject = va_arg(argList, id)));

    va_end(argList);
  }

  // dispatch
  [MessageCenter sendMessageNamed:name withUserInfo:userInfo forSource:source];
}

+ (void)sendMessage:(DispatchMessage *)message forSource:(NSObject *)source {
  // global or local delivery only
  NSArray *targetActions = [MessageCenter getTargetActionsForMessageName:message.name source:source];

  if (message.isAsynchronous) {
    // run completely in thread
    [MessageCenter performSelectorInBackground:@selector(runProcessorInThread:targetActions:) withObject:message withObject:targetActions];
  } else {
    // process message in sync
    MessageProcessor *processor = [[MessageProcessor alloc] initWithMessage:message targetActions:targetActions];

    [processor process];
    SAFE_ARC_RELEASE(processor);
  }
}

+ (void)runProcessorInThread:(DispatchMessage *)message targetActions:(NSArray *)targetActions {
  // pool
  SAFE_ARC_AUTORELEASE_POOL_START();

      // process message
      MessageProcessor *processor = [[MessageProcessor alloc] initWithMessage:message targetActions:targetActions];

      // process
      [processor process];

      // release
      SAFE_ARC_RELEASE(processor);

      // pool
      SAFE_ARC_AUTORELEASE_POOL_END();
}

#pragma mark -

+ (NSMutableArray *)getTargetActionsForMessageName:(NSString *)name source:(NSObject *)source {
  // if no source given, treat as global listener (use self as key)
  if (!source) {
    source = [NSNull null];
  }

  return [self.class getTargetActionsForMessageName:name sourceDescription:getSourceIdentifier(source)];
}

+ (NSMutableArray *)getTargetActionsForMessageName:(NSString *)name sourceDescription:(NSString *)sourceDescription {
  NSMutableDictionary *messageNames = [_messageListeners objectForKey:sourceDescription];

  // add a new dictionary if there isn't one
  if (!messageNames) {
    [_messageListeners setObject:(messageNames = [NSMutableDictionary dictionary]) forKey:sourceDescription];
  }

  NSMutableArray *targetActions = [messageNames objectForKey:name];

  // add a new array if there isn't one
  if (!targetActions) {
    [messageNames setObject:(targetActions = [NSMutableArray array]) forKey:name];
  }

  return targetActions;
}

@end


@implementation MessageProcessor

- (id)initWithMessage:(DispatchMessage *)message targetActions:(NSArray *)targetActions {
  self = [super init];

  if (self) {
    _message = SAFE_ARC_RETAIN(message);
    _targetActions = [targetActions copy];
  }

  return self;
}

- (void)dealloc {
  SAFE_ARC_RELEASE(_message);
  SAFE_ARC_RELEASE(_targetActions);
  SAFE_ARC_SUPER_DEALLOC();
}

- (void)process {
  // process
  [_message inputData:nil];

  // dispatch for all target/action pairs
  for (NSInteger i = _targetActions.count - 1; i >= 0; --i) {
    TargetAction *targetAction = (TargetAction *) [_targetActions objectAtIndex:i];
    NSObject *iTarget = targetAction.target;
    SEL iAction = NSSelectorFromString(targetAction.action);

    // perform on main thread
    if (_message.isAsynchronous) {
      [iTarget performSelectorOnMainThread:iAction withObject:_message waitUntilDone:NO];
    } else {
#if __has_feature(objc_arc)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
      [iTarget performSelector:iAction withObject:_message];
#pragma clang diagnostic pop
#else
                [iTarget performSelector:iAction withObject:_message];
            #endif
    }
  }
}

@end


@implementation TargetAction

@synthesize target;
@synthesize action;

@end


@implementation BlockBasedDispatchMessage

+ (id)messageWithName:(NSString *)name isAsynchronous:(BOOL)isAsync input:(void (^)(NSData *))inputBlock output:(NSData * (^)(void))outputBlock {
  BlockBasedDispatchMessage *msg = [[BlockBasedDispatchMessage alloc] initWithName:name userInfo:nil];
  msg.asynchronous = isAsync;

  msg->inputBlock_ = SAFE_ARC_BLOCK_COPY(inputBlock);
  msg->outputBlock_ = SAFE_ARC_BLOCK_COPY(outputBlock);

  return SAFE_ARC_AUTORELEASE(msg);
}

- (void)dealloc {
  SAFE_ARC_BLOCK_RELEASE(inputBlock_);
  SAFE_ARC_BLOCK_RELEASE(outputBlock_);
  SAFE_ARC_SUPER_DEALLOC();
}

- (void)inputData:(NSData *)input {
  inputBlock_(input);
}

- (NSData *)outputData {
  return outputBlock_();
}

@end


@implementation HTTPGetRequestMessage

+ (id)messageWithName:(NSString *)name userInfo:(NSDictionary *)userInfo url:(NSString *)url {
  HTTPGetRequestMessage *message = [[HTTPGetRequestMessage alloc] initWithName:name userInfo:userInfo];

  // must be async
  message.asynchronous = YES;

  message->_url = [url copy];
  message->_headersDict = [[NSMutableDictionary alloc] init];

  // autorelease
  return SAFE_ARC_AUTORELEASE(message);
}

+ (id)messageWithName:(NSString *)name userInfo:(NSDictionary *)userInfo url:(NSString *)url processBlock:(ib_http_proc_t)processBlock {
  HTTPGetRequestMessage *message = [[HTTPGetRequestMessage alloc] initWithName:name userInfo:userInfo];

  // must be async
  message.asynchronous = YES;

  message->_url = [url copy];
  message->_headersDict = [[NSMutableDictionary alloc] init];
  message->_processBlock = SAFE_ARC_BLOCK_COPY(processBlock);

  // autorelease
  return SAFE_ARC_AUTORELEASE(message);
}

- (void)dealloc {
  SAFE_ARC_RELEASE(_url);
  SAFE_ARC_RELEASE(_responseData);
  SAFE_ARC_RELEASE(_headersDict);
  SAFE_ARC_BLOCK_RELEASE(_processBlock);
  SAFE_ARC_SUPER_DEALLOC();
}

#pragma mark -

- (void)addHeaderValue:(NSString *)value forKey:(NSString *)key {
  [_headersDict setValue:value forKey:key];
}

- (void)inputData:(NSData *)input {
  NSString *subbedURL = _url;
  NSError *error = nil;
  NSHTTPURLResponse *response = nil;

  // perform substitutions on URL
  for (NSString *key in self.userInfo) {
    NSString *subToken = [NSString stringWithFormat:@"[%@]", key];

    if ([[self.userInfo objectForKey:key] isKindOfClass:NSString.class]) {
      subbedURL = [subbedURL stringByReplacingOccurrencesOfString:subToken withString:[(NSString *) [self.userInfo objectForKey:key] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
  }

  // debug
  if ([MessageCenter isDebuggingEnabled]) {
    NSLog(@"OPEN URL: %@", subbedURL);
  }

  // generate request
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:subbedURL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
  [request setAllHTTPHeaderFields:_headersDict];

  NSData *content = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

  if (!error) {
    _responseData = [content mutableCopy];

    if (response) {
      [self setUserInfoValue:BOX_INT(response.statusCode) forKey:HTTP_STATUS_CODE];

      if (_processBlock) {
        _processBlock(_responseData, response.statusCode);
      }
    } else if (_processBlock) {
      _processBlock(_responseData, 0);
    }
  } else {
    _responseData = nil;

    if (_processBlock) {
      _processBlock(_responseData, response ? response.statusCode : 0);
    }
  }
}

- (NSData *)outputData {
  return _responseData;
}

@end


@implementation HTTPPostRequestMessage

+ (id)messageWithName:(NSString *)name userInfo:(NSDictionary *)userInfo url:(NSString *)url body:(NSString *)body {
  HTTPPostRequestMessage *message = [[HTTPPostRequestMessage alloc] initWithName:name userInfo:userInfo];

  // must be async
  message.asynchronous = YES;

  message->_url = [url copy];
  message->_headersDict = [[NSMutableDictionary alloc] init];
  message->_body = [body copy];

  // autorelease
  return SAFE_ARC_AUTORELEASE(message);
}

+ (id)messageWithName:(NSString *)name userInfo:(NSDictionary *)userInfo url:(NSString *)url body:(NSString *)body processBlock:(ib_http_proc_t)processBlock {
  HTTPPostRequestMessage *message = [[HTTPPostRequestMessage alloc] initWithName:name userInfo:userInfo];

  // must be async
  message.asynchronous = YES;

  message->_url = [url copy];
  message->_headersDict = [[NSMutableDictionary alloc] init];
  message->_body = [body copy];
  message->_processBlock = SAFE_ARC_BLOCK_COPY(processBlock);

  // autorelease
  return SAFE_ARC_AUTORELEASE(message);
}

- (void)dealloc {
  SAFE_ARC_RELEASE(_url);
  SAFE_ARC_RELEASE(_body);
  SAFE_ARC_RELEASE(_responseData);
  SAFE_ARC_RELEASE(_headersDict);
  SAFE_ARC_BLOCK_RELEASE(_processBlock);
  SAFE_ARC_SUPER_DEALLOC();
}

#pragma mark -

- (void)addHeaderValue:(NSString *)value forKey:(NSString *)key {
  [_headersDict setValue:value forKey:key];
}

- (void)inputData:(NSData *)input {
  NSString *subbedURL = _url;
  NSError *error = nil;
  NSHTTPURLResponse *response = nil;

  // perform substitutions on URL
  for (NSString *key in self.userInfo) {
    NSString *subToken = [NSString stringWithFormat:@"[%@]", key];

    if ([[self.userInfo objectForKey:key] isKindOfClass:NSString.class]) {
      subbedURL = [subbedURL stringByReplacingOccurrencesOfString:subToken withString:[(NSString *) [self.userInfo objectForKey:key] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
  }

  // debug
  if ([MessageCenter isDebuggingEnabled]) {
    NSLog(@"OPEN URL: %@", subbedURL);
  }

  // generate request
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:subbedURL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
  [request setHTTPMethod:@"POST"];
  [request setAllHTTPHeaderFields:_headersDict];
  [request setHTTPBody:[_body dataUsingEncoding:NSUTF8StringEncoding]];
  NSData *content = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

  if (!error) {
    _responseData = [content mutableCopy];

    if (response) {
      [self setUserInfoValue:BOX_INT(response.statusCode) forKey:HTTP_STATUS_CODE];

      if (_processBlock) {
        _processBlock(_responseData, response.statusCode);
      }
    } else if (_processBlock) {
      _processBlock(_responseData, 0);
    }
  } else {
    _responseData = nil;

    if (_processBlock) {
      _processBlock(_responseData, response ? response.statusCode : 0);
    }
  }
}

- (NSData *)outputData {
  return _responseData;
}

@end


@implementation SequencedMessage

- (id)initWithName:(NSString *)name userInfo:(NSDictionary *)userInfo sequence:(NSArray *)messageSequence {
  self = [super initWithName:name userInfo:userInfo];

  if (self) {
    _messageSequence = [messageSequence mutableCopy];

    // if any message in the sequence is asynchronous, the whole thing is asynchronous
    for (DispatchMessage *iMessage in _messageSequence) {
      if (iMessage.isAsynchronous) {
        self.asynchronous = YES;
        break;
      }
    }
  }

  return self;
}

+ (id)messageWithName:(NSString *)name userInfo:(NSDictionary *)userInfo sequence:(NSArray *)messageSequence {
  SequencedMessage *message = [[SequencedMessage alloc] initWithName:name userInfo:userInfo sequence:messageSequence];

  // autorelease
  return SAFE_ARC_AUTORELEASE(message);
}

- (void)dealloc {
  SAFE_ARC_RELEASE(_messageSequence);
  SAFE_ARC_RELEASE(_outputOfLastMessage);
  SAFE_ARC_SUPER_DEALLOC();
}

#pragma mark -

- (void)inputData:(NSData *)input {
  _outputOfLastMessage = nil;

  // process each message in sequence
  for (DispatchMessage *iMessage in _messageSequence) {
    // process
    [iMessage inputData:_outputOfLastMessage];

    // release
    SAFE_ARC_RELEASE(_outputOfLastMessage);

    // gather output
    _outputOfLastMessage = SAFE_ARC_RETAIN([iMessage outputData]);
  }
}


- (NSData *)outputData {
  // this is the output of the last message we processed in inputData
  return _outputOfLastMessage;
}

@end

