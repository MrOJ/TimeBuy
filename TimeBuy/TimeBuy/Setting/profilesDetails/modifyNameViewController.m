//
//  modifyNameViewController.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/16.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "modifyNameViewController.h"

@interface modifyNameViewController ()

@end

@implementation modifyNameViewController

@synthesize nameView,nameTextField;
@synthesize name;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"名字";
    
    nameView.layer.borderColor = (__bridge CGColorRef)([UIColor darkGrayColor]);
    nameView.layer.borderWidth = 1.0f;
    nameView.layer.masksToBounds = YES;
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
