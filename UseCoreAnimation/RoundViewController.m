//
//  RoundViewController.m
//  UseCoreAnimation
//
//  Created by biyabi on 16/5/27.
//  Copyright © 2016年 caijunrong. All rights reserved.
//

#import "RoundViewController.h"

@interface RoundViewController ()

@property (nonatomic, assign) NSInteger costTime;

@property (nonatomic, weak) NSTimer *timer;

@end

@implementation RoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    
    //先移动 anchorPoint 点，让他们全部到顶部去，然后按照原来的中心点进行旋转
    self.topImageView.layer.anchorPoint = CGPointMake(0.5, 2.2);
    self.leftImageView.layer.anchorPoint = CGPointMake(0.5, 2.2);
    self.rightImageView.layer.anchorPoint = CGPointMake(0.5, 2.2);
    self.bottomImageView.layer.anchorPoint = CGPointMake(0.5, 2.2);
    
    //预先让view先摆好位置，因为定时器会1s后才调用该方法
    [self tick];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    
}

- (void)tick{

    self.costTime ++;
    
    //一秒改变一个角度
    CGFloat secsAngle = ((self.costTime % 60)/60.0) * M_PI * 2.0;
    
    NSLog(@"secsAngle:%lf",secsAngle);

    //改变旋转角度
    self.topImageView.transform = CGAffineTransformMakeRotation(secsAngle);
    
    self.leftImageView.transform = CGAffineTransformMakeRotation(secsAngle + M_PI_2);
    
    self.bottomImageView.transform = CGAffineTransformMakeRotation(secsAngle + M_PI);
    
    self.rightImageView.transform = CGAffineTransformMakeRotation(secsAngle + M_PI + M_PI_2);
    
}

//将背景图设置为圆角图片
-(void)configUI{
    [self.roundbackView.layer setCornerRadius:100.0f];
    self.roundbackView.layer.masksToBounds = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
