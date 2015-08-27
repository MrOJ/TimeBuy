//
//  forgetPwdViewController.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/27.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "AFNetworking.h"

@interface forgetPwdViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIButton *getVerifyButton;
@property (strong, nonatomic) IBOutlet UITextField *VerifyTextField;
@property (strong, nonatomic) IBOutlet UIButton *enterButton;

- (IBAction)back:(id)sender;
- (IBAction)getVerify:(id)sender;
- (IBAction)enterButton:(id)sender;

@end
