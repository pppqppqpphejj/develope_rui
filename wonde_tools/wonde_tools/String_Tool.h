//
//  String_Tool.h
//  wonde_tools
//
//  Created by 万达信息 on 2017/8/10.
//  Copyright © 2017年 wisdom_tool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface String_Tool : NSObject

- (BOOL)isSysIos7Later;
- (BOOL)isSysIos8Later;
- (BOOL)isSysIos8LessThanLater;
//判斷台灣地區手機號碼是否正確 YES正確 NO錯誤
+(BOOL)determineCellPhoneNumber :(NSString*)phoneNumber;

//判斷大陸地區手機號是否正確 YES正確 NO錯誤
+ (BOOL)ValidateMobileNumber:(NSString *)mobileNum;

//判断字符串是否只包含数字和英文字母 YES是  NO否
+(BOOL)judgeStringIsNumberAndLetter :(NSString*)str;

//判斷字符串是否只包含數字 YES是  NO否
+(BOOL)judgeStringIsNumber:(NSString *)str;

//判斷字符串是否只包含字母 YES是  NO否
+(BOOL)judgeStringIsLetter:(NSString *)str;
/*** 判断字符串是否为空、不为空返回NO、为空返回YES ***/

+(BOOL)judgeStringIsNuLL :(NSString*)str;
/**
 @ios 判断字符串为空和只为空格解决办法
 **/
+(BOOL)isBlankString:(NSString *)string;
/***
 * 判断传入的aString字符串 是否含有someString
 * aString/someString
 * 返回yes or no
 ***/
+(BOOL)aStringContentSomeStrinGo:(NSString *)aString content:(NSString *)someString;

/**
 过滤掉html字符串的标签
 
 @param 传入html 字符串
 @return NSAttributedString 返回富文本字符串 去掉富文本标签<></>标签
 */
+(NSAttributedString *)htmlLableText:(NSString *)string;

/*** 系统去掉收尾为空格的字符串 ***/
+(NSString *)returnStringblank:(NSString  *)string;

/*** 判断字符串是否为空、不为空返回自己本身、为空返回@"" ***/

+(NSString*)judgeStringNuLL :(NSString*)str1;

/***读取应用本地数据 fileName 文件名  fileType 文件类型***/

+(id )loalAppReadData:(NSString*)fileName fileType:(NSString*)fileType;

/*** 返回文件路径 ***/

+ (NSString *)documentsPath;

+(NSString *)documentsPath:(NSString *)fileName;

/*** 将时间转化为秒 ***/

+(NSString *)timeFormatted:(long long) miliSeconds;

/**返回json字符串**/

+ (NSString *)JSONStringWithJSONObject:(id)jsonObject encoding:(NSStringEncoding)encoding;

/*** //给UILabel设置行间距和字间距 ***/

+(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font;

/*** 根据UITextView来得到里面字符串的大小 ***/

+(CGSize)getStringRectInTextView:(NSString *)string InTextView:(UITextView *)textView;

/*** 获取UIFont大小字符串在界面中所占的大小 ***/

+(CGSize)getStringCGSize:(NSString *)string uiFont:(UIFont *)uiFont;

/*** 计算UILabel的高度(带有行间距的情况) ***/

+(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width;

/*** 正则表达式匹配(判断是否符合格式) ***/

+(BOOL)regexToBool:(NSString *)string regex:(NSString *)regex;

/*** 正则表达式匹配(查找字符串,会返回第一个匹配结果的位置) ***/

+(NSString *)regexToString:(NSString *)string regex:(NSString *)regex;

/*** 正则表达式匹配(会返回第一个匹配结果的位置) ***/
+(NSArray *)regexToList:(NSString *)string regex:(NSString *)regex;

/*** 汉字转拼音 ***/
+(NSString *)ChineseToPinyin:(NSString *)Chinese;
@end
