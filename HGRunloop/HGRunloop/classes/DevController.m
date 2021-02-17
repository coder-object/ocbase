//
//  DevController.m
//  HGRunloop
//
//  Created  by hong.zhu on 2021/1/4
//  Copyright © 2021 HG. All rights reserved.
//  


#import "DevController.h"
#import "HGPermenantThread.h"

@interface DevController ()

@property (strong, nonatomic) HGPermenantThread *thread;

@end

@implementation DevController

// 任务执行
- (IBAction)execute {
    [self.thread executeTask:^{
        NSLog(@"执行任务 - %@", [NSThread currentThread]);
    }];
}

// 停止线程保活功能
- (IBAction)stop {
    
    [self.thread stop];
}

#pragma mark -
#pragma mark - lazy
- (HGPermenantThread *)thread {
    if (!_thread) {
        _thread = [HGPermenantThread new];
    }
    return _thread;
}


- (void)dealloc {
    NSLog(@"奔跑吧对象 - DevController");
}

@end
