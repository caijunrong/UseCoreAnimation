//
//  MainTableViewController.m
//  UseCoreAnimation
//
//  Created by biyabi on 16/5/26.
//  Copyright © 2016年 caijunrong. All rights reserved.
//

#import "MainTableViewController.h"
#import "TestViewController.h"
#import "MainTableViewCell.h"

@interface MainTableViewController ()

@property (nonatomic, strong) NSArray *infoArray;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.infoArray = @[@[@"TestViewController",[TestViewController class]]
                       
                       ];
    
    UIView *emptyView = [[UIView alloc]init];
    self.tableView.tableFooterView = emptyView;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
}


#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.infoArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSString *showName = [[self.infoArray objectAtIndex:indexPath.row] firstObject];
    [cell.nameLabel setText:showName];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController *vController = [[[self.infoArray objectAtIndex:indexPath.row] lastObject] new];
    
    [self.navigationController pushViewController:vController animated:YES];
    
    NSLog(@"%ul",indexPath.row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
