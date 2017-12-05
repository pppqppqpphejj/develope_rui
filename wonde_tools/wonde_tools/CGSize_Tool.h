//
//  CGSize_Tool.h
//  wonde_tools
//
//  Created by 万达信息 on 2017/8/10.
//  Copyright © 2017年 wisdom_tool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CGSize_Tool : NSObject
+(CGSize)sizeForNoticeTitle:(NSString*)text font:(UIFont*)font widthFloat:(CGFloat)widthfloat;
//根据字体和文字计算宽度

+(CGSize)sizeWithFont:(float)sizefontvlaues andTextString:(NSString *)string;

@end
