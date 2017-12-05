//
//  Dictionary_Tool.h
//  wonde_tools
//
//  Created by 万达信息 on 2017/8/10.
//  Copyright © 2017年 wisdom_tool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dictionary_Tool : NSObject
//字符串转json 对象 NSJSONReadingMutableLeaves
+(NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString;
//NSJSONReadingMutableContainers
+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
/*** 将jion字符串转化为字符串 ***/
+(NSString *)convertToJsonData:(NSDictionary *)dict;
/*** 支付宝支付结果数据处理 NSJSONReadingMutableLeaves  ***/
+(NSDictionary *)stringToJson:(NSString *)str;
@end
