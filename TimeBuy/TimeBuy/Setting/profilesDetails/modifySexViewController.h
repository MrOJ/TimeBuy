//
//  modifySexViewController.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/16.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface modifySexViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSString* sex;
@property (strong, nonatomic) IBOutlet UITableView *sexTableView;

@end
