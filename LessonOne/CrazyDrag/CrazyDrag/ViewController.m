//
//  ViewController.m
//  CrazyDrag
//
//  Created by Vaith on 15/10/1.
//  Copyright © 2015年 Shenme Studio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showAlert:(id)sender {
    UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"您好，苍老师" message:@"听说您的新帖转发了499次" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction=[UIAlertAction actionWithTitle:@"我来帮忙转一次" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            }];
    [alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
