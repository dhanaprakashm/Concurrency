//
//  CTTestViewController.m
//  Concurrency
//
//  Created by Muddineti, Dhana (NonEmp) on 3/6/14.
//  Copyright (c) 2014 Dhana. All rights reserved.
//

#import "CTTestViewController.h"
#import "CTExecutorUsingThreads.h"
#import "CTCodeToBeExecuted.h"
#import "CTExecutorUsingGCD.h"
#import "CTExecutorUsingOperation.h"

@interface CTTestViewController ()

@property (weak, nonatomic) IBOutlet UILabel *executionWithoutConcurrencyStatus;
@property (weak, nonatomic) IBOutlet UILabel *executionTimeForWithoutConcurrency;

@end

@implementation CTTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (IBAction)executeWithoutConcurrency:(id)sender {
    NSDate *startTime = [NSDate date];

    self.executionWithoutConcurrencyStatus.text = @"In Progress";
    [self noConcurrency];

    [self updateStatus:startTime];
}

- (IBAction)executeWithThread:(id)sender {
    NSDate *startTime = [NSDate date];
    
    self.executionWithoutConcurrencyStatus.text = @"In Progress";
    [self executeWithThreads];

    [self updateStatus:startTime];
}

- (IBAction)executeWithGCDMainQueueAsync:(id)sender {
    NSDate *startTime = [NSDate date];
    
    self.executionWithoutConcurrencyStatus.text = @"In Progress";
    [self executeWithGCD:TypeMainQueueAsync];

    [self updateStatus:startTime];
}

- (IBAction)executeWithGCDMainQueueSync:(id)sender {
    NSDate *startTime = [NSDate date];
    
    self.executionWithoutConcurrencyStatus.text = @"In Progress";
    [self executeWithGCD:TypeMainQueueSync];

    [self updateStatus:startTime];
}

- (IBAction)executeWithGCDGlobalQueueAsync:(id)sender {
    NSDate *startTime = [NSDate date];
    
    self.executionWithoutConcurrencyStatus.text = @"In Progress";
    [self executeWithGCD:TypeGlobalQueueAsync];

    [self updateStatus:startTime];
}

- (IBAction)executeWithGCDGlobalQueueSync:(id)sender {
    NSDate *startTime = [NSDate date];
    
    self.executionWithoutConcurrencyStatus.text = @"In Progress";
    [self executeWithGCD:TypeGlobalQueueSync];

    [self updateStatus:startTime];
}

- (IBAction)executeWithOperationOnMainQueue:(id)sender {
    NSDate *startTime = [NSDate date];
    
    self.executionWithoutConcurrencyStatus.text = @"In Progress";
    [self executeWithOperation:QueueTypeMain];

    [self updateStatus:startTime];
}

- (IBAction)executeWithOperationOnBackgroundQueue:(id)sender {
    NSDate *startTime = [NSDate date];
    
    self.executionWithoutConcurrencyStatus.text = @"In Progress";
    [self executeWithOperation:QueueTypeBackground];

    [self updateStatus:startTime];
}

- (IBAction)executeOnMainRunLoop:(id)sender
{
    NSDate *startTime = [NSDate date];
    
    self.executionWithoutConcurrencyStatus.text = @"In Progress";
    [self performSelector:@selector(noConcurrency) withObject:nil afterDelay:1];
    
    [self updateStatus:startTime];
}

- (void)updateStatus:(NSDate *)startTime
{
    self.executionWithoutConcurrencyStatus.text = @"Completed";
    
    NSTimeInterval executionTime = [[NSDate date] timeIntervalSinceDate:startTime];
    
    self.executionTimeForWithoutConcurrency.text = [NSString stringWithFormat:@"Execution Time: %.2f milliseconds", executionTime * 1000];
    
    [self logExecutionTime:startTime];
}

- (void)noConcurrency
{
    CTCodeToBeExecuted *code = [[CTCodeToBeExecuted alloc] init];
    [code execute];
}

- (void)executeWithThreads
{
    CTExecutorUsingThreads *thread = [[CTExecutorUsingThreads alloc] init];
    [thread start];
}

- (void)executeWithGCD:(GCDExecutionType)type
{
    CTExecutorUsingGCD *gcd = [[CTExecutorUsingGCD alloc] init];
    [gcd execute:type];
}

- (void)executeWithOperation:(QueueType)type
{
    CTExecutorUsingOperation *op = [[CTExecutorUsingOperation alloc] init];
    [op execteOperation:type];
}

@end
