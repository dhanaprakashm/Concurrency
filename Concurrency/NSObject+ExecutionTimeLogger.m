//
//  NSObject+ExecutionTimeLogger.m
//  PropertySales
//
//  Created by Muddineti, Dhana (NonEmp) on 2/15/14.
//  Copyright (c) 2014 Shradha iSolutions. All rights reserved.
//

#import "NSObject+ExecutionTimeLogger.h"

@implementation NSObject (ExecutionTimeLogger)

- (void)logExecutionTime:(NSDate *)startTime
{
    NSDate *endTime = [NSDate date];
    NSTimeInterval executionTime = [endTime timeIntervalSinceDate:startTime];
    NSLog(@"executionTime in seconds = %f", executionTime);
}

@end
