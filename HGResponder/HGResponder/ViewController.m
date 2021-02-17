//
//  ViewController.m
//  HGResponder
//
//  Created  by hong.zhu on 2021/1/3
//  Copyright © 2021 HG. All rights reserved.
//  

#import "ViewController.h"
#import "HGButton.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet HGButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(eventWithTapGestureRecognizer:)];
    [self.button addGestureRecognizer:tap];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)actionWitnButton:(HGButton *)sender {
    NSLog(@"%s", __func__);
}

- (void)eventWithTapGestureRecognizer:(UITapGestureRecognizer*)tapGestureRecognizer {
    NSLog(@"%s, %@", __func__, tapGestureRecognizer.view);
}


@end
