//
//  settingViewController.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/8.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface settingViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *settingTableView;
@end
