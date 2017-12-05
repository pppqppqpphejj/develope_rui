//
//  AppDelegate.m
//  wonde_tools
//
//  Created by 万达信息 on 2017/8/10.
//  Copyright © 2017年 wisdom_tool. All rights reserved.
//
#import "NIKeyChain.h"

@implementation NIKeyChain

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            
            (__bridge_transfer id)kSecClassGenericPassword,(__bridge_transfer id)kSecClass,
            
            service, (__bridge_transfer id)kSecAttrService,
            
            service, (__bridge_transfer id)kSecAttrAccount,
            
            (__bridge_transfer id)kSecAttrAccessibleAfterFirstUnlock,(__bridge_transfer id)kSecAttrAccessible,
            
            nil];
    
}



+ (void)save:(NSString *)service data:(id)data {
    
    //Get search dictionary
    
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    
    //Delete old item before add new item
    
    SecItemDelete((CFDictionaryRef)keychainQuery);
    
    //Add new object to search dictionary(Attention:the data format)
    
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    
    //Add item to keychain with the search dictionary
    
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
    
}



+ (id)load:(NSString *)service {
    
    id ret = nil;
    
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    
    //Configure the search setting
    
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    
    CFDataRef keyData = NULL;
    
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        
        @try {
            
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge  NSData *)keyData];
            
        } @catch (NSException *e) {
            
            NSLog(@"Unarchive of %@ failed: %@", service, e);
            
        } @finally {
            
        }
        
    }
    
    return ret;
    
}



+ (void)delete:(NSString *)service {
    
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    
    SecItemDelete((CFDictionaryRef)keychainQuery);
    
}

@end
