//
//  ShapeLayer_Tool.m
//  wonde_tools
//
//  Created by 万达信息 on 2017/8/10.
//  Copyright © 2017年 wisdom_tool. All rights reserved.
//

#import "ShapeLayer_Tool.h"

@implementation ShapeLayer_Tool
/*!
 *  函数名称：
 *  函数描述：
 *  返回参数：
 *  参数描述：isToLeft：是否设置左上角圆角  isToRight：是否设置右上角圆角  isToBottomLeft：是否设置左下角圆角   isToBottomRight：是否设置右下角圆角  rect：需要设置的视图位置大小  cornerRadSize：圆角的大小
 */
+(CAShapeLayer *)getCornerRidusMashWithIsToLeft :(BOOL)isToLeft isToRight :(BOOL)isToright isToBottomLeft :(BOOL)isToBottomLeft isToBottomRight :(BOOL)isToBottomRight Rect :(CGRect)rect cornerRadSize :(CGSize)cornerRadSize{
    
    if (!isToLeft && !isToright && !isToBottomLeft && !isToBottomRight) {
        return nil;
    }
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    UIRectCorner corner = UIRectCornerAllCorners;
    
    if (isToLeft) {
        corner = UIRectCornerTopLeft;
    }
    
    if (isToright) {
        if (isToLeft) {
            corner = corner | UIRectCornerTopRight;
        }else{
            corner = UIRectCornerTopRight;
        }
    }
    
    if (isToBottomLeft) {
        if (isToLeft || isToright) {
            corner = corner | UIRectCornerBottomLeft;
        }else{
            corner = UIRectCornerBottomLeft;
        }
    }
    
    if (isToBottomRight) {
        if (isToLeft || isToright || isToBottomLeft) {
            corner = corner | UIRectCornerBottomRight;
        }else{
            corner = UIRectCornerBottomRight;
        }
    }
    
    shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:cornerRadSize].CGPath;
    return shapeLayer;
}

@end
