//
//  PopView.h
//  Mygoplus
//
//  Created by 万达信息 on 2017/7/27.
//  Copyright © 2017年 Mygoplus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopViewDelegate <NSObject>

-(void)PopViewRow:(NSDictionary*)dic;

@end

@interface PopView : UIView
@property (weak, nonatomic) IBOutlet UIButton *btnView;

 +(PopView *)PopViewShare;
/*** UIViewController  not nil ***/

-(void)showPop:(UIViewController *)viewWindow;

@end
