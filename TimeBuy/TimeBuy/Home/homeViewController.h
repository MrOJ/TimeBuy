//
//  ViewController.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/5.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "MMDrawerController+Subclass.h"
#import "MMDrawerVisualState.h"
#import "UIViewController+MMDrawerController.h"

#import "MJRefresh.h"

@interface homeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

