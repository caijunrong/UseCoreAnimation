//
//  SquareViewController.h
//  UseCoreAnimation
//
//  Created by biyabi on 16/5/30.
//  Copyright © 2016年 caijunrong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SquareViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIView *containerView;

@property (nonatomic, strong) IBOutletCollection(UIView) NSArray *faces;

@end
