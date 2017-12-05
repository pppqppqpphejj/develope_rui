//
//  UIColor+UIColor_Tool.h
//  wonde_tools
//
//  Created by 万达信息 on 2017/8/11.
//  Copyright © 2017年 wisdom_tool. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (UIColor_Tool)

+ (instancetype)colorWithHex:(NSString*)hex andAlpha:(CGFloat)alpha;
+ (instancetype)colorWith3DigitHex:(NSString *)hex andAlpha:(CGFloat)alpha;
+ (instancetype)colorWith6DigitHex:(NSString *)hex andAlpha:(CGFloat)alpha;


@end
