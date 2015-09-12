//
//  changeTelephoneViewController.m
//  TimeBuy
//
//  Created by yuweize on 15/9/8.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "changeTelephoneViewController.h"

@interface changeTelephoneViewController ()
@property (weak, nonatomic) IBOutlet UILabel *UILabelText;
@property (weak, nonatomic) IBOutlet UITextField *labelText;
@property (weak, nonatomic) IBOutlet UIButton *changeButton;

@end

@implementation changeTelephoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.UILabelText.frame=CGRectMake(20, 10, 127, 34);
    self.UILabelText.textAlignment=NSTextAlignmentCenter;
    self.UILabelText.layer.borderWidth=1;
    self.UILabelText.layer.borderColor=self.UILabelText.textColor.CGColor;
    //[self.UILabelText sizeThatFits:CGSizeMake(127, 34)];
    self.changeButton.backgroundColor=[UIColor colorWithRed:80.f/255 green:227.f/255 blue:194.f/255 alpha:100];
    
    //self.navigationItem.rightBarButtonItem = registerButton;
    self.navigationItem.rightBarButtonItem.enabled = NO;

    // Do any additional setup after loading the view from its nib.
}
- (IBAction)changePress:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"passModify"
                                                        object:self
                                                      userInfo:@{@"type":@"phone",@"value":self.labelText.text}];
}

#pragma mark - TextView delegate
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    self.navigationItem.rightBarButtonItem.enabled = YES;
}

// 点击编辑区以外的地方 取消键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![self.labelText isExclusiveTouch]) {
        [self.labelText  resignFirstResponder];
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
