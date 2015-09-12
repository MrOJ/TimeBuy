//
//  TalkViewController.m
//  TimeBuy
//
//  Created by yuweize on 15/9/8.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "TalkViewController.h"

@interface TalkViewController ()

@end

@implementation TalkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20.0f], NSFontAttributeName, nil];
    [self.navigationController setTitle:@"和我们聊聊"];
    // Do any additional setup after loading the view from its nib.
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
