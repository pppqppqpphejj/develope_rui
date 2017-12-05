//
//  Macro_Tool.h
//  wonde_tools
//
//  Created by 万达信息 on 2017/8/25.
//  Copyright © 2017年 wisdom_tool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Macro_Tool : NSObject

//防止循环引用 block
#define kWeakObject(obj)  __weak typeof(self)weakSelf = self;
//===========设备有关
/*屏幕大小*/
#define SCREEN_FRAME [[UIScreen mainScreen]  bounds]
/*屏幕宽度*/
#define SCREEN_WIDTH [[UIScreen mainScreen]  bounds].size.width
/*屏幕高度*/
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

//
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

//判断是否为iPhone 4
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)

//判断是否为iPhone 6

#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
//判断是否为iPhone 6p

#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

//判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//判断是否为iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//判断是否为ipod
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

//判断是否为iPhone5
#define IS_IPHONE_5_SCREEN [[UIScreen mainScreen] bounds].size.height >= 568.0f && [[UIScreen mainScreen] bounds].size.height < 1024.0f
//模拟器打印
#ifdef DEBUG
#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#   define ELog(err)
#endif


//IOS 字符串为空判断
#define strIsJudgeEmpty(str) (str == nil ||[str isEqualToString:@"<null>"]||[str isEqualToString:@"(null)"]|| [str isKindOfClass:[NSNull class]]||[str length]<1 ? YES : NO )
//A better version of NSLog
//判断对象为空
#define isNSNull(strNull) ([strNull isEqual:[NSNull null]])
//==常见变量
#define PI 3.14159265358979323846
//颜色值转换  0b 八进制         0x 十六进制
#define Color(r,g,b,a) [UIColor colorWithRed:(r/(float)255) green:(g/(float)255) blue:(b/(float)255) alpha:a]
#define EARTH_RADIUS 6378137.0;//地球半径


#define ORIGINAL_MAX_WIDTH 640.0f











@end
