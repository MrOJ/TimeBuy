//
//  profilesViewController.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/9.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeViewController.h"

#import "modifyNameViewController.h"
#import "modifySexViewController.h"
#import "modifyAgeViewController.h"
#import "occupationViewController.h"
#import "addressViewController.h"
#import "telephoneViewController.h"
#import "signatureViewController.h"

@interface profilesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSArray *titleArray1;
@property (nonatomic, strong) NSArray *titleArray2;
@property (nonatomic, strong) NSArray *detailsArray;

@end
