//
//  ContactsViewController.m
//  飞影教练
//
//  Created by Dojo on 16/4/20.
//  Copyright © 2016年 Dojo. All rights reserved.
//

#import "ContactsViewController.h"
#define _Macro_ContactsCell @"contactsCell"

@interface ContactsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSMutableArray* Array;
@property (strong, nonatomic) NSDictionary* contactsDictData;
@property (strong, nonatomic) NSArray* listGroupName;

@end

@implementation ContactsViewController

#pragma mark - Lifecycle
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBackGroundView];
    
    //获取列表数据
    [self getListData];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Functions
- (void)initBackGroundView{
    _Array = [[NSMutableArray alloc] initWithObjects:@"+",@"我",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#",nil];
    
    _tableView.tag = 101;

}

- (void)getListData{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"contactsInfo"
                                           ofType:@"plist"];
    //获取属性列表文件中的全部数据
    self.contactsDictData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    NSArray* tempList  = [self.contactsDictData allKeys];
    //对key进行排序
    self.listGroupName = [tempList sortedArrayUsingSelector:@selector(compare:)];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;{
    return [self.listGroupName count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //按照节索引从小组名数组中获得组名
    NSString *groupName = [self.listGroupName objectAtIndex:section];
    //按照组名做为key，从字典中取出球队数组集合
    NSArray *listTeams = [self.contactsDictData objectForKey:groupName];
    return [listTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* identifier = _Macro_ContactsCell;
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:_Macro_ContactsCell];
    }
    
    //获得选择的节
    NSUInteger section = [indexPath section];
    //获得选择节中的，选中的行索引
    NSUInteger row = [indexPath row];
    //按照节索引从小组名数组中获得组名
    NSString *groupName = [self.listGroupName objectAtIndex:section];
    //按照组名做为key，从字典中取出球队数组集合
    NSArray *listTeams = [self.contactsDictData objectForKey:groupName];
    //获取用户字典
    NSDictionary* contactDict = [listTeams objectAtIndex:row];
    //获取头像和名字
    cell.textLabel.text =  [contactDict objectForKey:@"name"];
    UIImage* portrait = [UIImage imageNamed:[contactDict objectForKey:@"image"]];
    CGSize itemSize = CGSizeMake(30, 30);
    UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0);
    CGRect imageRect = CGRectMake(0.0, 0.0,  itemSize.width, itemSize.height);
    [portrait drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return cell;
}

- (NSArray*)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    return [NSArray arrayWithObjects:UITableViewIndexSearch,@"+",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#", nil];
    NSMutableArray *listTitles = [[NSMutableArray alloc] initWithCapacity:[self.listGroupName count]];
    //把 A组 -> A
    for (NSString *item in self.listGroupName) {
        NSString *title = [item  substringToIndex:1];
        [listTitles  addObject:title];
    }
    return listTitles;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString* groupName = [self.listGroupName objectAtIndex:section];
    return groupName;
}

#pragma mark - UITableViewDelegate


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
