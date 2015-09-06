//
//  phoneViewController.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/9/2.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "phoneViewController.h"

@interface phoneViewController ()

@end

@implementation phoneViewController

@synthesize phoneTextField;
@synthesize phone;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"修改号码";
    
    phoneTextField.text = phone;
    phoneTextField.delegate = self;
    
    UIBarButtonItem *registerButton = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = registerButton;
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

- (void)save:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"passModifyInRelease"
                                                        object:self
                                                      userInfo:@{@"type":@"phone",@"value":phoneTextField.text}];
}

#pragma mark - TextField delegate
//点击return取消键盘
- (BOOL)textFieldShouldReturn:(UITextField *) textField {
    
    [textField resignFirstResponder];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"passModifyInRelease"
                                                        object:self
                                                      userInfo:@{@"type":@"phone",@"value":phoneTextField.text}];
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.navigationItem.rightBarButtonItem.enabled = YES;
}

// 点击编辑区以外的地方 取消键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![phoneTextField isExclusiveTouch]) {
        [phoneTextField resignFirstResponder];
    }
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
