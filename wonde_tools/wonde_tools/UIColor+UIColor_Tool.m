//
//  UIColor+UIColor_Tool.m
//  wonde_tools
//
//  Created by 万达信息 on 2017/8/11.
//  Copyright © 2017年 wisdom_tool. All rights reserved.
//

#import "UIColor+UIColor_Tool.h"



@implementation UIColor (UIColor_Tool)

#pragma mark - Public Methods
+ (UIColor*)colorWithHex:(NSString*)hex andAlpha:(CGFloat)alpha
{
    
    UIColor *color;
    
    switch ( hex.length ) {
            
        case 3:
            color = [UIColor colorWith3DigitHex:hex andAlpha:alpha];
            break;
            
        case 6:
            color = [UIColor colorWith6DigitHex:hex andAlpha:alpha];
            break;
            
        default:
            NSAssert( hex.length == 6 || hex.length == 3 , @"Your hex color value is malformed. It should either be three or six characters in length.");
            break;
    }
    
    return color;
}

#pragma mark - Private Methods (PrivateColorWithHexAndAlpha)
+ (UIColor *)colorWith3DigitHex:(NSString *)hex andAlpha:(CGFloat)alpha
{
    // Red Value
    NSString *redHexString = [hex substringWithRange:NSMakeRange(0, 1)];
    NSString *modifiedRedHexString = [NSString stringWithFormat:@"%@%@", redHexString, redHexString];
    NSScanner *redScanner = [NSScanner scannerWithString:modifiedRedHexString];
    unsigned int redHexInt = 0;
    [redScanner scanHexInt:&redHexInt];
    CGFloat redValue = redHexInt/255.0f;
    
    // Green Value
    NSString *greenHexString = [hex substringWithRange:NSMakeRange(1, 1)];
    NSString *modifiedGreenHexString = [NSString stringWithFormat:@"%@%@", greenHexString, greenHexString];
    NSScanner *greenScanner = [NSScanner scannerWithString:modifiedGreenHexString];
    unsigned int  greenHexInt = 0;
    [greenScanner scanHexInt:&greenHexInt];
    CGFloat greenValue = greenHexInt/255.0f;
    
    // Blue Value
    NSString *blueHexString = [hex substringWithRange:NSMakeRange(2, 1)];
    NSString *modifiedBlueHexString = [NSString stringWithFormat:@"%@%@", blueHexString, blueHexString];
    NSScanner *blueScanner = [NSScanner scannerWithString:modifiedBlueHexString];
    unsigned int  blueHexInt = 0;
    [blueScanner scanHexInt:&blueHexInt];
    CGFloat blueValue = blueHexInt/255.0f;
    
    return [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:alpha];
}

+ (UIColor *)colorWith6DigitHex:(NSString *)hex andAlpha:(CGFloat)alpha
{
    // Red Value
    NSString *redHexString = [hex substringWithRange:NSMakeRange(0, 2)];
    NSScanner *redScanner = [NSScanner scannerWithString:redHexString];
    unsigned int  redHexInt = 0;
    [redScanner scanHexInt:&redHexInt];
    CGFloat redValue = redHexInt/255.0f;
    
    // Green Value
    NSString *greenHexString = [hex substringWithRange:NSMakeRange(2, 2)];
    NSScanner *greenScanner = [NSScanner scannerWithString:greenHexString];
    unsigned int  greenHexInt = 0;
    [greenScanner scanHexInt:&greenHexInt];
    CGFloat greenValue = greenHexInt/255.0f;
    
    // Blue Value
    NSString *blueHexString = [hex substringWithRange:NSMakeRange(4, 2)];
    NSScanner *blueScanner = [NSScanner scannerWithString:blueHexString];
    unsigned int  blueHexInt = 0;
    [blueScanner scanHexInt:&blueHexInt];
    CGFloat blueValue = blueHexInt/255.0f;
    
    return [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:alpha];
}

@end
