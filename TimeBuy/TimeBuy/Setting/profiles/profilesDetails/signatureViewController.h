//
//  signatureViewController.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/19.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface signatureViewController : UIViewController<UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *signatureTextView;
@property (strong, nonatomic) NSString *signature;

@end
