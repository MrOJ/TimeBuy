//
//  messageViewController.h
//  TimeBuy
//
//  Created by yuweize on 15/9/3.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IBActionSheet.h"
@interface messageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,IBActionSheetDelegate>
@property (nonatomic) NSMutableArray *messageData;
@end
