//
//  Array_Tool.h
//  wonde_tools
//
//  Created by 万达信息 on 2017/8/10.
//  Copyright © 2017年 wisdom_tool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Array_Tool : NSObject
/**判断数组是否为空**/
+(BOOL)isArrayNULL:(NSArray *)arr;
/**判断可变数组是否为空**/

+(BOOL)isMutableArrayNULL:(NSMutableArray *)arrMutable;
/*** 分割字符串返回数组 ***/
+ (NSArray *)splitByString:(NSString *)string;

+(NSMutableArray *)substringByRegular:(NSString *)regular;

@end


@interface StringClass : NSObject
-(NSArray *)splitByString:(NSString *)string;

-(NSMutableArray *)substringByRegular:(NSString *)regular;

@end
