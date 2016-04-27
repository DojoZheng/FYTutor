//
//  StatisticView.h
//  飞影教练
//
//  Created by Dojo on 16/4/20.
//  Copyright © 2016年 Dojo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatisticView : UIView
@property (weak, nonatomic) IBOutlet UILabel *className;

+(StatisticView *)instanceStatisticView;
@end
