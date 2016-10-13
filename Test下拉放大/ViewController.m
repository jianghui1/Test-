//
//  ViewController.m
//  Test下拉放大
//
//  Created by ys on 16/3/19.
//  Copyright © 2016年 jzh. All rights reserved.
//

#import "ViewController.h"

#define kHeight 100

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    self.tableView.contentInset = UIEdgeInsetsMake(kHeight, 0, 0, 0);
    
    self.tableView.tableHeaderView = [[UIView alloc] init];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -kHeight, self.view.frame.size.width, kHeight)];
    imageView.image = [UIImage imageNamed:@"3.jpg"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.tag = 110;
    [self.tableView addSubview:imageView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat y = scrollView.contentOffset.y;
    if (y < -kHeight) {
        CGRect frame = [self.view viewWithTag:110].frame;
        frame.origin.y = y;
        frame.size.height = -y;
        [self.view viewWithTag:110].frame = frame;
    }
}

@end
