//
//  NSDate+Common.h
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

#import <Foundation/Foundation.h>

@interface NSDate (Common)

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
                  Second:(NSUInteger)second;

/****************************************************
 *@Description:实现dateFormatter单例方法
 *@Params:nil
 *Return:相应格式的NSDataFormatter对象
 ****************************************************/

+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMM;

+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMddHHmmss;
+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMdd;

+ (NSDateFormatter *)defaultDateFormatterWithFormatHHYYYYMMdd;

+ (NSDateFormatter *)defaultDateFormatterWithFormatMMddHHmm;

+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMddHHmmInChinese;
+ (NSDateFormatter *)defaultDateFormatterWithFormatMMddHHmmInChinese;
/****************************************************
 *@Description:实现dateFormatter单例方法
 *@Params:YYYYMMDDDHorizontalLie
 *横线分割 YYYY-MM-DD 
 *Return:相应格式的NSDataFormatter对象
 ****************************************************/
+ (NSDateFormatter *)defaultDateFormatterWithFormatYYYYMMDDDHorizontalLien;

/**********************************************************
 *@Description:获取当天的包括“年”，“月”，“日”，“周”，“时”，“分”，“秒”的NSDateComponents
 *@Params:nil
 *@Return:当天的包括“年”，“月”，“日”，“周”，“时”，“分”，“秒”的NSDateComponents
 ***********************************************************/
- (NSDateComponents *)componentsOfDay;


/****************************************************
 *@Description:获得NSDate对应的年份
 *@Params:nil
 *@Return:NSDate对应的年份
 ****************************************************/
- (NSUInteger)year;

/****************************************************
 *@Description:获得NSDate对应的月份
 *@Params:nil
 *@Return:NSDate对应的月份
 ****************************************************/
- (NSUInteger)month;


/****************************************************
 *@Description:获得NSDate对应的日期
 *@Params:nil
 *@Return:NSDate对应的日期
 ****************************************************/
- (NSUInteger)day;


/****************************************************
 *@Description:获得NSDate对应的小时数
 *@Params:nil
 *@Return:NSDate对应的小时数
 ****************************************************/
- (NSUInteger)hour;


/****************************************************
 *@Description:获得NSDate对应的分钟数
 *@Params:nil
 *@Return:NSDate对应的分钟数
 ****************************************************/
- (NSUInteger)minute;


/****************************************************
 *@Description:获得NSDate对应的秒数
 *@Params:nil
 *@Return:NSDate对应的秒数
 ****************************************************/
- (NSUInteger)second;

/****************************************************
 *@Description:获得NSDate对应的星期
 *@Params:nil
 *@Return:NSDate对应的星期
 ****************************************************/
- (NSUInteger)weekday;

/******************************************
 *@Description:获取当天是当年的第几周
 *@Params:nil
 *@Return:当天是当年的第几周
 ******************************************/
- (NSUInteger)weekOfDayInYear;

/****************************************************
 *@Description:获得一般当天的工作开始时间
 *@Params:nil
 *@Return:一般当天的工作开始时间
 ****************************************************/
- (NSDate *)workBeginTime;


/****************************************************
 *@Description:获得一般当天的工作结束时间
 *@Params:nil
 *@Return:一般当天的工作结束时间
 ****************************************************/
- (NSDate *)workEndTime;


/****************************************************
 *@Description:获取一小时后的时间
 *@Params:nil
 *@Return:一小时后的时间
 ****************************************************/
- (NSDate *)oneHourLater;


/****************************************************
 *@Description:获得某一天的这个时刻
 *@Params:nil
 *@Return:某一天的这个时刻
 ****************************************************/
- (NSDate *)sameTimeOfDate;

/******************************************
 *@Description:判断与某一天是否为同一天
 *@Params:
 *  otherDate:某一天
 *@Return:YES-同一天；NO-不同一天
 ******************************************/
- (BOOL)sameDayWithDate:(NSDate *)otherDate;

/******************************************
 *@Description:判断与某一天是否为同一周
 *@Params:
 *  otherDate:某一天
 *@Return:YES-同一周；NO-不同一周
 ******************************************/
- (BOOL)sameWeekWithDate:(NSDate *)otherDate;

/******************************************
 *@Description:判断与某一天是否为同一月
 *@Params:
 *  otherDate:某一天
 *@Return:YES-同一月；NO-不同一月
 ******************************************/
- (BOOL)sameMonthWithDate:(NSDate *)otherDate;


/****************************************************
 *@Description:获取时间的字符串格式
 *@Params:nil
 *@Return:时间的字符串格式
 ****************************************************/

-(NSString *)stringOfDateWithFormatYYYYMM;
- (NSString *)stringOfDateWithFormatYYYYMMddHHmmss;
- (NSString *)stringOfDateWithFormatYYYYMMdd;
- (NSString *)stringOfDateWithFormatMMddHHmm;
- (NSString *)stringOfDateWithFormatYYYYMMddHHmmInChinese;
- (NSString *)stringOfDateWithFormatMMddHHmmInChinese;

/****************************************************
 *@Description:获取时间的字符串格式
 *@Params:nil
 * YYYYMMDDHorizontalLien
 * YYYY-MM-DD 横线分割
 *@Return:时间的字符串格式
 ****************************************************/
- (NSString *)stringOfDateWithFormatYYYYMMDDHorizontalLien;


/***只有年月日***/
- (NSString *)stringOfDateWithFormatHHMMddHHmmInChinese;
/****************************************************
 *@Description:世界标准时间UTC /GMT 转为当前系统时区对应的时间
 *@Params:nil
 *@Return:destinationDateNow  当前时间
 ****************************************************/
+(NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate;

/****************************************************
 *@Description:字符串转date
 *@Params:nil
 *yyyy-MM-dd HH:mm:s
 *@Return:destinationDateNow  当前时间
 ****************************************************/
+(NSDate *)stringToDate:(NSString *)strdate;
/****************************************************
 *@Description:date 转字符串 str
 *@Params:nil
 *@Return:destinationDateNow  当前时间
 ****************************************************/
+(NSString *)dateToString:(NSDate *)date;

/****************************************************
 *@Description:返回时间格式为HH:MM:SS *@Params:nil
 *@Return:dateToStringHHMMSS  当前时间
 ****************************************************/
+  (NSString *)dateToStringHHMMSS:(NSDate *)date;
/****************************************************
 *@Description:date 字符串 str UTC 格式 转化为 NSDate
 *@Params:nil
 *@Return:destinationDateNow  当前时间
 
 ****************************************************/

+(NSDate *)getLocalFromUTC:(NSString *)utc;

/****************************************************
 *@Description:NSDate  格式 转化为  str UTC 字符串
 *@Params:nil
 *@Return:destinationDateNow  当前时间
 ****************************************************/

+(NSString *)getUTCFormatDate:(NSDate *)localDate;

/****************************************************
  *@Description将UTC日期字符串转为本地时间字符串
  *@Description输入的UTC日期格式2013-08-03T04:53:51+0000
  *@Description:可自行指定输入输出格式
 *@Params:nil
 *@Return:destinationDateNow  当前时间
 ****************************************************/

+(NSString *)getLocalDateFormateUTCDate:(NSString *)utcDate;

/****************************************************
 *@Description:将本地日期字符串转为UTC日期字符串
 *@Description:本地日期格式:2013-08-03 12:53:51
 *@Description:可自行指定输入输出格式
 *@Params:nil
 *@Return:destinationDateNow  当前时间
 ****************************************************/
+(NSString *)getUTCFormateLocalDate:(NSString *)localDate;

/***** 时间比较 dateCompare  被比较的时间 dateNow 服务器当前时间，或者拿来以后者作比较的时间 －1 无效 1 有效 0 相等 ***/
+(NSString *)compareDateMax:(NSString*)dateNow withDate:(NSString*)dateCompare;

/**比较两个日期类型值大小**/
+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;

    /**比较两个字符串日期大小**/
+(int)compareTwoDateStr:(NSString*)date01 withDate:(NSString*)date02;

+ (NSDate *)stringToDateYYYYMMDD:(NSString *)dateYYYYMMDD;
/***
 * 返回MMDD
 * dateMMDD
 * MMDD 字符串
 ***/
+  (NSString *)dateToStringMMDD:(NSDate *)dateMMDD;
/***
 * 返回MMDD
 * dateMMDD
 * YY-MM-DD 字符串
 ***/
+(NSString *)dateToStringYYMMDD:(NSDate *)datYYMMDD;

/***
 * 返回MMDD
 * date
 * YY-MM 字符串
 ***/
+(NSString *)dateToStringYYMM:(NSDate *)date;

+ (NSDate *)stringToDateYearMonth:(NSString *)strdate;

@end
