//
//  StatisticView.m
//  飞影教练
//
//  Created by Dojo on 16/4/20.
//  Copyright © 2016年 Dojo. All rights reserved.
//

#import "StatisticView.h"

@implementation StatisticView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


//- (void)awakeFromNib
//{
//    [[NSBundle mainBundle] loadNibNamed:@"Statistic" owner:self options:nil];
////    [self addSubview:self.contentView];
//}

+(StatisticView *)instanceStatisticView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"Statistic" owner:nil options:nil];
    return [nibView objectAtIndex:0];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        //you init
        
    }
    return self;
}

@end
