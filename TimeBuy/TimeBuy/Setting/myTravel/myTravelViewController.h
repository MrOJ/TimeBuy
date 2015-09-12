//
//  footTransactionViewController.h
//  TimeBuy
//
//  Created by yuweize on 15/8/31.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "detailHistoryViewController.h"
@interface myTravelViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic) NSMutableArray *dealData;
@property (nonatomic) NSMutableArray *responseData;
@property (nonatomic) NSMutableArray *favoriteData;
@property (nonatomic) NSMutableArray *data;
@property (nonatomic) NSInteger *x;
@end
