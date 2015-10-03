//
//  ViewController.m
//  CrazyDrag
//
//  Created by Vaith on 15/10/1.
//  Copyright © 2015年 Shenme Studio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    //全局变量，当前滑动条的值
    int currentValue;
    //随机数，1-100以内的整数
    int targetValue;
}
//关联滑动条的滑动事件
-(IBAction)sliderMoved:(id)sender;

//outlet，SB对象关联的属性变量
@property (strong, nonatomic) IBOutlet UISlider *slider;

-(IBAction)showAlert:(id)sender;

@end

//----------上面是Interface，下面是Implementation-------------

@implementation ViewController
//synthesize会自动在ViewController中添加代码，以使用Property；
@synthesize slider;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //初始化当前值
    //currentValue=50;
    currentValue=self.slider.value;
    NSLog(@"当前值=%d",currentValue);
    targetValue=1+(arc4random()%100);
}

- (IBAction)sliderMoved:(UISlider*)sender {
//    UISlider *slider=(UISlider*)sender;
    currentValue = (int)lroundf(sender.value);
    NSLog(@"滑动条的当前数值：%d",currentValue);
}

/*
 弹出对话框
 */
- (IBAction)showAlert:(id)sender {
    UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"灰色竞彩机器" message:@"究竟是大还是小呢？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction=[UIAlertAction actionWithTitle:@"我要下注" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            }];
    [alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
