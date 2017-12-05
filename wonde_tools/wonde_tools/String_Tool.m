//
//  String_Tool.m
//  wonde_tools
//
//  Created by 万达信息 on 2017/8/10.
//  Copyright © 2017年 wisdom_tool. All rights reserved.
//

#import "String_Tool.h"
#define UILABEL_LINE_SPACE 6
#define HEIGHT [ [ UIScreen mainScreen ] bounds ].size.height
@implementation String_Tool

#pragma mark - 读取应用本地信息

- (BOOL)isSysIos7Later
{
    // return NO;
    
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
        return YES;
    return NO;
}

- (BOOL)isSysIos8Later
{
    // return NO;
    
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
        return YES;
    return NO;
}

- (BOOL)isSysIos8LessThanLater
{
    // return NO;
    
    if([[[UIDevice currentDevice] systemVersion] floatValue] <8.0)
        return YES;
    return NO;
}
#pragma mark 判斷台灣地區手機號是否正確
+(BOOL)determineCellPhoneNumber :(NSString*)phoneNumber{
    
    NSString *MOBILE =  @"(([0][9])|([9]))\\d{8}";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if ([regextestmobile evaluateWithObject:phoneNumber] == YES)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark 判斷大陸地區手機號是否正確 YES正確 NO錯誤
+ (BOOL)ValidateMobileNumber:(NSString *)mobileNum
{
    
    /**
     * 手机号码
     * 移动：  134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     * 虚拟：170
     */
    NSString *MOBILE =  @"[1][3578]\\d{9}";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if ([regextestmobile evaluateWithObject:mobileNum] == YES)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


#pragma mark 判断字符串是否只包含数字和英文字母
+(BOOL)judgeStringIsNumberAndLetter :(NSString*)str{
    
    NSString *regex = @"^[0-9a-zA-Z]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([predicate evaluateWithObject:str]) {
        return YES;
    }else{
        return NO;
    }
}

#pragma mark 判斷字符串是否只包含數字
+(BOOL)judgeStringIsNumber:(NSString *)str{
    NSString *regex = @"^[0-9]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([predicate evaluateWithObject:str]) {
        return YES;
    }else{
        return NO;
    }
}

#pragma mark 判斷字符串是否只包含字母
+(BOOL)judgeStringIsLetter:(NSString *)str{
    NSString *regex = @"^[a-zA-Z]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([predicate evaluateWithObject:str]) {
        return YES;
    }else{
        return NO;
        
    }
}

#pragma mark 判断字符串是否为空 YES为空 NO不为空
+(BOOL)judgeStringIsNuLL :(NSString*)str{
    
    BOOL boool = NO;

    if(str==nil||str==NULL){
        boool = YES;
    }
    if ([str isKindOfClass:[NSNull class]]) {
        boool = YES;
    }
    NSString * string=[NSString stringWithFormat:@"%@",str];
    if([@"<null>" isEqualToString:string]){
        boool = YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        boool = YES;
    }
    return boool;
}
+(BOOL)aStringContentSomeStrinGo:(NSString *)aString content:(NSString *)someString;
{
    BOOL boool = NO;
    
    if([aString rangeOfString:someString].location !=NSNotFound)//_roaldSearchText
    {
        boool= YES;
    }
    else
    {
        boool = NO;
    }
    return boool;
}
+(NSAttributedString *)htmlLableText:(NSString *)string
{
    
    NSAttributedString * html = nil;
    
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[string dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    
    html = attrStr;
    
    return html;
    
    
}


+(NSString*)judgeStringNuLL :(NSString*)str1{
    NSString*  str = [NSString stringWithFormat:@"%@",str1];
    if ([str isEqual:[NSNull null]] )
    {
        return @"";

    }
   else if ([str isKindOfClass:[NSNull class]] )
    {
        return @"";

    }
   else if (str == nil )
    {
        return @"";
        
    }
   else if ([str isEqualToString:@"(null)"])
    {
        return @"";
        
    }
    
    else if (str.length == 0)
    {
        return @"";
    }
    else
    {
        return str;
    }
}
+(id)loalAppReadData:(NSString*)fileName fileType:(NSString*)fileType
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:fileName ofType:fileType];
    //    NSLogPrint(@"fielPath----%@",plistPath);
    
    NSString *str = [[NSString alloc] initWithContentsOfFile:plistPath encoding:NSUTF8StringEncoding error:nil];
    //    NSLogPrint(@"fileStr----%@",str);
    
    //将字符串转为nsdata类型
    
    NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
    //    将nsdata类型转为NSDictionary
    NSError *error;
    id dataDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers | NSJSONReadingAllowFragments error:&error];
    //    NSLogPrint(@"pDic----%@",dataDic);
    if (error) {
        NSLog(@"error--:%@",error);
    }
    
    return dataDic;
}


#pragma mark--helper
+ (NSString *)documentsPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+(NSString *)documentsPath:(NSString *)fileName{
    return [[self  documentsPath] stringByAppendingPathComponent:fileName];
}
#pragma mark 将秒转换为时间
+(NSString *)timeFormatted:(long long) miliSeconds{
    
    NSTimeInterval tempMilli = miliSeconds;
    NSTimeInterval seconds = tempMilli/1000.0;
    NSDate *myDate = [NSDate dateWithTimeIntervalSince1970:seconds];
    
    NSCalendar *calendar = [ NSCalendar currentCalendar ];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear ;
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[ NSDate date ]];
    NSDateComponents *myCmps = [calendar components:unit fromDate:myDate];
    
    NSDateFormatter *dateFmt = [[ NSDateFormatter alloc ] init ];
    if (nowCmps.year != myCmps.year) {
        // dateFmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        dateFmt.dateFormat = @"yyyy-MM-dd";
    } else {
        if (nowCmps.day==myCmps.day) {
            dateFmt.dateFormat = @"HH:mm";
        } else if ((nowCmps.day-myCmps.day)==1) {
            dateFmt.dateFormat = @"昨天 HH:mm";
        } else {
            dateFmt.dateFormat = @"MM-dd";
        }
    }
    return [dateFmt stringFromDate:myDate];
}
+ (NSString *)JSONStringWithJSONObject:(id)jsonObject encoding:(NSStringEncoding)encoding {
    if ([NSJSONSerialization isValidJSONObject:jsonObject])  {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        return [[NSString alloc] initWithData:jsonData encoding:encoding];
    }
    return nil;
}

+(NSString *)returnStringblank:(NSString *)string
{
    NSString * str = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return str;
}
+(BOOL)isBlankString:(NSString *)string{
    
    if (string == nil) {
        return YES;
    }
    
    if (string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        
        return YES;
    }
    return NO;
}



//给UILabel设置行间距和字间距
+(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = UILABEL_LINE_SPACE; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    label.attributedText = attributeStr;
}

//计算UILabel的高度(带有行间距的情况)
+(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = UILABEL_LINE_SPACE;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}


#pragma mark - 判断是否可转为整形
+(BOOL)isPureInt:(NSString *)str{
    str=[NSString stringWithFormat:@"%@",str];
    NSScanner* scan = [NSScanner scannerWithString:str];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

#pragma mark - 判断是否可转为浮点形
+(BOOL)isPureFloat:(NSString *)str{
    str=[NSString stringWithFormat:@"%@",str];
    NSScanner* scan = [NSScanner scannerWithString:str];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

#pragma mark -  计算字符串的字节
+(int)strConvertToInt:(NSString*)strtemp {
    
    NSString *message =strtemp;
    int chinese=0;
    for(int i=0; i< [message length];i++){
        int a = [message characterAtIndex:i];
        if( a >= 0x4e00 && a <= 0x9fff)
            chinese++;
    }
    int length=(int)[message length]+chinese;
    return length;
    
}

#pragma mark - 获取UIFont大小字符串在界面中所占的大小
+(CGSize)getStringCGSize:(NSString *)string uiFont:(UIFont *)uiFont{
    //这种方式准确性更高
    UITextView * text=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    text.text = string;
    text.font = uiFont;
    return [self getStringRectInTextView:string InTextView:text];
}

#pragma mark - 根据UITextView来得到里面字符串的大小
+(CGSize)getStringRectInTextView:(NSString *)string InTextView:(UITextView *)textView;
{
    //实际textView显示时我们设定的宽
    CGFloat contentWidth = CGRectGetWidth(textView.frame);
    //但事实上内容需要除去显示的边框值
    CGFloat broadWith    = (textView.contentInset.left + textView.contentInset.right
                            + textView.textContainerInset.left
                            + textView.textContainerInset.right
                            + textView.textContainer.lineFragmentPadding/*左边距*/
                            + textView.textContainer.lineFragmentPadding/*右边距*/);
    
    CGFloat broadHeight  = (textView.contentInset.top
                            + textView.contentInset.bottom
                            + textView.textContainerInset.top
                            + textView.textContainerInset.bottom);//+self.textview.textContainer.lineFragmentPadding/*top*//*+theTextView.textContainer.lineFragmentPadding*//*there is no bottom padding*/);
    
    //由于求的是普通字符串产生的Rect来适应textView的宽
    contentWidth -= broadWith;
    CGSize InSize = CGSizeMake(contentWidth, MAXFLOAT);
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = textView.textContainer.lineBreakMode;
    NSDictionary *dic = @{NSFontAttributeName:textView.font, NSParagraphStyleAttributeName:[paragraphStyle copy]};
    CGSize calculatedSize =  [string boundingRectWithSize:InSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    CGSize adjustedSize = CGSizeMake(ceilf(calculatedSize.width),calculatedSize.height + broadHeight);//ceilf(calculatedSize.height)
    return adjustedSize;
}

#pragma mark - 正则表达式匹配(判断是否符合格式)
+(BOOL)regexToBool:(NSString *)string regex:(NSString *)regex{
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isValid = [predicate evaluateWithObject:string];
    return isValid;
}

#pragma mark - 正则表达式匹配(查找字符串,会返回第一个匹配结果的位置)
+(NSString *)regexToString:(NSString *)string regex:(NSString *)regex{
    NSString * searchText = string;
    NSRange range = [searchText rangeOfString:regex options:NSRegularExpressionSearch];
    if (range.location != NSNotFound) {
        NSLog(@"%@", [searchText substringWithRange:range]);
        return [searchText substringWithRange:range];
    }
    return nil;
}

#pragma mark - 正则表达式匹配(会返回第一个匹配结果的位置)
+(NSArray *)regexToList:(NSString *)string regex:(NSString *)regex{
    NSString * searchText = string;
    NSError * error = NULL;
    NSRegularExpression * regex_t = [NSRegularExpression regularExpressionWithPattern:regex options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *arrayOfAllMatches = [regex_t matchesInString:searchText options:0 range:NSMakeRange(0, [searchText length])];
    NSMutableArray * returnList=[[NSMutableArray alloc]init];
    for (NSTextCheckingResult * match in arrayOfAllMatches)
    {
        NSString * substringForMatch = [string substringWithRange:match.range];
        [returnList addObject:substringForMatch];
    }
    return returnList;
}

#pragma mark - 汉字转拼音
+(NSString *)ChineseToPinyin:(NSString *)Chinese{
    NSString *hanziText =Chinese;
    if ([hanziText length]) {
        NSMutableString *ms = [[NSMutableString alloc] initWithString:hanziText];
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformMandarinLatin, NO)) {
            NSLog(@"pinyin: %@", ms);
            return ms;
        }
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformStripDiacritics, NO)) {
            NSLog(@"pinyin: %@", ms);
            return ms;
        }
    }
    return Chinese;
}

@end
