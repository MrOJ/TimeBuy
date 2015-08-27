//
//  forgetPwdViewController.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/27.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "forgetPwdViewController.h"

@interface forgetPwdViewController ()

@end

@implementation forgetPwdViewController

@synthesize backButton;
@synthesize phoneTextField;
@synthesize passwordTextField;
@synthesize getVerifyButton;
@synthesize VerifyTextField;
@synthesize enterButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setTextFieldStyle:phoneTextField withString:@"请输入手机号码"];
    [self setTextFieldStyle:passwordTextField withString:@"请输入新密码"];
    [self setTextFieldStyle:VerifyTextField withString:@"输入验证码"];
    
    backButton.layer.cornerRadius = 45.0f / 2;
    getVerifyButton.layer.cornerRadius = 45.0f / 2;
    enterButton.layer.cornerRadius = 45.0f / 2;
}

#pragma mark - TextField delegate
//点击return取消键盘
- (BOOL)textFieldShouldReturn:(UITextField *) textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

// 点击编辑区以外的地方 取消键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![phoneTextField isExclusiveTouch] || ![passwordTextField isExclusiveTouch]) {
        [phoneTextField resignFirstResponder];
        [passwordTextField resignFirstResponder];
    }
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)getVerify:(id)sender {
    
}

- (IBAction)enterButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setTextFieldStyle:(UITextField *)textField withString:(NSString *)str {
    UIColor *color = [UIColor whiteColor];
    
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:str attributes:@{NSForegroundColorAttributeName: color}];
    textField.backgroundColor = [UIColor clearColor];
    textField.textAlignment = NSTextAlignmentCenter;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.layer.masksToBounds = YES;
    textField.layer.borderWidth = 1.0f;
    textField.layer.borderColor = [UIColor whiteColor].CGColor;
    textField.layer.cornerRadius = 45.0f / 2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
