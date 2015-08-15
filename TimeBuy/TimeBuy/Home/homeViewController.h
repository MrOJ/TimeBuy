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

#import "SlideNavigationController.h"

typedef NS_ENUM(NSInteger, HomeTableViewSectionType){
    HomeTableViewSectionTypeSlide,
    HomeTableViewSectionTypeCatagory,
};

@interface homeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,JScrollViewViewDelegate,SlideNavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

