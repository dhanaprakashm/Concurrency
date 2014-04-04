//
//  CTExecutorUsingOperation.m
//  Concurrency
//
//  Created by Muddineti, Dhana (NonEmp) on 3/30/14.
//  Copyright (c) 2014 Dhana. All rights reserved.
//

#import "CTExecutorUsingOperation.h"
#import "CTCodeToBeExecuted.h"

@implementation CTExecutorUsingOperation

- (void)main
{
    CTCodeToBeExecuted *code = [[CTCodeToBeExecuted alloc] init];
    [code execute];
}

- (void)execteOperation:(QueueType)queueType
{
    switch (queueType) {
        case QueueTypeMain:
            [self executeOnMainQueue];
            break;

        case QueueTypeBackground:
            [self executeOnBackgroundQueue];
            break;
            
        default:
            break;
    }
}

- (void)executeOnMainQueue
{
    [[NSOperationQueue mainQueue] addOperation:self];
}

- (void)executeOnBackgroundQueue
{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:self];
}

@end
