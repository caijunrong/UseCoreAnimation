//
//  SquareViewController.m
//  UseCoreAnimation
//
//  Created by biyabi on 16/5/30.
//  Copyright © 2016年 caijunrong. All rights reserved.
//

#import "SquareViewController.h"
#import  <GLKit/GLKMatrix4.h>
#import  <GLKit/GLKMatrix3.h>
#import  <GLKit/GLKVector3.h>

#define LIGHT_DIRECTION 0, 1, -0.5
#define AMBIENT_LIGHT 0.5

@interface SquareViewController ()

@end

@implementation SquareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat viewWidth = 50;
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
    
    //将摄像机的镜头做一个旋转及移动
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    
    self.containerView.layer.sublayerTransform = perspective;
    
    
    //z + 100
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, viewWidth);
    [self addFace:0 withTransform:transform];
    
    //x + 100
    transform = CATransform3DMakeTranslation(viewWidth, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:transform];
    
    //y - 100
    transform = CATransform3DMakeTranslation(0, -viewWidth, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransform:transform];
    
    //y + 100
    transform = CATransform3DMakeTranslation(0, viewWidth, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:transform];
    
    //x - 100
    transform = CATransform3DMakeTranslation(-viewWidth, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [self addFace:4 withTransform:transform];
    
    //z - 100
    transform = CATransform3DMakeTranslation(0, 0, -viewWidth);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addFace:5 withTransform:transform];
    
    
}

//加上光影--不是很理解
- (void)applyLightingToFace:(CALayer *)face{
    //add lighting layer
    CALayer *layer = [CALayer layer];
    layer.frame = face.bounds;
    [face addSublayer:layer];
    //convert the face transform to matrix
    //(GLKMatrix4 has the same structure as CATransform3D)
    //译者注：GLKMatrix4和CATransform3D内存结构一致，但坐标类型有长度区别，所以理论上应该做一次float到CGFloat的转换，感谢[@zihuyishi](https://github.com/zihuyishi)同学~
    CATransform3D transform = face.transform;
    GLKMatrix4 matrix4 = *(GLKMatrix4 *)&transform;
    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
    //get face normal
    GLKVector3 normal = GLKVector3Make(0, 0, 1);
    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
    normal = GLKVector3Normalize(normal);
    //get dot product with light direction
    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
    float dotProduct = GLKVector3DotProduct(light, normal);
    //set lighting layer opacity
    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
    UIColor *color = [UIColor colorWithWhite:0 alpha:shadow];
    layer.backgroundColor = color.CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform
{
    //get the face view and add it to the container
    UIView *face = self.faces[index];
    
    if (face == nil) {
        NSLog(@"nil");
    }
    
    [self.containerView addSubview:face];
    
    NSLog(@"%u",self.containerView.subviews.count);
    //center the face view within the container
    CGSize containerSize = self.containerView.frame.size;
    
    NSLog(@"%lf, %lf",containerSize.width,containerSize.height);
    
    face.center = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
    // apply the transform
    face.layer.transform = transform;
    
    [self applyLightingToFace:face.layer];
}



@end
