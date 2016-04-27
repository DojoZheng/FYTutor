//
//  ClassViewController.m
//  飞影教练
//
//  Created by Dojo on 16/4/20.
//  Copyright © 2016年 Dojo. All rights reserved.
//

#import "ClassViewController.h"
#define _Macro_ClassCell @"ClassCellID"
@interface ClassViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBar.backgroundColor = [UIColor orangeColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier = _Macro_ClassCell;
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:_Macro_ClassCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text = @"培训中";
            UIImage* portrait = [UIImage imageNamed:@"training"];
            CGSize itemSize = CGSizeMake(35, 35);
            UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0);
            CGRect imageRect = CGRectMake(0.0, 0.0,  itemSize.width, itemSize.height);
            [portrait drawInRect:imageRect];
            cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            break;
        }
        case 1:
        {
            cell.textLabel.text = @"待开班";
            UIImage* portrait = [UIImage imageNamed:@"ToBeTrained"];
            CGSize itemSize = CGSizeMake(35, 35);
            UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0);
            CGRect imageRect = CGRectMake(0.0, 0.0,  itemSize.width, itemSize.height);
            [portrait drawInRect:imageRect];
            cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            break;
        }
        case 2:
        {
            cell.textLabel.text = @"已完成";
            UIImage* portrait = [UIImage imageNamed:@"Trained"];
            CGSize itemSize = CGSizeMake(35, 35);
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"ClassDetailSegue" sender:indexPath];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UIViewController* destination = segue.destinationViewController;
    NSIndexPath* indexPath = sender;
    switch (indexPath.row) {
        case 0:
            destination.title = @"培训中";
            break;
        case 1:
            destination.title = @"待开班";
            break;
        case 2:
            destination.title = @"已完成";
            break;
        default:
            break;
    }
}


@end
