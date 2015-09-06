//
//  showDetailsViewController.h
//  TimeBuy
//
//  Created by yuweize on 15/8/29.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface showDetailsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    //NSMutableArray *repeatData;
    NSMutableArray *Sections;
}
@property(nonatomic) NSMutableArray *repeatData;
- (void)createTableviewData;
@end
