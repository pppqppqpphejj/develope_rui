//
//  PopView.m
//  Mygoplus
//
//  Created by 万达信息 on 2017/7/27.
//  Copyright © 2017年 Mygoplus. All rights reserved.
//

#import "PopView.h"

@implementation PopView

+(PopView *)PopViewShare
{
    PopView  * viewShare = [[[NSBundle mainBundle]loadNibNamed:@"PopView" owner:self options:@{@"view":@"PopView"}] objectAtIndex:0];
        return viewShare;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(120, 10, 80, 80)];
//    view2.backgroundColor = [UIColor redColor];
//    [self.btnView addSubview:view2];
//
    
//设置底部半圆
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.btnView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(8, 8)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.btnView.bounds;
    maskLayer.path = maskPath.CGPath;
    self.btnView.layer.mask = maskLayer;
}
-(void)showPop:(UIViewController *)viewWindow
{
//    PopView * popView = [[PopView alloc] init];
    self.hidden = NO;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [viewWindow.view addSubview:self];

    NSArray * HLayoutConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[self]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(self)];
    NSArray * VLayoutConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[self]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(self)];
    
    [viewWindow.view addConstraints:VLayoutConstraint];
    [viewWindow.view addConstraints:HLayoutConstraint];

    }
- (IBAction)btnHidden:(id)sender {
    self.hidden = YES;
    [self removeFromSuperview];
}


@end
