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
#import "homeDetailsTableViewCell.h"
#import "settingViewController.h"
#import "nearbyViewController.h"
#import "userConfiguration.h"

#import "SlideNavigationController.h"

#import "loginViewController.h"
#import "registerViewController.h"

typedef NS_ENUM(NSInteger, HomeTableViewSectionType){
    HomeTableViewSectionTypeSlide,
    HomeTableViewSectionTypeCatagory
};

typedef NS_ENUM(NSInteger, HomeTableViewRowType){
    HomeTableViewRowTypeSlide,
    HomeTableViewRowTypeCatagory,
    HomeTableViewRowTypeSelects
};

@interface homeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,JScrollViewViewDelegate,SlideNavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

