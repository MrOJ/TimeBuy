//
//  telephoneViewController.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/19.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "changeTelephoneViewController.h"
@interface telephoneViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *telTableView;

@property (strong, nonatomic) NSString *telephone;

@end
