//
//  showDetailsViewController.h
//  TimeBuy
//
//  Created by yuweize on 15/8/29.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//
#import "KLCPopup.h"
#import <UIKit/UIKit.h>

@interface showDetailsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>
{
    //NSMutableArray *repeatData;
    NSMutableArray *Sections;
    UITextView *textview;
    UILabel *label;
    KLCPopup *popup;
}
@property(nonatomic) NSMutableArray *repeatData;
- (void)createTableviewData;
@end
