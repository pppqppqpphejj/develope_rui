//
//  CGSize_Tool.m
//  wonde_tools
//
//  Created by 万达信息 on 2017/8/10.
//  Copyright © 2017年 wisdom_tool. All rights reserved.
//

#import "CGSize_Tool.h"

@implementation CGSize_Tool

//根据字体和文字计算宽度
+(CGSize)sizeWithFont:(float)sizefontvlaues andTextString:(NSString *)string
{
    CGSize size =[string sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:sizefontvlaues]}];
    size = CGSizeMake(size.width+1, size.height);
    return size;
}

/***
 * 描述说明: 根据文本内容计算其高度，控件自适应文本内容
 * 参数说明:text 传入的文本字符串 font 传入的控件font(最好传入设置的文本字体大小 float) CGFloat传入的控件宽度
 * 返回值说明:，如:无用NULL表示
 ***/
+(CGSize)sizeForNoticeTitle:(NSString*)text font:(UIFont*)font widthFloat:(CGFloat)widthfloat{
    if ([text isKindOfClass:[NSNull class]]) {
        return CGSizeZero;
    }else{
        CGFloat maxWidth = widthfloat;
        CGSize maxSize = CGSizeMake(maxWidth, MAXFLOAT);
        
        CGSize textSize = CGSizeZero;
        // iOS7以后使用boundingRectWithSize，之前使用sizeWithFont
        if ([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
            // 多行必需使用NSStringDrawingUsesLineFragmentOrigin，网上有人说不是用NSStringDrawingUsesFontLeading计算结果不对
            NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine;
            //        |
            //        NSStringDrawingUsesFontLeading|NSStringDrawingUsesDeviceMetrics|NSStringDrawingTruncatesLastVisibleLine
            
            //NSStringDrawingUsesDeviceMetrics  计算布局时使用图元字形（而不是印刷字体）。坑爹属性，计算行高时不用，切记
            
            
            NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
            [style setLineBreakMode:NSLineBreakByCharWrapping];
            
            NSDictionary *attributes = @{ NSFontAttributeName : font};
            
            CGRect rect = [text boundingRectWithSize:maxSize
                                             options:opts
                                          attributes:attributes
                                             context:nil];
            textSize = rect.size;
        }
        else {
            textSize = [text sizeWithFont:font constrainedToSize:maxSize lineBreakMode:NSLineBreakByCharWrapping];
        }
        textSize = CGSizeMake(textSize.width, textSize.height+1);
        return textSize;
    }
    //    CGRect screen = [UIScreen mainScreen].bounds;
    
}

@end
