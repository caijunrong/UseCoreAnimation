//
//  CATransform3DM34ViewController.m
//  UseCoreAnimation
//
//  Created by biyabi on 16/5/30.
//  Copyright © 2016年 caijunrong. All rights reserved.
//

#import "CATransform3DM34ViewController.h"

@interface CATransform3DM34ViewController ()

@end

@implementation CATransform3DM34ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self easy3DTransform];
    
}

//使用画出来的阴影，形状任意改变
- (void)CGPathTest{
    self.iv.layer.shadowOpacity = 0.5f;
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL, self.iv.bounds);
    self.iv.layer.shadowPath = squarePath; CGPathRelease(squarePath);
}

//使用阴影，形状固定
- (void)shadowTest{
    self.iv.layer.shadowOpacity = 0.5f;
    self.iv.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    self.iv.layer.shadowRadius = 5.0f;
}

//简单的3d变换
- (void)easy3DTransform{

    CATransform3D transform = CATransform3DIdentity;
    //调整灭点，一般分母去500到1000之间
    transform.m34 = -1/500.0;
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0) ;
    self.iv.layer.transform = transform;

    
    //Core Animation定义了这个点位于变换图层的anchorPoint（通常位于图层中心，但也有例外）。这就是说，当图层发生变换时，这个点永远位于图层变换之前anchorPoint的位置。
    //当改变一个图层的position，你也改变了它的灭点，做3D变换的时候要时刻记住这一点，当你视图通过调整m34来让它更加有3D效果，应该首先把它放置于屏幕中央，然后通过平移来把它移动到指定位置（而不是直接改变它的position），这样所有的3D图层都共享一个灭点。
    
    //加上阴影-1
//    [self shadowTest];
    
    //加上阴影-2
    [self CGPathTest];
    
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
