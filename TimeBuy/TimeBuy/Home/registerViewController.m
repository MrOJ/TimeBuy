//
//  registerViewController.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/27.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "registerViewController.h"

@interface registerViewController ()

@end

@implementation registerViewController

@synthesize backButton;
@synthesize phoneTextField;
@synthesize passwordTextField;
@synthesize getVerifyButton;
@synthesize VerifyTextField;
@synthesize registerButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setTextFieldStyle:phoneTextField withString:@"请输入手机号码"];
    [self setTextFieldStyle:passwordTextField withString:@"6~16位数字或字母，区分大小写"];
    [self setTextFieldStyle:VerifyTextField withString:@"输入验证码"];
    
    backButton.layer.cornerRadius = 45.0f / 2;
    getVerifyButton.layer.cornerRadius = 45.0f / 2;
    registerButton.layer.cornerRadius = 45.0f / 2;
    
    phoneTextField.delegate = self;
    passwordTextField.delegate = self;
    VerifyTextField.delegate = self;
    
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
    [self dismissViewControllerAnimated:NO completion:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"passState"
                                                        object:self
                                                      userInfo:@{@"state":@"4"}];
}

- (IBAction)getVerify:(id)sender {
    
}

- (IBAction)registerButton:(id)sender {
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self loginVerify];
}

- (void)loginVerify {
    if (([phoneTextField.text length]== 0 ) || ([passwordTextField.text length] == 0))
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"注册失败" message:@"输入不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    } else if (![self isMobileNumber:phoneTextField.text]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"注册失败" message:@"请输入正确的手机号码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        [phoneTextField becomeFirstResponder];
    } else if ([self.passwordTextField.text length] < 6 && [self.passwordTextField.text length] > 16) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"注册失败" message:@"请输入6~16位数字或字幕，区分大小写" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        [passwordTextField becomeFirstResponder];
    } else {
        //[activityIndicatorView startAnimating];
        HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        // Regiser for HUD callbacks so we can remove it from the window at the right time
        HUD.delegate = self;
        //上传至服务器
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        [manager.requestSerializer setValue:@"d6089681f79c7627bbac829307e041a7" forHTTPHeaderField:@"x-timebuy-sid"];
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        
        //2.设置登录参数
        NSDictionary *dict = @{ @"phone":phoneTextField.text,
                                @"password":[passwordTextField.text MD5],
                                @"code":@"123"};
        //};
        
        //3.请求
        [manager GET:@"http://192.168.8.102:8080/timebuy/reg/user" parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"GET --> %@", responseObject); //自动返回主线程
            
            //[activityIndicatorView stopAnimating];
            [HUD hide:YES];
            
            NSString *getStatus = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"success"]];
            NSString *getCode = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"code"]];
            if ([getStatus isEqualToString:@"1"]) {
                [self dismissViewControllerAnimated:YES completion:nil];
                
                HUD = [[MBProgressHUD alloc] initWithView:self.view];
                [self.view addSubview:HUD];
                HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
                HUD.mode = MBProgressHUDModeCustomView;
                
                HUD.delegate = self;
                HUD.labelText = @"注册成功";
                [HUD show:YES];
                [HUD hide:YES afterDelay:2];
                
                [userConfiguration setStringValueForConfigurationKey:phoneTextField.text withValue:@"user"];
                
            }  else if ([getStatus isEqualToString:@"0"] && [getCode isEqualToString:@"2002"]) {
                [self showErrorWithTitle:@"注册失败" WithMessage:@"用户名已存在"];
            } else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"注册失败" message:@"连接服务器失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
            }
            
        } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@", error);
            [HUD hide:YES];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"注册失败" message:@"请检查网络设置" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }];
        
    }
}

#pragma mark - MBProgressHUDDelegate
- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [HUD removeFromSuperview];
    //[self dismissViewControllerAnimated:YES completion:nil];
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

-(void)showErrorWithTitle:(NSString *)titile WithMessage:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:titile message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
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
