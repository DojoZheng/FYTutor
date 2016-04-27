//
//  FYTutor.h
//  飞影教练
//
//  Created by Dojo on 16/4/19.
//  Copyright © 2016年 Dojo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FYTutor : NSObject

@property (nonatomic,copy) NSString* name;
@property (nonatomic,copy) NSString* email;
@property (nonatomic,copy) NSString* phone;
@property (nonatomic,copy) NSString* password;
@property (nonatomic,strong) NSString* imagePath;

@end
