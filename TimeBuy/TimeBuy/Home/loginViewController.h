//
//  loginViewController.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/24.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JScrollView+PageControl+AutoScroll.h"
#import "MBProgressHUD.h"
#import "AFNetworking.h"

#import "NSString+MD5.h"

@interface loginViewController : UIViewController<JScrollViewViewDelegate,UITextFieldDelegate,MBProgressHUDDelegate>
{
    UITextField *phoneTextField;
    UITextField *passwordTextField;
    
    MBProgressHUD *HUD;
}

@end
