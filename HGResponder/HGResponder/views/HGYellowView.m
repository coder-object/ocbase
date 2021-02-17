//
//  HGYellowView.m
//  HGResponder
//
//  Created  by hong.zhu on 2021/1/3
//  Copyright © 2021 HG. All rights reserved.
//  

#import "HGYellowView.h"

@implementation HGYellowView


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __func__);
    self.hidden = YES;


    NSMutableString* stringM = [NSMutableString string];

    UIResponder * r = self;
    [stringM appendFormat:@"%@", NSStringFromClass(r.class)];
    while (r) {
        r = r.nextResponder;
        [stringM appendFormat:@" --> %@", NSStringFromClass(r.class)];
    }

    NSLog(@"%@", stringM);
}

@end
