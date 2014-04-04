//
//  CTExecutorUsingGCD.h
//  Concurrency
//
//  Created by Muddineti, Dhana (NonEmp) on 3/30/14.
//  Copyright (c) 2014 Dhana. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, GCDExecutionType) {
    TypeMainQueueSync,
    TypeMainQueueAsync,
    TypeGlobalQueueAsync,
    TypeGlobalQueueSync,
};


@interface CTExecutorUsingGCD : NSObject

- (void)execute:(GCDExecutionType)type;

@end
