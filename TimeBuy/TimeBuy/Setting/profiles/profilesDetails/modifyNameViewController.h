//
//  modifyNameViewController.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/16.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface modifyNameViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *nameView;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;

@property (strong, nonatomic) NSString *name;

@end
