//
//  Array_Tool.m
//  wonde_tools
//
//  Created by 万达信息 on 2017/8/10.
//  Copyright © 2017年 wisdom_tool. All rights reserved.
//

#import "Array_Tool.h"

@implementation Array_Tool
+(BOOL)isArrayNULL:(NSArray *)arr
{
    BOOL isNULL = NO;
    if ([arr isEqual:[NSNull null]]) {
        isNULL = YES;
    }
    //    if (arr.count==0) {
    //        isNULL = YES;
    //    }
    if (arr==nil) {
        isNULL = YES;
    }
    if (arr==NULL) {
        isNULL = YES;
    }
    return isNULL;
}
+(BOOL)isMutableArrayNULL:(NSMutableArray *)arrMutable
{
    BOOL isNULL = NO;
    if ([arrMutable isEqual:[NSNull null]]) {
        isNULL = YES;
    }
    if (arrMutable.count==0) {
        isNULL = YES;
    }
    if (arrMutable==nil) {
        isNULL = YES;
    }
    if (arrMutable==NULL) {
        isNULL = YES;
    }
    return isNULL;
}
+ (NSArray *)splitByString:(NSString *)string {
    return [string componentsSeparatedByString:string];
}

+ (NSMutableArray *)substringByRegular:(NSString *)regular {
    NSRange r = [regular rangeOfString:regular options:NSRegularExpressionSearch];
    NSMutableArray *arr = [NSMutableArray array];
    if (r.length != NSNotFound &&r.length != 0) {
        while (r.length != NSNotFound &&r.length != 0) {
            NSString* substr = [regular substringWithRange:r];
            [arr addObject:substr];
            NSRange startr = NSMakeRange(r.location+r.length, [regular length]-r.location-r.length);
            r = [regular rangeOfString:regular options:NSRegularExpressionSearch range:startr];
        }
    }
    return arr;
}
@end

@implementation StringClass

-(NSArray *)splitByString:(NSString *)string {
    return [string componentsSeparatedByString:string];
}

-(NSMutableArray *)substringByRegular:(NSString *)regular {
    NSRange r = [regular rangeOfString:regular options:NSRegularExpressionSearch];
    NSMutableArray *arr = [NSMutableArray array];
    if (r.length != NSNotFound &&r.length != 0) {
        while (r.length != NSNotFound &&r.length != 0) {
            NSString* substr = [regular substringWithRange:r];
            [arr addObject:substr];
            NSRange startr = NSMakeRange(r.location+r.length, [regular length]-r.location-r.length);
            r = [regular rangeOfString:regular options:NSRegularExpressionSearch range:startr];
        }
    }
    return arr;
}
@end
