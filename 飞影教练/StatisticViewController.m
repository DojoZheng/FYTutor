//
//  StatisticViewController.m
//  飞影教练
//
//  Created by Dojo on 16/4/20.
//  Copyright © 2016年 Dojo. All rights reserved.
//

#import "StatisticViewController.h"
#import "StatisticView.h"


@interface StatisticViewController ()

@end

@implementation StatisticViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"培训情况";
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    UILabel* title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    title.text = @"培训情况";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = title;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self addStatisticView];
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
//    backItem.tintColor = [UIColor whiteColor];
//    backItem.title =@"返回";
//    self.navigationItem.backBarButtonItem = backItem;
    
    // Do any additional setup after loading the view.
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

- (void)back:(id)sender {
    self.navigationController.navigationBarHidden = YES;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addStatisticView {
    StatisticView* sView = [StatisticView instanceStatisticView];
    sView.frame = CGRectMake(5, self.navigationController.navigationBar.bounds.size.height + 5, sView.frame.size.width, sView.frame.size.height);
    sView.className.text = @"少年基础提高班";
    [self.view addSubview:sView];
}

@end
