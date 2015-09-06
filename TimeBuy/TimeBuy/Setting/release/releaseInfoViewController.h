//
//  releaseInfoViewController.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/29.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "releaseDetailsTableViewCell.h"
#import "placeTableViewCell.h"
#import "details2TableViewCell.h"
#import "detailsTableViewCell.h"
#import "labelsTableViewCell.h"

#import "placeViewController.h"
#import "priceViewController.h"
#import "phoneViewController.h"

#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "userConfiguration.h"

@interface releaseInfoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MBProgressHUDDelegate>
{
    NSString *msgStr;
    NSString *placeStr;
    CGFloat *latitude;
    CGFloat *longtitude;
    NSString *startTimeStr;
    NSString *finishTimeStr;
    NSString *priceStr;
    NSString *phoneStr;
    NSString *label;
    
    MBProgressHUD *HUD;
    MBProgressHUD *HUDinSuccess;
    
    UIView *shadowView;
    
    NSInteger row;
}

@property (strong, nonatomic) IBOutlet UITableView *releaseTableView;
@property (strong, nonatomic) UIDatePicker *datePicker;
@end
