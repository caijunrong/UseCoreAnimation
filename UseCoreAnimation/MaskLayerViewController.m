//
//  MaskLayerViewController.m
//  UseCoreAnimation
//
//  Created by biyabi on 16/5/30.
//  Copyright © 2016年 caijunrong. All rights reserved.
//

#import "MaskLayerViewController.h"

@interface MaskLayerViewController ()

@end

@implementation MaskLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //超过layer的全部做掉，只保留在layer里面的，适合2个layer的合成，一个做容器，一个做内容
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = self.imageView.bounds;
    UIImage *maskImage = [UIImage imageNamed:@"scorpio"];
    maskLayer.contents = (__bridge id)maskImage.CGImage;
    
    //apply mask to image layer￼
    self.imageView.layer.mask = maskLayer;
    
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
