//
//  CGAffineTransformViewController.m
//  UseCoreAnimation
//
//  Created by biyabi on 16/5/30.
//  Copyright © 2016年 caijunrong. All rights reserved.
//

#import "CGAffineTransformViewController.h"

@interface CGAffineTransformViewController ()

@end

@implementation CGAffineTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    
    //要求：先缩小50%，再旋转30度，最后向右移动200个像素
    
    //create a new transform 只缩小 再旋转
    CGAffineTransform transformR = CGAffineTransformIdentity;
    //scale by 50%
    transformR = CGAffineTransformScale(transformR, 0.5, 0.5);
//    //rotate by 30 degrees
    transformR = CGAffineTransformRotate(transformR, M_PI / 180.0 * 30.0);
//    //translate by 200 points
//    transformR = CGAffineTransformTranslate(transformR, screenWidth/3, 0);
    //apply transform to layer
    self.rotateView.layer.affineTransform = transformR;
    
    
    //create a new transform 对比上面的，可以看到，旋转之后的平移相对的是view本身的坐标轴，而不是父view的坐标轴
    CGAffineTransform transform = CGAffineTransformIdentity;
    //scale by 50%
    transform = CGAffineTransformScale(transform, 0.5, 0.5);
    //rotate by 30 degrees
    transform = CGAffineTransformRotate(transform, M_PI / 180.0 * 30.0);
    //translate by 200 points
    transform = CGAffineTransformTranslate(transform, screenWidth/3, 0);
    //apply transform to layer
    self.transformView.layer.affineTransform = transform;
    
    //结论：先旋转再平移 跟 先平移再旋转是不一样的
    
    
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
