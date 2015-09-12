//
//  detailHistoryViewController.h
//  TimeBuy
//
//  Created by yuweize on 15/9/6.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailHistoryViewController :UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic) NSMutableArray *repeatData;
- (void)createTableviewData;
@end
