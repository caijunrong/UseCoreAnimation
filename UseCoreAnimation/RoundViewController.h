//
//  RoundViewController.h
//  UseCoreAnimation
//
//  Created by biyabi on 16/5/27.
//  Copyright © 2016年 caijunrong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoundViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *roundbackView;

@property (nonatomic, weak) IBOutlet UIImageView *topImageView;

@property (nonatomic, weak) IBOutlet UIImageView *leftImageView;

@property (nonatomic, weak) IBOutlet UIImageView *bottomImageView;

@property (nonatomic, weak) IBOutlet UIImageView *rightImageView;

@end
