//
//  Drvice_tool
//  wonde_tools
//
//  Created by 万达信息 on 2017/8/10.
//  Copyright © 2017年 wisdom_tool. All rights reserved.
//


#import "Drvice_tool.h"
#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <ifaddrs.h>
#include <arpa/inet.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import <AdSupport/AdSupport.h>//获取广告码用途

@interface Drvice_tool()

@end

@implementation Drvice_tool

#pragma mark -
#pragma mark 获得设备型号
+ (NSString *)getCurrentDeviceModel{
    int mib[2];
    size_t len;
    char *machine;
    
    mib[0] = CTL_HW;
    mib[1] = HW_MACHINE;
    sysctl(mib, 2, NULL, &len, NULL, 0);
    machine = malloc(len);
    sysctl(mib, 2, machine, &len, NULL, 0);
    
    NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
    free(machine);
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G (A1203)";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G (A1241/A1324)";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS (A1303/A1325)";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4 (A1349)";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S (A1387/A1431)";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5 (A1428)";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (A1429/A1442)";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c (A1456/A1532)";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c (A1507/A1516/A1526/A1529)";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s (A1453/A1533)";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s (A1457/A1518/A1528/A1530)";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus (A1522/A1524)";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6 (A1549/A1586)";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G (A1213)";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G (A1288)";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G (A1318)";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G (A1367)";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G (A1421/A1509)";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G (A1219/A1337)";
    
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2 (A1395)";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2 (A1396)";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2 (A1397)";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2 (A1395+New Chip)";
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G (A1432)";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G (A1454)";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G (A1455)";
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3 (A1416)";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3 (A1403)";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3 (A1430)";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4 (A1458)";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4 (A1459)";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4 (A1460)";
    
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air (A1474)";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air (A1475)";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air (A1476)";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G (A1489)";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G (A1490)";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G (A1491)";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    return platform;
}

#pragma mark -
#pragma mark 获取设备的信息 [设备所有者的名称,设备的类别,本地化版本,当前运行的系统,当前系统的版本,宽X长]
+(NSArray *)deviceInfo{
    UIDevice *device = [[UIDevice alloc] init];
    NSMutableArray * obj=[[NSMutableArray alloc]init];
    NSString *name = device.name;                   //获取设备所有者的名称
    NSString *model = device.name;                  //获取设备的类别
    NSString *type = device.localizedModel;         //获取本地化版本
    NSString *systemName = device.systemName;       //获取当前运行的系统
    NSString *systemVersion = device.systemVersion; //获取当前系统的版本
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    [obj addObject:name];
    [obj addObject:model];
    [obj addObject:type];
    [obj addObject:systemName];
    [obj addObject:systemVersion];
    [obj addObject:[NSString stringWithFormat:@"%f x %f",width,height]];
    return obj;
}

#pragma mark -
#pragma mark 获取设备的宽度
+(CGFloat)getDeviceWidth{
    return [UIScreen mainScreen].bounds.size.width;
}

#pragma mark -
#pragma mark 获取设备的长度
+(CGFloat)getDeviceHeight{
    return [UIScreen mainScreen].bounds.size.height;
}

#pragma mark - 返回最上层视图
+(UIView *)getKeyWindow{
    return [[UIApplication sharedApplication] keyWindow];
}

#pragma mark -
#pragma mark 获取运营商的信息
+(NSString *)getOperator{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    NSString * mCarrier = [NSString stringWithFormat:@"%@",[carrier carrierName]];
    return mCarrier;
}

#pragma mark -
#pragma mark 判断系统网络
+ (NSString *) getNetworkStatus{
    UIApplication *app=[UIApplication sharedApplication];
    NSArray *children=[[[app valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"]subviews];
    NSString *state=nil;
    int netType=0;
    for (id child in children) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            //获取到状态栏
            netType=[[child valueForKeyPath:@"dataNetworkType"]intValue];
            switch (netType) {
                case 0:
                    state=@"无网络";
                    break;
                case 1:
                    state=@"2G";
                    break;
                case 2:
                    state=@"3G";
                    break;
                case 3:
                    state=@"4G";
                    break;
                case 5:
                    state=@"WIFI";
                    break;
                default:
                    break;
            }
        }
    }
    return state;
}

#pragma mark -
#pragma mark 判断手机号码格式是否正确
+ (BOOL) isMobileNumber:(NSString *)mobileNum{
    
    if (mobileNum==nil || [mobileNum isEqualToString:@""]) {
        return NO;
    }
    
    NSArray *arr=[mobileNum componentsSeparatedByString:@"-"];
    if (arr!=nil&&[arr count]>0) {
        mobileNum=[arr componentsJoinedByString:@""];
    }
    
    /* 2016 号码段 2016年07月14日11:05:17 更新
     移动号段：
     134 135 136 137 138 139 147 150 151 152 157 158 159 178 182 183 184 187 188
     联通号段：
     130 131 132 145 155 156 171 175 176 185 186
     电信号段：
     133 149 153 173 177 180 181 189
     虚拟运营商:
     170
     */
    NSString * MOBILE = @"^1(3[0-9]|4[579]|5[0-35-9]|7[015678]|8[0-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134 135 136 137 138 139 147 150 151 152 157 158 159 178 182 183 184 187 188
     */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|4[7]|5[012789]|7[8]|8[23478])\\d)\\d{7}$";
    /**
     * 中国联通：China Unicom
     * 130 131 132 145 155 156 171 175 176 185 186
     */
    NSString * CU = @"^1(3[0-2]|4[5]|5[56]|7[156]|8[56])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133 149 153 173 177 180 181 189
     */
    NSString * CT = @"^1((33|49|53|7[37]|8[019])[0-9]|349)\\d{7}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark -
#pragma mark 获取设备唯一标识 NSUUID+keychain
+(NSString *)getIMEI{
    //读取KeyChain中是否有uuid
    NSString * bundle_identifier=[self getInfo_Plist:@"CFBundleIdentifier"];
    NSMutableDictionary *usernamepasswordKVPair = (NSMutableDictionary *)[NIKeyChain load:[NSString stringWithFormat:@"%@.allinfo",bundle_identifier]];
    id imei=[usernamepasswordKVPair objectForKey:[NSString stringWithFormat:@"%@.imeiKey",bundle_identifier]];
    if(imei==nil){
        NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
        [usernamepasswordKVPairs setObject:[self NSUUID] forKey:[NSString stringWithFormat:@"%@.imeiKey",bundle_identifier]];
        [NIKeyChain save:[NSString stringWithFormat:@"%@.allinfo",bundle_identifier] data:usernamepasswordKVPairs];
        usernamepasswordKVPair = (NSMutableDictionary *)[NIKeyChain load:[NSString stringWithFormat:@"%@.allinfo",bundle_identifier]];
        imei=[usernamepasswordKVPair objectForKey:[NSString stringWithFormat:@"%@.imeiKey",bundle_identifier]];
    }
    return [NSString stringWithFormat:@"%@",imei];
}

#pragma mark - 获取CFUUID 系统没有存储该值,需要手动存储
+(NSString*) CFUUID{
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    return result;
}

#pragma mark - 获取 NSUUID 在iOS 6中才出现，这跟CFUUID几乎完全一样，只不过它是Objective-C接口
+(NSString *)NSUUID{
    NSString * nsuuid = [[NSUUID UUID] UUIDString];
    return nsuuid;
}

#pragma mark - 获取 广告标示符（IDFA-identifierForIdentifier） 广告标示符是由系统存储着的
+(NSString *)ADID{
    NSString *adId =[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    return adId;
}

#pragma mark - Vindor标示符 (IDFV-identifierForVendor)  如果用户卸载了同一个vendor对应的所有程序，然后在重新安装同一个vendor提供的程序，此时identifierForVendor会被重置
+(NSString *)IDFV{
    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return idfv;
}

#pragma mark -
#pragma mark 拨打电话,调用短信什么的
+(void)openSoft:(NSString *)openStr{
    NSURL * openURL=[NSURL URLWithString:openStr];
    UIApplication *application = [UIApplication sharedApplication];
    
    if ([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
        [application openURL:openURL options:@{}
           completionHandler:^(BOOL success) {
               NSLog(@"Open %@: %d",openStr,success);
           }];
    } else {
        BOOL success = [application openURL:openURL];
        NSLog(@"Open %@: %d",openStr,success);
    }
}

#pragma mark -
#pragma mark 判断应用是否能够打开
+(BOOL)canOpenSoft:(NSString *)canOpenStr{
    NSURL * openURL=[NSURL URLWithString:canOpenStr];
    return [[UIApplication sharedApplication] canOpenURL:openURL];
}

#pragma mark -
#pragma mark 获取Info.plist的value,根据key的值
+(NSString *)getInfo_Plist:(NSString *)key{
    NSString * result = [[[NSBundle mainBundle] infoDictionary] objectForKey:key];
    return result;
}

#pragma mark - 获取当前连接的路由信息
+ (id)fetchSSIDInfo{
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    //NSLog(@"Supported interfaces: %@", ifs);
    id info = nil;
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        //NSLog(@"%@ => %@", ifnam, info);
        if (info && [info count]) { break; }
    }
    return info;
}

#pragma mark -
#pragma mark 获取设备的ip地址
+ (NSString *)deviceIPAdress {
    NSString *address = @"127.0.0.1";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    success = getifaddrs(&interfaces);
    if (success == 0) { // 0 表示获取成功
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    freeifaddrs(interfaces);
    //DDLogVerbose(@"手机的IP是：%@", address);
    return address;
}

static NSMutableDictionary * settingPlist=nil;
#pragma mark - 读取plist文件的信息
+(id)readSettingsPlist:(NSString *)key{
    if(settingPlist==nil){
        //读取plist文件：
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"plist"];
        settingPlist = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    }
    id object = [settingPlist objectForKey:key];
    return object;
}

#pragma mark - 读取plist文件的信息
+(id)readSettingsPlist:(NSString *)path key:(NSString *)key{
    id object = [Drvice_tool readSettingsPlist:path];
    if(object && [object isKindOfClass:[NSDictionary class]] && [object isKindOfClass:[NSMutableDictionary class]] && key!=nil){
        return [object objectForKey:key];
    }
    return object;
}

#pragma mark - 重新读取setting配置文件
+(void)reloadSettingsPlist{
    //读取plist文件：
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"plist"];
    settingPlist = [NSMutableDictionary dictionaryWithContentsOfFile:path];
}

#pragma mark - 播放系统声音,声音id:1000~2000之间,参考 http://iphonedevwiki.net/index.php/AudioServices
+(void)playSystemSound:(SystemSoundID)sysID{
    AudioServicesPlaySystemSound(sysID);
}

#pragma mark - 震动(在需要震动的地方调用)
+(void)drviceShock{
    AudioServicesPlaySystemSound ( kSystemSoundID_Vibrate) ;
}

#pragma mark -
#pragma mark 获取电池的相关信息 0-1
+(double)batterMonitor{
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    double deviceLevel = [UIDevice currentDevice].batteryLevel;
    return deviceLevel;
}

#pragma mark - 版本比较 1.2.1  -  1.2.3.1比较这样的版本
+(int)versionComparison:(NSString *)version1 version2:(NSString *)version2{
    int returnInt=0;
    //要从左到右截取比较
    if(version1==nil && version2==nil){
        returnInt=0;
    }else{//不可能同时为空
        if([version1 isEqualToString:version2]){//相等的时候
            returnInt=0;
        }else{
            if(version1==nil){//version1<version2
                returnInt=-1;
            }else if(version2==nil){//version1>version2
                returnInt=1;
            }else{
                //这边就是都不为空,且不相等的   开始截取字符串
                NSArray * list1 = [version1 componentsSeparatedByString:@"."];
                NSArray * list2 = [version2 componentsSeparatedByString:@"."];
                for(int i=0;i<[list1 count] && i<[list2 count];i++){
                    int v1=[[list1 objectAtIndex:i] intValue];
                    int v2=[[list2 objectAtIndex:i] intValue];
                    if(v1>v2){
                        returnInt=1;
                        break;
                    }else if(v1<v2){
                        returnInt=-1;
                        break;
                    }else{
                        returnInt=2;
                    }
                }
                if(returnInt==2){//已经从循环比较出来,还是没有比较出来,那就说明,前面相同的版本是一样的.那就看谁剩下的比较多了
                    if([list1 count]>[list2 count]){
                        returnInt=1;
                    }else if([list1 count]<[list2 count]){
                        returnInt=-1;
                    }else{
                        returnInt=0;
                    }
                }
            }
        }
    }
    return returnInt;
}

#pragma mark - 获取app的路径,可用于保存下载的数据.末尾没有/
+(NSString *)getAppPath{
    return [NSString stringWithFormat:@"%@",NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask,YES)[0]];
}

@end
