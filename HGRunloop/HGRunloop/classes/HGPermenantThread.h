//
//  HGPermenantThread.h
//  HGRunloop
//
//  Created  by hong.zhu on 2021/1/4
//  Copyright © 2021 HG. All rights reserved.
//  

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** 任务执行回调 */
typedef void (^HGPermenantThreadTask)(void);

@interface HGPermenantThread : NSObject

/**
 在当前子线程执行一个任务
 */
- (void)executeTask:(HGPermenantThreadTask)task;

/**
 结束线程
 */
- (void)stop;

@end

NS_ASSUME_NONNULL_END
