//
//  main.m
//  HGAutorelease
//
//  Created by HG on 2021/2/17.
//

#import <Foundation/Foundation.h>
#import "HGObject.h"

extern void _objc_autoreleasePoolPrint(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        // NSLog(@"Hello, World!");
        HGObject *obj = [[[HGObject alloc] init] autorelease];
        obj.name = @"name_00";
        
        
        @autoreleasepool {
            {
                HGObject *obj10 = [[[HGObject alloc] init] autorelease];
                obj10.name = @"name_10";
                
                HGObject *obj11 = [[[HGObject alloc] init] autorelease];
                obj11.name = @"name_11";
                
                _objc_autoreleasePoolPrint();
            }
            NSLog(@"中间的 @autoreleasepool 就要结束了");
        }
    }
    
    return 0;
}
