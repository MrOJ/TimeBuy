//
//  settingViewController.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/8.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SlideNavigationController.h"

#import "profilesViewController.h"

@interface settingViewController : UIViewController
{
    UIView *shadowView;
}

//@property (strong, nonatomic) IBOutlet UITableView *settingTableView;
//@property (strong, nonatomic) NSArray *menuArray;
@property (strong, nonatomic) IBOutlet UIButton *releaseButton;
@property (strong, nonatomic) IBOutlet UIButton *settingButton;
@property (strong, nonatomic) IBOutlet UIButton *informationButton;
@property (strong, nonatomic) IBOutlet UIButton *myTravelButton;
@property (strong, nonatomic) IBOutlet UIButton *myNoticeButton;
@property (strong, nonatomic) IBOutlet UIButton *myScheduleButton;
@property (strong, nonatomic) IBOutlet UIButton *payButton;
@property (strong, nonatomic) IBOutlet UIButton *logoutButton;

- (IBAction)release:(id)sender;
- (IBAction)setting:(id)sender;
- (IBAction)information:(id)sender;
- (IBAction)myTravel:(id)sender;
- (IBAction)myNotice:(id)sender;
- (IBAction)mySchedule:(id)sender;
- (IBAction)payWay:(id)sender;
- (IBAction)logout:(id)sender;

@end
