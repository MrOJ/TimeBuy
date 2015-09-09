//
//  mySheduleViewController.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/9/7.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "infoTableViewCell.h"
#import "timeTableViewCell.h"
#import "sheduleTableViewCell.h"

@interface mySheduleViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@end
