//
//  CTCodeToBeExecuted.m
//  Concurrency
//
//  Created by Muddineti, Dhana (NonEmp) on 3/30/14.
//  Copyright (c) 2014 Dhana. All rights reserved.
//

#import "CTCodeToBeExecuted.h"

@implementation CTCodeToBeExecuted

- (void)execute
{
    int max = 0;
    NSMutableArray *data = [NSMutableArray array];
    
    for(int i=0; i<100000; i++) {
        [data addObject:@(rand())];
    }
    
    for(int i=0; i<100000; i++) {
        max = MAX(max, [data[i] intValue]);
    }
    
    NSLog(@"Max Number: %d", max);
}

@end
