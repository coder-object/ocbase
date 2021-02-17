//
//  UIResponder+Event.h
//  HGRunloop
//
//  Created  by hong.zhu on 2021/1/4
//  Copyright © 2021 HG. All rights reserved.
//  


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (Event)

/**
 响应链

 @param eventName 事件名称
 @param eventInfo 事件信息
 */
- (void)routerEventWithName:(NSString *)eventName
                  eventInfo:(NSDictionary *_Nullable)eventInfo;


@end

NS_ASSUME_NONNULL_END
