//
//  UIResponder+Event.m
//  HGRunloop
//
//  Created  by hong.zhu on 2021/1/4
//  Copyright © 2021 HG. All rights reserved.
//  

#import "UIResponder+Event.h"


@implementation UIResponder (Event)

/**
 响应链
 
 @param eventName 事件名称
 @param eventInfo 事件信息
 */
- (void)routerEventWithName:(NSString *)eventName eventInfo:(NSDictionary *_Nullable)eventInfo {
    [[self nextResponder] routerEventWithName:eventName eventInfo:eventInfo];
}

@end
