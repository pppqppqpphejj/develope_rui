//
//  Date_Tool
//  wonde_tools
//
//  Created by 万达信息 on 2017/8/10.
//  Copyright © 2017年 wisdom_tool. All rights reserved.
//


#import <Foundation/Foundation.h>

///时间常用类
@interface Date_Tool : NSDate

///对应格式的字符串转换成时间  yyyy-MM-dd HH:mm:ss  只获取年月日:yyyy-MM-dd
+(NSDate *)getDateForString:(NSString *) senddate dateFormatStr:(NSString *) dateFormatStr;

///两时间相差多少秒 开始时间-结束时间
+(long)getDateInterval:(NSDate *)beginDate andEndDay:(NSDate *)endDate;

///时间转成对应格式的字符串  yyyy-MM-dd HH:mm:ss
+(NSString *)dateFormat:(NSDate *)date dateFormatStr:(NSString *) dateFormatStr;

///时间字符串转成对应格式的字符串
+(NSString *)dateFormatWithString:(NSString *)date dateFormatStr:(NSString *) dateFormatStr;

///时间转成对应格式的字符串  并添加或减少多少秒  yyyy-MM-dd HH:mm:ss
+(NSString *)dateFormat:(NSDate *)date dateFormatStr:(NSString *)dateFormatStr addOrReduceTime:(NSTimeInterval) interval;

///将GMT时间转换成当前时区时间
+(NSDate *)getLocaleDate:(NSDate *)date;

///返回当前时间的数字字符串 (可用于本地唯一编码,时间的不可逆性)
+(NSString *)getTimeString;

@end
