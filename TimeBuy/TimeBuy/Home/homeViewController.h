//
//  ViewController.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/5.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MJRefresh.h"
#import "JScrollView+PageControl+AutoScroll.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"

#import "homeDetailsTableViewCell.h"
#import "settingViewController.h"
#import "nearbyViewController.h"
#import "userConfiguration.h"

#import "SlideNavigationController.h"
#import "KLCPopup.h"

#import "loginViewController.h"
#import "registerViewController.h"
#import "forgetPwdViewController.h"
#import "showDetailsViewController.h"
#import "getDealViewController.h"
#import "getHelpViewController.h"
#import "zuJuViewController.h"
//#import "testViewController.h"

typedef NS_ENUM(NSInteger, HomeTableViewSectionType){
    HomeTableViewSectionTypeSlide,
    HomeTableViewSectionTypeCatagory
};

typedef NS_ENUM(NSInteger, HomeTableViewRowType){
    HomeTableViewRowTypeSlide,
    HomeTableViewRowTypeCatagory,
    HomeTableViewRowTypeSelects
};

@interface homeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,JScrollViewViewDelegate,SlideNavigationControllerDelegate,MBProgressHUDDelegate>
{
    NSString *getState;
    
    MBProgressHUD *HUD;
    MBProgressHUD *HUDinSuccess;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

