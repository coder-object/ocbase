//
//  HGObject.m
//  HGAutorelease
//
//  Created by HG on 2021/2/17.
//

#import "HGObject.h"

@implementation HGObject

- (void)dealloc {
    // [super dealloc];
    
    NSLog(@"亲亲的我走了 ==> %@ %p", _name, self);
}

@end
