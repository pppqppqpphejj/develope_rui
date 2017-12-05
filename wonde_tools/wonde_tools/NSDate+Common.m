//
//  NSDate+Common.m
//  FreeDaily
//
//  Created by YongbinZhang on 3/5/13.
//  Copyright (c) 2013 YongbinZhang
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "NSDate+Common.h"

@implementation NSDate (Common)

/****************************************************
 *@Description:根据年份、月份、日期、小时数、分钟数、秒数返回NSDate
 *@Params:
 *  year:年份
 *  month:月份
 *  day:日期
 *  hour:小时数
 *  minute:分钟数
 *  second:秒数
 *@Return:
 ****************************************************/
+ (NSDate *)dateWithYear:(NSUInteger)year
                   Month:(NSUInteger)month
                     Day:(NSUInteger)day
                    Hour:(NSUInteger)hour
                  Minute:(NSUInteger)minute
                  Second:(NSUInteger)second
{
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:[NSDate date]];
    dateComponents.year = year;
    dateComponents.month = month;
    dateComponents.day = day;
    dateComponents.hour = hour;
    dateComponents.minute = minute;
    dateComponents.second = second;
    
    return [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
}


/****************************************************
 *@Description:实现dateFormatter单例方法
 *@Params:nil
 *Return:相应格式的NSDataFormatter对象
 ****************************************************/


+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMDDDHorizontalLien
{
    static NSDateFormatter *staticDateFormatterWithFormatYYYYMMDD;
    if (!staticDateFormatterWithFormatYYYYMMDD) {
        staticDateFormatterWithFormatYYYYMMDD = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatYYYYMMDD setDateFormat:@"YYYY-MM-DD "];
    }
    
    return staticDateFormatterWithFormatYYYYMMDD;
}
+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMM
{
    static NSDateFormatter *staticDateFormatterWithFormatYYYYMM;
    if (!staticDateFormatterWithFormatYYYYMM) {
        staticDateFormatterWithFormatYYYYMM = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatYYYYMM setDateFormat:@"YYYY-MM"];
    }
    
    return staticDateFormatterWithFormatYYYYMM;
}

+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMddHHmmss
{
    static NSDateFormatter *staticDateFormatterWithFormatYYYYMMddHHmmss;
    if (!staticDateFormatterWithFormatYYYYMMddHHmmss) {
        staticDateFormatterWithFormatYYYYMMddHHmmss = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatYYYYMMddHHmmss setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    }
    
    return staticDateFormatterWithFormatYYYYMMddHHmmss;
}

+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMdd
{
    static NSDateFormatter *staticDateFormatterWithFormatYYYYMMddHHmmss;
    if (!staticDateFormatterWithFormatYYYYMMddHHmmss) {
        staticDateFormatterWithFormatYYYYMMddHHmmss = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatYYYYMMddHHmmss setDateFormat:@"YYYY.MM.dd"];
    }
    
    return staticDateFormatterWithFormatYYYYMMddHHmmss;
}


+ (NSDateFormatter *)defaultDateFormatterWithFormatMMddHHmm
{
    static NSDateFormatter *staticDateFormatterWithFormatMMddHHmm;
    if (!staticDateFormatterWithFormatMMddHHmm) {
        staticDateFormatterWithFormatMMddHHmm = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatMMddHHmm setDateFormat:@"MM-dd HH:mm"];
    }
    
    return staticDateFormatterWithFormatMMddHHmm;
}

+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMddHHmmInChinese
{
    static NSDateFormatter *staticDateFormatterWithFormatYYYYMMddHHmmssInChines;
    if (!staticDateFormatterWithFormatYYYYMMddHHmmssInChines) {
        staticDateFormatterWithFormatYYYYMMddHHmmssInChines = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatYYYYMMddHHmmssInChines setDateFormat:@"YYYY年MM月dd日 HH:mm"];
    }
    
    return staticDateFormatterWithFormatYYYYMMddHHmmssInChines;
}

+ (NSDateFormatter *)defaultDateFormatterWithFormatMMddHHmmInChinese
{
    static NSDateFormatter *staticDateFormatterWithFormatMMddHHmmInChinese;
    if (!staticDateFormatterWithFormatMMddHHmmInChinese) {
        staticDateFormatterWithFormatMMddHHmmInChinese = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatMMddHHmmInChinese setDateFormat:@"MM月dd日 HH:mm"];
    }
    
    return staticDateFormatterWithFormatMMddHHmmInChinese;
}


+ (NSDateFormatter *)defaultDateFormatterWithFormatHHYYYYMMdd
{
    static NSDateFormatter *staticDateFormatterWithFormatYYYYMMddHHmmss;
    if (!staticDateFormatterWithFormatYYYYMMddHHmmss) {
        staticDateFormatterWithFormatYYYYMMddHHmmss = [[NSDateFormatter alloc] init];
        [staticDateFormatterWithFormatYYYYMMddHHmmss setDateFormat:@"YYYY-MM-dd"];
    }
    
    return staticDateFormatterWithFormatYYYYMMddHHmmss;
}

/**********************************************************
 *@Description:获取当天的包括“年”，“月”，“日”，“周”，“时”，“分”，“秒”的NSDateComponents
 *@Params:nil
 *@Return:当天的包括“年”，“月”，“日”，“周”，“时”，“分”，“秒”的NSDateComponents
 ***********************************************************/
- (NSDateComponents *)componentsOfDay
{
    
    /*
//     ios 8之前
     return [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSWeekdayCalendarUnit | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:self];

     */
    return [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:self];
}


//  --------------------------NSDate---------------------------
/****************************************************
 *@Description:获得NSDate对应的年份
 *@Params:nil
 *@Return:NSDate对应的年份
 ****************************************************/
- (NSUInteger)year
{
    return [self componentsOfDay].year;
}

/****************************************************
 *@Description:获得NSDate对应的月份
 *@Params:nil
 *@Return:NSDate对应的月份
 ****************************************************/
- (NSUInteger)month
{
    return [self componentsOfDay].month;
}


/****************************************************
 *@Description:获得NSDate对应的日期
 *@Params:nil
 *@Return:NSDate对应的日期
 ****************************************************/
- (NSUInteger)day
{
    return [self componentsOfDay].day;
}


/****************************************************
 *@Description:获得NSDate对应的小时数
 *@Params:nil
 *@Return:NSDate对应的小时数
 ****************************************************/
- (NSUInteger)hour
{
    return [self componentsOfDay].hour;
}


/****************************************************
 *@Description:获得NSDate对应的分钟数
 *@Params:nil
 *@Return:NSDate对应的分钟数
 ****************************************************/
- (NSUInteger)minute
{
    return [self componentsOfDay].minute;
}


/****************************************************
 *@Description:获得NSDate对应的秒数
 *@Params:nil
 *@Return:NSDate对应的秒数
 ****************************************************/
- (NSUInteger)second
{
    return [self componentsOfDay].second;
}

/****************************************************
 *@Description:获得NSDate对应的星期
 *@Params:nil
 *@Return:NSDate对应的星期
 ****************************************************/
- (NSUInteger)weekday
{
    return [self componentsOfDay].weekday;
}

/******************************************
 *@Description:获取当天是当年的第几周
 *@Params:nil
 *@Return:当天是当年的第几周
 ******************************************/
- (NSUInteger)weekOfDayInYear
{
    
    
    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitWeekOfYear inUnit:NSCalendarUnitYear forDate:self];
}


/****************************************************
 *@Description:获得一般当天的工作开始时间
 *@Params:nil
 *@Return:一般当天的工作开始时间
 ****************************************************/
- (NSDate *)workBeginTime
{
    unsigned int flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [[NSCalendar currentCalendar] components:flags fromDate:self];
    [components setHour:9];
    [components setMinute:30];
    [components setSecond:0];
    
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

/****************************************************
 *@Description:获得一般当天的工作结束时间
 *@Params:nil
 *@Return:一般当天的工作结束时间
 ****************************************************/
- (NSDate *)workEndTime
{
    unsigned int flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [[NSCalendar currentCalendar] components:flags fromDate:self];
    [components setHour:18];
    [components setMinute:0];
    [components setSecond:0];
    
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}


/****************************************************
 *@Description:获取一小时后的时间
 *@Params:nil
 *@Return:一小时后的时间
 ****************************************************/
- (NSDate *)oneHourLater
{
    return [NSDate dateWithTimeInterval:3600 sinceDate:self];
}


/****************************************************
 *@Description:获得某一天的这个时刻
 *@Params:nil
 *@Return:某一天的这个时刻
 ****************************************************/
- (NSDate *)sameTimeOfDate
{
    unsigned int flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [[NSCalendar currentCalendar] components:flags fromDate:self];
    [components setHour:[[NSDate date] hour]];
    [components setMinute:[[NSDate date] minute]];
    [components setSecond:[[NSDate date] second]];
    
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

/******************************************
 *@Description:判断与某一天是否为同一天
 *@Params:
 *  otherDate:某一天
 *@Return:YES-同一天；NO-不同一天
 ******************************************/
- (BOOL)sameDayWithDate:(NSDate *)otherDate
{
    if (self.year == otherDate.year && self.month == otherDate.month && self.day == otherDate.day) {
        return YES;
    } else {
        return NO;
    }
}


/******************************************
 *@Description:判断与某一天是否为同一周
 *@Params:
 *  otherDate:某一天
 *@Return:YES-同一周；NO-不同一周
 ******************************************/
- (BOOL)sameWeekWithDate:(NSDate *)otherDate
{
    if (self.year == otherDate.year  && self.month == otherDate.month && self.weekOfDayInYear == otherDate.weekOfDayInYear) {
        return YES;
    } else {
        return NO;
    }
}

/******************************************
 *@Description:判断与某一天是否为同一月
 *@Params:
 *  otherDate:某一天
 *@Return:YES-同一月；NO-不同一月
 ******************************************/
- (BOOL)sameMonthWithDate:(NSDate *)otherDate
{
    if (self.year == otherDate.year && self.month == otherDate.month) {
        return YES;
    } else {
        return NO;
    }
}


/****************************************************
 *@Description:获取时间的字符串格式
 *@Params:nil
 *@Return:时间的字符串格式
 ****************************************************/
- (NSString *)stringOfDateWithFormatYYYYMMDDHorizontalLien
{
    return [[NSDate defaultDateFormatterWithFormatYYYYMMDDDHorizontalLien] stringFromDate:self];
}
- (NSString *)stringOfDateWithFormatYYYYMM
{
    return [[NSDate defaultDateFormatterWithFormatYYYYMM] stringFromDate:self];
}


- (NSString *)stringOfDateWithFormatYYYYMMddHHmmss
{
    return [[NSDate defaultDateFormatterWithFormatYYYYMMddHHmmss] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatYYYYMMdd
{
    return [[NSDate defaultDateFormatterWithFormatYYYYMMdd] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatMMddHHmm
{
    return [[NSDate defaultDateFormatterWithFormatMMddHHmm] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatYYYYMMddHHmmInChinese
{
    return [[NSDate defaultDateFormatterWithFormatYYYYMMddHHmmInChinese] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatMMddHHmmInChinese
{
    return [[NSDate defaultDateFormatterWithFormatMMddHHmmInChinese] stringFromDate:self];
}

- (NSString *)stringOfDateWithFormatHHMMddHHmmInChinese
{
    return [[NSDate defaultDateFormatterWithFormatHHYYYYMMdd] stringFromDate:self];
}

/****************************************************
 *@Description:世界标准时间UTC /GMT 转为当前系统时区对应的时间
 *@Params:nil
 *@Return:destinationDateNow  当前时间
 ****************************************************/

+ (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate
{
        //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
                                                                              //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
        //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
        //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
        //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
        //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate];
    return destinationDateNow;
}

/****************************************************
 *@Description:str字符串转date
 *@Params:nil
 *@Return:destinationDateNow  当前时间
 ****************************************************/

+ (NSDate *)stringToDate:(NSString *)strdate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *retdate = [dateFormatter dateFromString:strdate];

    return retdate;
}

+ (NSDate *)stringToDateYearMonth:(NSString *)strdate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *retdate = [dateFormatter dateFromString:strdate];
    
    return retdate;
}
+ (NSDate *)stringToDateYYYYMMDD:(NSString *)dateYYYYMMDD
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *retdate = [dateFormatter dateFromString:dateYYYYMMDD];
    
    return retdate;
}
/****************************************************
 *@Description:date 转字符串 str
 *@Params:nil
 *@Return:destinationDateNow  当前时间
 ****************************************************/
+  (NSString *)dateToStringHHMMSS:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    
    return strDate;
}

+  (NSString *)dateToString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:date];

    return strDate;
}

+(NSString *)dateToStringMMDD:(NSDate *)dateMMDD
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:dateMMDD];
    
    return strDate;
}

+(NSString *)dateToStringYYMM:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY年MM月"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    
    return strDate;
}

+(NSString *)dateToStringYYMMDD:(NSDate *)datYYMMDD;
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:datYYMMDD];
    
    return strDate;
}
/****************************************************
 *@Description:date 字符串 str UTC 格式 转化为 NSDate
 *@Params:nil
 *@Return:destinationDateNow  当前时间
 ****************************************************/

+ (NSDate *)getLocalFromUTC:(NSString *)utc
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSDate *ldate = [dateFormatter dateFromString:utc];

    return ldate;
}
/****************************************************
 *@Description:NSDate  格式 转化为  str UTC 字符串
 *@Params:nil
 *@Return:destinationDateNow  当前时间
 ****************************************************/

+ (NSString *)getUTCFormatDate:(NSDate *)localDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSString *dateString = [dateFormatter stringFromDate:localDate];

    return dateString;
}

/****************************************************
 *@Description将UTC日期字符串转为本地时间字符串
 *@Description输入的UTC日期格式2013-08-03T04:53:51+0000
 *@Description:可自行指定输入输出格式
 *@Params:nil
 *@Return:destinationDateNow  当前时间
 ****************************************************/
+ (NSString *)getLocalDateFormateUTCDate:(NSString *)utcDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //输入格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:localTimeZone];
    
    NSDate *dateFormatted = [dateFormatter dateFromString:utcDate];
        //输出格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:dateFormatted];

    return dateString;
}
/****************************************************
 *@Description:将本地日期字符串转为UTC日期字符串
 *@Description:本地日期格式:2013-08-03 12:53:51
 *@Description:可自行指定输入输出格式
 *@Params:nil
 *@Return:destinationDateNow  当前时间
 ****************************************************/
+(NSString *)getUTCFormateLocalDate:(NSString *)localDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //输入格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *dateFormatted = [dateFormatter dateFromString:localDate];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
        //输出格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSString *dateString = [dateFormatter stringFromDate:dateFormatted];

    return dateString;
}

/**
 *dateNow当前服务器时间
**/
+(NSString *)compareDateMax:(NSString*)dateNow withDate:(NSString*)dateCompare{
    NSString *  ci = nil;
    
//    NSString * nowStr = [[NSDate stringToDate:dateNow ] stringOfDateWithFormatHHMMddHHmmInChinese];
//    NSString * dateCompareStr = [[NSDate stringToDate:dateCompare ] stringOfDateWithFormatHHMMddHHmmInChinese];

    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //    [df setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *dt1 = [[NSDate alloc] init];
    NSDate *dt2 = [[NSDate alloc] init];
    dt1 = [df dateFromString:dateNow];//服务器时间
    dt2 = [df dateFromString:dateCompare];
    NSComparisonResult result = [dt1 compare:dt2];
//    当前时间小是有效
    
//    当前时间大是无效

    switch (result)
    {
            //dateNow比 dateCompare小
        case NSOrderedAscending:
            ci=@"1";
            break;
            //dateNow 比 dateCompare大
        case NSOrderedDescending:
            ci=@"-1";
            break;
            //dateCompare=date01
        case NSOrderedSame:
            ci= @"0";
            break;
        default: NSLog(@"erorr dates %@, %@", dt2, dt1); break;
    }
    return ci;
}


+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    
    NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1  is in the future");
//        之后
//anotherDay 比oneDay大

        return 1;
    }
    else if (result == NSOrderedAscending){
//        之前
        //NSLog(@"Date1 is in the past");
        //anotherDay 比oneDay小

        return -1;
    }
    //NSLog(@"Both dates are the same");
    return 0;
    
}

+(int)compareTwoDateStr:(NSString*)date01 withDate:(NSString*)date02{
    int ci;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];// HH:mm:ss 
    NSDate *dt1 = [[NSDate alloc] init];
    NSDate *dt2 = [[NSDate alloc] init];
    dt1 = [df dateFromString:date01];
    dt2 = [df dateFromString:date02];
    NSComparisonResult result = [dt1 compare:dt2];
    switch (result)
    {
            //date02比date01大
        case NSOrderedAscending: ci=1; break;
            //date02比date01小
        case NSOrderedDescending: ci=-1; break;//开始时间大于当前时间、不合法
            //date02=date01
        case NSOrderedSame: ci=0; break;
        default: NSLog(@"erorr dates %@, %@", dt2, dt1); break;
    }
    return ci;
}

@end
