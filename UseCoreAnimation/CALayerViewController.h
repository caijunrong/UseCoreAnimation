//
//  CALayerViewController.h
//  UseCoreAnimation
//
//  Created by biyabi on 16/5/31.
//  Copyright © 2016年 caijunrong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CALayerViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *iv;
@property (weak, nonatomic) IBOutlet UIButton *btn;
- (IBAction)clickBtn:(id)sender;

@end
