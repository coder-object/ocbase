//
//  HGPermenantThread.m
//  HGRunloop
//
//  Created  by hong.zhu on 2021/1/4
//  Copyright © 2021 HG. All rights reserved.
//  


#import "HGPermenantThread.h"

/** HGThread 仅仅为了测试生命周期 **/
@interface HGThread : NSThread
@end
@implementation HGThread
- (void)dealloc {
    NSLog(@"奔跑吧对象 - HGThread");
}
@end

@interface HGPermenantThread ()

@property (strong, nonatomic) HGThread *innerThread;
@property (assign, nonatomic, getter=isStopped) BOOL stopped;

@end

@implementation HGPermenantThread

// init
- (instancetype)init {
    if (self = [super init]) {
        self.stopped = NO;
        __weak typeof(self) weakSelf = self;
        self.innerThread = [[HGThread alloc] initWithBlock:^{
            [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
            while (weakSelf && !weakSelf.isStopped) {
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
        }];
        self.innerThread.name = @"nameEquelsInnerThread";
        [self.innerThread start];
    }
    return self;
}

#pragma mark -
#pragma mark - public methods
- (void)executeTask:(HGPermenantThreadTask)task {
    if (!self.innerThread || !task) return;
    
    [self performSelector:@selector(__executeTask:) onThread:self.innerThread withObject:task waitUntilDone:NO];
}

- (void)stop {
    if (!self.innerThread) return;
    
    [self performSelector:@selector(__stop) onThread:self.innerThread withObject:nil waitUntilDone:YES];
}

#pragma mark -
#pragma mark - private methods
- (void)__stop {
    self.stopped = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.innerThread = nil;
}

- (void)__executeTask:(HGPermenantThreadTask)task {
    if (task) {
        task();
    }
}

- (void)dealloc {
    NSLog(@"奔跑吧对象 - HGPermenantThread");
    
    [self stop];
}

@end
