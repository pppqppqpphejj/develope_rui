//
//  Image_Tool.h
//  wonde_tools
//
//  Created by 万达信息 on 2017/8/10.
//  Copyright © 2017年 wisdom_tool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Image_Tool : NSObject
/*** 改变图片大小 ***/
+ (UIImage *)compressImage:(UIImage *)image newWidth:(CGFloat)newImageWidth;
/*** 改变图片方向 ***/
+ (UIImage *)normalizedImage :(UIImage*)image;
@end
