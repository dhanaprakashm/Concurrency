//
//  CTExecutorUsingThreads.m
//  Concurrency
//
//  Created by Muddineti, Dhana (NonEmp) on 3/30/14.
//  Copyright (c) 2014 Dhana. All rights reserved.
//

#import "CTExecutorUsingThreads.h"
#import "CTCodeToBeExecuted.h"

@implementation CTExecutorUsingThreads

- (void)main
{
    NSLog(@"Executing the code with Threads");
    
    CTCodeToBeExecuted *task = [[CTCodeToBeExecuted alloc] init];
    [task execute];
    
}

@end
