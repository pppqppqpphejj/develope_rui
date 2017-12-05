//
//  NSDictionary+MutableDeepCopy.h
//  GroupDeal
//
//  Created by Jabez on 23/12/14.
//  Copyright (c) 2014 GroupDeal. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSDictionary (MutableDeepCopy)

- (NSMutableDictionary *)mutableDeepCopy;
@end