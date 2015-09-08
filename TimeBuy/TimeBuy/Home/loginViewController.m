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

@synthesize getData;

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
    
    phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(76, 40, [UIScreen mainScreen].bounds.size.width - 76 * 2, 36)];
    phoneTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"手机号" attributes:@{NSForegroundColorAttributeName: color}];
    phoneTextField.backgroundColor = [UIColor clearColor];
    phoneTextField.textAlignment = NSTextAlignmentCenter;
    phoneTextField.borderStyle = UITextBorderStyleRoundedRect;
    phoneTextField.layer.masksToBounds = YES;
    phoneTextField.layer.borderWidth = 1.0f;
    phoneTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    phoneTextField.layer.cornerRadius = 36.0f / 2;
    //phoneTextField.layer.opacity = 0.7f;
    phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    phoneTextField.delegate = self;
    
    
    passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(76, 40 + 36 + 11, [UIScreen mainScreen].bounds.size.width - 76 * 2, 36)];
    passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"密码" attributes:@{NSForegroundColorAttributeName: color}];
    passwordTextField.backgroundColor = [UIColor clearColor];
    passwordTextField.textAlignment = NSTextAlignmentCenter;
    passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    passwordTextField.layer.masksToBounds = YES;
    passwordTextField.layer.borderWidth = 1.0f;
    passwordTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    passwordTextField.layer.cornerRadius = 36.0f / 2;
    //passwordTextField.layer.opacity = 0.7f;
    passwordTextField.delegate = self;
    passwordTextField.secureTextEntry = YES;
    
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(76, 40 + (36 + 11) * 2, [UIScreen mainScreen].bounds.size.width - 76 * 2, 36)];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    //[loginButton setTitleColor:[UIColor colorWithRed:41.0f / 255.0 green:135.0f / 255.0 blue:157.0f / 255.0 alpha:1] forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor colorWithRed:41.0f / 255.0 green:135.0f / 255.0 blue:157.0f / 255.0 alpha:1] forState:UIControlStateNormal];
    loginButton.backgroundColor = [UIColor whiteColor];
    [loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    loginButton.layer.masksToBounds = YES;
    loginButton.layer.opacity = 0.7f;
    //loginButton.layer.borderWidth = 1.0f;
    //loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
    loginButton.layer.cornerRadius = 36.0f / 2;
    
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

#pragma mark - TextField delegate
//点击return取消键盘
- (BOOL)textFieldShouldReturn:(UITextField *) textField {
    
    [textField resignFirstResponder];
    
    if ([phoneTextField.text length]== 0) {
        [self showErrorWithTitle:@"登录失败" WithMessage:@"手机号码不能为空"];
        //[phoneTextField becomeFirstResponder];
    } else if (![self isMobileNumber:[phoneTextField text]]) {
        [self showErrorWithTitle:@"登录失败" WithMessage:@"手机号码格式不正确"];
        [phoneTextField becomeFirstResponder];
    } else if ([passwordTextField.text length] == 0) {
        [self showErrorWithTitle:@"登录失败" WithMessage:@"密码不能为空"];
        [passwordTextField becomeFirstResponder];
    } else {
        [self verifyLogin];
    }
    
    return YES;
}

// 点击编辑区以外的地方 取消键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![phoneTextField isExclusiveTouch] || ![passwordTextField isExclusiveTouch]) {
        [phoneTextField resignFirstResponder];
        [passwordTextField resignFirstResponder];
    }
}

//传送状态 0 - 登录成功； 1 - 忘记密码；  2 - 新用户注册 4 - 返回
// 登录
- (void)login:(id)sender {
    
    //[self dismissViewControllerAnimated:YES completion:nil];
    if ([phoneTextField.text length]== 0) {
        [self showErrorWithTitle:@"登录失败" WithMessage:@"手机号码不能为空"];
        //[phoneTextField becomeFirstResponder];
    } else if (![self isMobileNumber:[phoneTextField text]]) {
        [self showErrorWithTitle:@"登录失败" WithMessage:@"手机号码格式不正确"];
        [phoneTextField becomeFirstResponder];
    } else if ([passwordTextField.text length] == 0) {
        [self showErrorWithTitle:@"登录失败" WithMessage:@"密码不能为空"];
        [passwordTextField becomeFirstResponder];
    } else {
        [self verifyLogin];
    }
    
}

//忘记密码
- (void)forgetPwd:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"passState"
                                                        object:self
                                                      userInfo:@{@"state":@"1"}];
}

//新用户注册
- (void)newUser:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"passState"
                                                        object:self
                                                      userInfo:@{@"state":@"2"}];
}

- (void)verifyLogin {
    
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.delegate = self;
    
    //上传至服务器
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"d6089681f79c7627bbac829307e041a7" forHTTPHeaderField:@"x-timebuy-sid"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=uft-8" forHTTPHeaderField:@"Content-Type"];
    
    //2.设置登录参数
    NSDictionary *dict = @{ @"phone":phoneTextField.text,
                            @"password":[passwordTextField.text MD5]};
    
    //3.请求
    [manager GET:@"http://192.168.8.102:8080/timebuy/login/user" parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"GET --> %@", responseObject); //自动返回主线程
        [HUD hide:YES];
        
        NSString *getStatus = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"success"]];
        NSString *getCode = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"code"]];
        if ([getStatus isEqualToString:@"1"] && [getCode isEqualToString:@"1000"]) {
            
            //[self dismissViewControllerAnimated:YES completion:nil];
            
            HUDinSuccess = [[MBProgressHUD alloc] initWithView:self.view];
            [self.view addSubview:HUDinSuccess];
            HUDinSuccess.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
            HUDinSuccess.mode = MBProgressHUDModeCustomView;
            HUDinSuccess.delegate = self;
            HUDinSuccess.labelText = @"登录成功";
            [HUDinSuccess show:YES];
            [HUDinSuccess hide:YES afterDelay:1];
            
            // 将得到的数据存在本地
            getData = [responseObject objectForKey:@"data"];
            
            [self storeInUserDefault:@"headIcon"];
            [self storeInUserDefault:@"userId"];
            [self storeInUserDefault:@"nickName"];
            [self storeInUserDefault:@"sex"];
            [self storeInUserDefault:@"age"];
            [self storeInUserDefault:@"profession"];
            [self storeInUserDefault:@"address"];
            [self storeInUserDefault:@"phone"];
            [self storeInUserDefault:@"birthDay"];
            [self storeInUserDefault:@"signature"];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"passState"
                                                                object:self
                                                              userInfo:@{@"state":@"0"}];
            
            
            
            
        } else if ([getStatus isEqualToString:@"0"] && [getCode isEqualToString:@"2003"]) {
            [self showErrorWithTitle:@"登录失败" WithMessage:@"用户名不存在"];
        } else if ([getStatus isEqualToString:@"0"] && [getCode isEqualToString:@"2004"]) {
            [self showErrorWithTitle:@"登录失败" WithMessage:@"密码错误"];
        } else {
            [self showErrorWithTitle:@"登录失败" WithMessage:@"系统错误"];
        }
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        [HUD hide:YES];
        [self showErrorWithTitle:@"登录失败" WithMessage:@"网络连接失败，请检查网络设置"];
    }];
}

#pragma mark - MBProgressHUDDelegate
- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [hud removeFromSuperview];
    if ([hud isEqual:HUDinSuccess]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    //[HUDinSuccess removeFromSuperview];
    
}

-(void)showErrorWithTitle:(NSString *)titile WithMessage:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:titile message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

//数据存入本地
- (void)storeInUserDefault:(NSString *)target
{
    NSString *getStr = @"";
    if ([[getData valueForKey:target] isKindOfClass:[NSString class]]) {
        NSString *str = [NSString stringWithFormat:@"%@",[getData valueForKey:target]];
        getStr = [NSString stringWithString:[str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
    } else {
        getStr = [(NSNumber *)[getData valueForKey:target] stringValue];
        
    }
    
    NSLog(@"%@ = %@",target,getStr);
    
    [userConfiguration setStringValueForConfigurationKey:target withValue:getStr];
}

//判断手机号码是否正确
- (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
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
