//
//  ViewController.m
//  CrazyDrag
//
//  Created by Zerovoid on 15/10/1.
//  Copyright © 2015年 Shenme Studio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    //全局变量，当前滑动条的值
    int currentValue;
    //随机数，1-100以内的整数
    int targetValue;
    //总分
    int totalValue;
}

//outlet，SB对象关联的属性变量
@property (strong, nonatomic) IBOutlet UISlider *slider;
//位置标签
@property (strong, nonatomic) IBOutlet UILabel *postionLabel;
@property (strong, nonatomic) IBOutlet UILabel *currentScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalScoreLabel;

//关联滑动条的滑动事件
-(IBAction)sliderMoved:(id)sender;
-(IBAction)showAlert:(id)sender;
- (IBAction)randomPos:(id)sender;

@end

//----------上面是Interface，下面是Implementation-------------

@implementation ViewController

//synthesize会自动在ViewController中添加代码，以使用Property；
@synthesize slider;
@synthesize postionLabel;
@synthesize currentScoreLabel;
@synthesize totalScoreLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //初始化当前值
    //currentValue=50;
    currentValue=self.slider.value;
    NSLog(@"当前值=%d",currentValue);
    //获得一个1-100的随机数
    [self createEnemyPosition];
}

//随机生成敌人的位置
-(void)createEnemyPosition{
    targetValue=1+(arc4random()%100);
    self.postionLabel.text=[NSString stringWithFormat:(@"敌人的坐标是%d"), targetValue];
}

-(IBAction)randomPos:(UIButton*)sender{
    [self createEnemyPosition];
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
    int distance=fabsf(slider.value-targetValue);
    int score=100-distance;
    NSString *result=[NSString stringWithFormat:@"本轮的射击精确率为%d%%,分数为%d",score,score];
    //IOS8中UIAlertView和UIActionSheet被废弃，由UIAlertController替代；
    //UIAlertController继承子UIViewController;
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"射击成绩" message:result preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction=[UIAlertAction actionWithTitle:@"继续游戏" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"按下了继续游戏的按钮");
        [self createEnemyPosition];
        
            }];
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"按下了取消的按钮:");
    }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    //presentViewController应该是ViewController的一个方法，参数是一个UI；使用模态框推出；
    [self presentViewController:alert animated:YES completion:nil];
    currentScoreLabel.text=[NSString stringWithFormat:@"%d",score];
    totalValue=totalValue+score;
    totalScoreLabel.text=[NSString stringWithFormat:@"%d",totalValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
