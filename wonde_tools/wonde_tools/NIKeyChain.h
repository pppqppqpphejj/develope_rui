//
//  NIKeyChain.h
//  存放系统属性.基本固定的
//  keychain的使用
//  Security.framework
//  Created by 　罗若文 on 15/11/15.
//  Copyright © 2015年 罗若文. All rights reserved.
//

#import <Foundation/Foundation.h>

///keychain的使用
@interface NIKeyChain : NSObject

///获取keychain的service对应的键值对
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service ;

///将data保存到keychain中 放在key为service的空间
+ (void)save:(NSString *)service data:(id)data ;

///从keychain中取出service对应的的data
+ (id)load:(NSString *)service;

///删除keychain中service对应的data
+ (void)delete:(NSString *)service;

@end
