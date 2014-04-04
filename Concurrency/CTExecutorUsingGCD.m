//
//  CTExecutorUsingGCD.m
//  Concurrency
//
//  Created by Muddineti, Dhana (NonEmp) on 3/30/14.
//  Copyright (c) 2014 Dhana. All rights reserved.
//

#import "CTExecutorUsingGCD.h"
#import "CTCodeToBeExecuted.h"

@implementation CTExecutorUsingGCD

- (void)execute:(GCDExecutionType)type
{
    switch (type) {
        case TypeMainQueueSync:
            [self executeMainQueueSync];
            break;
            
        case TypeMainQueueAsync:
            [self executeMainQueueAsync];
            break;

        case TypeGlobalQueueSync:
            [self executeGlobalQueueSync];
            break;

        case TypeGlobalQueueAsync:
            [self executeGlobalQueueAsync];
            break;
            
        default:
            break;
    }
}

- (void)executeMainQueueAsync
{
    dispatch_async(dispatch_get_main_queue(), ^{
        CTCodeToBeExecuted *code = [[CTCodeToBeExecuted alloc] init];
        [code execute];
    });
}


//TODO: Not Working
- (void)executeMainQueueSync
{
    dispatch_sync(dispatch_get_main_queue(), ^{
//        CTCodeToBeExecuted *code = [[CTCodeToBeExecuted alloc] init];
//        [code execute];
        NSLog(@"executeMainQueueSync");
    });
    
    
    NSLog(@"Execute Sync GCD is completed");
}


- (void)executeGlobalQueueAsync
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        CTCodeToBeExecuted *code = [[CTCodeToBeExecuted alloc] init];
        [code execute];
    });
}

- (void)executeGlobalQueueSync
{
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        CTCodeToBeExecuted *code = [[CTCodeToBeExecuted alloc] init];
        [code execute];
    });
}

    
@end
