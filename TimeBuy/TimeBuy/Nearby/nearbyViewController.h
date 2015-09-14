//
//  nearbyViewController.h
//  TimeBuy
//
//  Created by yuweize on 15/9/5.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"

@interface nearbyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic) NSMutableArray *nearbyData;

@end
