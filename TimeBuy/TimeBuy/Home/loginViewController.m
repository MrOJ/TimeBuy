//
//  loginViewController.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/24.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    float screenWeidth = [UIScreen mainScreen].bounds.size.width;
    float screenHight = [UIScreen mainScreen].bounds.size.height;
    
    JScrollView_PageControl_AutoScroll *view = [[JScrollView_PageControl_AutoScroll alloc] initWithFrame:CGRectMake(0, 250, screenWeidth, screenHight - 250)];
    view.autoScrollDelayTime = 10000.0f;
    view.delegate = self;
    
    view.pageControl.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, (screenHight - 250) - 143);
    
    UIView *loginView1 = [[UIView alloc] init];
    loginView1.backgroundColor = [UIColor clearColor];
    UIView *loginView2 = [[UIView alloc] init];
    loginView2.backgroundColor = [UIColor clearColor];
    
    // set View1
    NSArray *logoArray = [[NSArray alloc] initWithObjects:@"微信1",@"新浪1",@"QQ1",@"支付宝1", nil];
    
    for (int i = 0; i < 4 ; i++) {
        UIButton *logoButton = [[UIButton alloc] initWithFrame:CGRectMake(32 + (50 + 37) * i, screenHight - 250 - 101, 50, 50)];
        [logoButton setImage:[UIImage imageNamed:[logoArray objectAtIndex:i]] forState:UIControlStateNormal];
        [loginView1 addSubview:logoButton];
    }
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake((screenWeidth - 95) / 2, screenHight - 250 - 34, 95, 18)];
    tipLabel.text = @"滑动手机号登录";
    tipLabel.font = [UIFont systemFontOfSize:13.0f];
    tipLabel.textColor = [UIColor whiteColor];
    [loginView1 addSubview:tipLabel];
    
    // set View2
    UIColor *color = [UIColor whiteColor];
    
    UITextField *phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 0, [UIScreen mainScreen].bounds.size.width - 40 * 2, 45)];
    phoneTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"手机号" attributes:@{NSForegroundColorAttributeName: color}];
    phoneTextField.backgroundColor = [UIColor clearColor];
    phoneTextField.textAlignment = NSTextAlignmentCenter;
    phoneTextField.borderStyle = UITextBorderStyleRoundedRect;
    phoneTextField.layer.masksToBounds = YES;
    phoneTextField.layer.borderWidth = 1.0f;
    phoneTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    phoneTextField.layer.cornerRadius = 45.0f / 2;
    
    UITextField *passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 0 + 45 + 14, [UIScreen mainScreen].bounds.size.width - 40 * 2, 45)];
    passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"密码" attributes:@{NSForegroundColorAttributeName: color}];
    passwordTextField.backgroundColor = [UIColor clearColor];
    passwordTextField.textAlignment = NSTextAlignmentCenter;
    passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    passwordTextField.layer.masksToBounds = YES;
    passwordTextField.layer.borderWidth = 1.0f;
    passwordTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    passwordTextField.layer.cornerRadius = 45.0f / 2;
    
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 0 + (45 + 14) * 2, [UIScreen mainScreen].bounds.size.width - 40 * 2, 45)];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    loginButton.backgroundColor = [UIColor colorWithRed:64.0f / 255.0f green:76.0f / 255.0f blue:74.0f / 255.0f alpha:1];
    [loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    loginButton.layer.masksToBounds = YES;
    //loginButton.layer.borderWidth = 1.0f;
    //loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
    loginButton.layer.cornerRadius = 45.0f / 2;
    
    UIButton *forgetPwdButton = [[UIButton alloc] initWithFrame:CGRectMake(14, screenHight - 250 - 16 - 13, 52, 13)];
    [forgetPwdButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetPwdButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [forgetPwdButton addTarget:self action:@selector(forgetPwd:) forControlEvents:UIControlEventTouchUpInside];
    forgetPwdButton.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    [loginView2 addSubview:forgetPwdButton];
    
    UIButton *newUserButton = [[UIButton alloc] initWithFrame:CGRectMake(screenWeidth - 14 - 39, screenHight - 250 - 16 - 13, 39, 13)];
    [newUserButton setTitle:@"新用户" forState:UIControlStateNormal];
    [newUserButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [newUserButton addTarget:self action:@selector(newUser:) forControlEvents:UIControlEventTouchUpInside];
    newUserButton.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    [loginView2 addSubview:newUserButton];
    
    
    [loginView2 addSubview:phoneTextField];
    [loginView2 addSubview:passwordTextField];
    [loginView2 addSubview:loginButton];
    
    
    NSMutableArray *viewsArray=[[NSMutableArray alloc]initWithObjects:loginView1,loginView2,nil];
    [view setViewsArray:viewsArray];  // at least 3 views
    
    [self.view addSubview:view];
    [view shouldAutoShow:YES];
    
    
}

// 登录
- (void)login:(id)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
}

//忘记密码
- (void)forgetPwd:(id)sender {
    
}

//新用户注册
- (void)newUser:(id)sender {
    
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
