//
//  CALayerViewController.m
//  UseCoreAnimation
//
//  Created by biyabi on 16/5/31.
//  Copyright © 2016年 caijunrong. All rights reserved.
//

#import "CALayerViewController.h"

@interface CALayerViewController ()

@end

@implementation CALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //爆炸粒子
    [self UIBezierPathTest];
    //圆角效果
    [self CAEmitterLayerTest];
    
    
    
    
}

#pragma mark -- CAEmitterLayer

//爆炸粒子效果
- (void)CAEmitterLayerTest{
    
    CGRect viewRect = self.btn.frame;
    
    //实现一个爆炸效果
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    [emitter setFrame:viewRect];
    [self.view.layer addSublayer:emitter];
    
//    [emitter setEmitterShape:kCAEmitterLayerCircle];
    [emitter setRenderMode:kCAEmitterLayerAdditive];
    [emitter setEmitterMode:kCAEmitterLayerOutline];
    
    [emitter setEmitterPosition:CGPointMake(viewRect.size.width/2, viewRect.size.height/2)];
    [emitter setEmitterSize:viewRect.size];
    
    
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"EffectImage"].CGImage;
    cell.birthRate = 150;
    cell.lifetime = 5.0;
    cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
    cell.alphaSpeed = -0.4;
    cell.velocity = 50;
    cell.velocityRange = 50;
    cell.emissionRange = M_PI * 2.0;
    
    //add particle template to emitter
    emitter.emitterCells = @[cell];
    
}

- (IBAction)clickBtn:(id)sender {
    
    
}

#pragma mark -- CAShapeLayer
//圆角shape，套在layer的mask上面，可以做出圆角效果
- (void)UIBezierPathTest{
    
    [self setMaskTo:self.iv byRoundingCorners:UIRectCornerAllCorners];
    
    [self.iv setImage:[UIImage imageNamed:@"scorpio"]];
}



//设置一个圆形的图片，渲染次数为1，比直接设置view的corenerradios消耗的资源小（2次）因为一个离屏渲染的问题
- (void)setMaskTo:(UIView*)view byRoundingCorners:(UIRectCorner)corners
{
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:view.bounds
                                                  byRoundingCorners:corners
                                                        cornerRadii:CGSizeMake(200.0, 200.0)];
    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    view.layer.mask = shape;
}

/*
    
    A: －－ 知识点 ＊ CAShapeLayer ＊ －－
    使用CAShapeLayer有以下一些优点：
    1、渲染快速。CAShapeLayer使用了硬件加速，绘制同一图形会比用Core Graphics快很多。
    2、高效使用内存。一个CAShapeLayer不需要像普通CALayer一样创建一个寄宿图形，所以无论有多大，都不会占用太多的内存。
    3、不会被图层边界剪裁掉。一个CAShapeLayer可以在边界之外绘制。你的图层路径不会像在使用Core Graphics的普通CALayer一样被剪裁掉（如我们在第二章所见）。
    4、不会出现像素化。当你给CAShapeLayer做3D变换时，它不像一个有寄宿图的普通图层一样变得像素化。
 
    B: －－ 注意点 －－
    1、我们需要在设置画笔颜色之前先设置填充颜色，否则画笔颜色就被填充颜色替代了。也就是说，如果要让填充颜色与画笔颜色不一样，那么我们的顺序必须是先设置填充颜色再设置画笔颜色。
    2、UIBezierPath 非常细腻的讲解
    http://www.jianshu.com/p/734b34e82135
 
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
