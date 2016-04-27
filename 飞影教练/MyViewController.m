//
//  MyViewController.m
//  飞影教练
//
//  Created by Dojo on 16/4/20.
//  Copyright © 2016年 Dojo. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
@property (weak, nonatomic) IBOutlet UIButton *Portrait;
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    self.Portrait.layer.borderColor = [UIColor whiteColor].CGColor;
    self.Portrait.layer.shadowColor = [UIColor whiteColor].CGColor;
    self.Portrait.layer.shadowOpacity = 0.4;
    self.Portrait.layer.shadowRadius = 5.0;
    self.Name.font = [UIFont boldSystemFontOfSize:30];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier = @"cellid";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text = @"个人信息";
            cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
            
            UIImage* portrait = [UIImage imageNamed:@"个人信息"];
            CGSize itemSize = CGSizeMake(30, 30);
            UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0);
            CGRect imageRect = CGRectMake(0.0, 0.0,  itemSize.width, itemSize.height);
            [portrait drawInRect:imageRect];
            cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            break;
        }
        case 1:
        {
            cell.textLabel.text = @"培训情况";
            cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
            
            UIImage* portrait = [UIImage imageNamed:@"培训情况"];
            CGSize itemSize = CGSizeMake(30, 30);
            UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0);
            CGRect imageRect = CGRectMake(0.0, 0.0,  itemSize.width, itemSize.height);
            [portrait drawInRect:imageRect];
            cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            break;
        }
        case 2:
        {
            cell.textLabel.text = @"设置";
            cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
            
            UIImage* portrait = [UIImage imageNamed:@"设置"];
            CGSize itemSize = CGSizeMake(30, 30);
            UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0);
            CGRect imageRect = CGRectMake(0.0, 0.0,  itemSize.width, itemSize.height);
            [portrait drawInRect:imageRect];
            cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            break;
        }
        case 3:
        {
            cell.textLabel.text = @"用户反馈";
            cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
            
            UIImage* portrait = [UIImage imageNamed:@"用户反馈"];
            CGSize itemSize = CGSizeMake(30, 30);
            UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0);
            CGRect imageRect = CGRectMake(0.0, 0.0,  itemSize.width, itemSize.height);
            [portrait drawInRect:imageRect];
            cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            break;
        }
        default:
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 1:
        {
            
            [self performSegueWithIdentifier:@"StatisticSegue" sender:indexPath];
            break;
        }
        default:
            break;
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}


@end
