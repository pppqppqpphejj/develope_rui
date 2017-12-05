//
//  Date_Tool
//  wonde_tools
//
//  Created by 万达信息 on 2017/8/10.
//  Copyright © 2017年 wisdom_tool. All rights reserved.
//

#import "Date_Tool.h"

@implementation Date_Tool

#pragma mark - 对应格式的字符串转换成时间
+(NSDate *)getDateForString:(NSString *) senddate dateFormatStr:(NSString *) dateFormatStr{
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    if([@"yyyy-MM-dd" isEqualToString:dateFormatStr]){
        [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }else{
        [dateformatter setDateFormat:dateFormatStr];
    }
    
    //去掉h5产生的时间后缀
    if(senddate && [senddate rangeOfString:@".0"].length>0){
        senddate=[senddate substringToIndex:[senddate rangeOfString:@".0"].location];
    }
    if([@"yyyy-MM-dd" isEqualToString:dateFormatStr]){
        if(senddate && [senddate rangeOfString:@" "].length>0){
            senddate=[senddate substringToIndex:[senddate rangeOfString:@" "].location];
            senddate=[NSString stringWithFormat:@"%@ %@",senddate,@"00:00:00"];
        }
    }
    
    NSDate *  locationString=[dateformatter dateFromString:senddate];
    
    return locationString;
}

#pragma mark - 两时间相差多少s
+(long)getDateInterval:(NSDate *)beginDate andEndDay:(NSDate *)endDate{
    
    //取两个日期对象的时间间隔：
    //这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:typedef double NSTimeInterval;
    long time=[beginDate timeIntervalSinceDate:endDate];
    return time;
}

#pragma mark - 时间转成对应格式的字符串
+(NSString *)dateFormat:(NSDate *)date dateFormatStr:(NSString *) dateFormatStr{
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:dateFormatStr];
    NSString *  locationString=[dateformatter stringFromDate:date]; 
    return locationString;
}

#pragma mark - 时间字符串转成对应格式的字符串
+(NSString *)dateFormatWithString:(NSString *)date dateFormatStr:(NSString *) dateFormatStr{
    NSDate * time=[Date_Tool getDateForString:date dateFormatStr:dateFormatStr];
    NSString *  locationString=[Date_Tool dateFormat:time dateFormatStr:dateFormatStr];
    return locationString;
}

#pragma mark - 时间转成对应格式的字符串  并添加或减少多少秒
+(NSString *)dateFormat:(NSDate *)date dateFormatStr:(NSString *)dateFormatStr addOrReduceTime:(NSTimeInterval) interval {
    NSDateFormatter * dateformatter = [[NSDateFormatter alloc] init];
    NSDate *date1 = [date initWithTimeIntervalSinceNow:interval];//interval  1:天数  24*60*60*1
    [dateformatter setDateFormat:dateFormatStr];
    return [NSString stringWithFormat:@"%@",[dateformatter stringFromDate:date1]];
}


#pragma mark - 将GMT时间转换成当前时区时间
+(NSDate *)getLocaleDate:(NSDate *)date{
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    
    NSInteger interval = [zone secondsFromGMTForDate: date];
    
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    
    return localeDate;
}

#pragma mark - 返回当前时间的数字字符串
+(NSString *)getTimeString{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000;
    NSString * timeString = [NSString stringWithFormat:@"%f", a];//转为字符型
    timeString = [timeString stringByReplacingOccurrencesOfString:@"." withString:@""];
    return timeString;
}

@end
