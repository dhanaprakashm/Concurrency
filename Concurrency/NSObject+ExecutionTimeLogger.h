//
//  NSObject+ExecutionTimeLogger.h
//  PropertySales
//
//  Created by Muddineti, Dhana (NonEmp) on 2/15/14.
//  Copyright (c) 2014 Shradha iSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ExecutionTimeLogger)

- (void)logExecutionTime:(NSDate *)startTime;

@end
