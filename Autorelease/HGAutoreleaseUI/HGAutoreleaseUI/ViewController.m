//
//  ViewController.m
//  HGAutoreleaseUI
//
//  Created by HG on 2021/2/17.
//

#import "ViewController.h"
#import "HGObject.h"

@interface ViewController ()

@end

// 结构体
struct HGStruct {
    void *isa;
    int a;
    void (*func)(void);
};

@implementation ViewController

// 结构体测试
- (void)structTest {
    struct HGStruct *s = nil;
    s->func();
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self structTest];
    
    __autoreleasing HGObject *obj = [[HGObject alloc] init];
    obj.name = @"name";
    
    
    NSLog(@"viewDidLoad ==> end");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"viewWillAppear ==> end");
}

@end
