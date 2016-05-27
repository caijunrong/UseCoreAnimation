//
//  TestViewController.m
//  UseCoreAnimation
//
//  Created by biyabi on 16/5/26.
//  Copyright © 2016年 caijunrong. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()



@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
    UIImage *airPlane = [UIImage imageNamed:@"app_icon"];
    
    self.subVIew.layer.contents = (__bridge id)airPlane.CGImage;
    
    /*
     kCAGravityCenter
     kCAGravityTop
     kCAGravityBottom
     kCAGravityLeft
     kCAGravityRight
     kCAGravityTopLeft
     kCAGravityTopRight
     kCAGravityBottomLeft
     kCAGravityBottomRight
     kCAGravityResize
     kCAGravityResizeAspect -> 等同于 UIViewContentModeScaleAspectFit
     kCAGravityResizeAspectFill
     */
    
    //设置图层的显示mode，拉伸变形
    self.subVIew.layer.contentsGravity = kCAGravityResizeAspect;//设置图片的显示mode，拉伸？居中？原比例？
    
    //不显示的话，系统默认读取的图片由于Retain屏幕，导致过大，一定要记住要手动的设置图层的contentsScale属性。
    self.subVIew.layer.contentsScale = airPlane.scale;
    
    //超出部分裁剪
//    self.subVIew.layer.masksToBounds = YES;
    
    //截图某部分的图片进行显示，要是坐2d游戏的话，因为图片太多了，一张一张读太消耗内存，所以，使用的是读一张大的，然后切割出来，分成一个一个小的
    self.subVIew.layer.contentsRect = CGRectMake(0, 0, 1, 1);
    
    //如果想要让layer自动调用方法，使用［layer display］调用即可，记住必须成为delegate
//    self.subVIew.layer.delegate = self;
//    [self.subVIew.layer display];
}

//［layer display］默认回调
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{

    CGContextSetLineWidth(ctx, 1.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, self.subVIew.layer.bounds);

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
