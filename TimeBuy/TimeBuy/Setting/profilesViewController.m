//
//  profilesViewController.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/9.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "profilesViewController.h"

@interface profilesViewController ()

@end

@implementation profilesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
    UINavigationBar *myBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.navigationController.navigationBar.bounds.size.width, self.navigationController.navigationBar.bounds.size.width)];
    [self.view addSubview:myBar];
    */
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIColor * barColor = [UIColor
                          colorWithRed:48.0/255.0
                          green:47.0/255.0
                          blue:52.0/255.0
                          alpha:1.0];
    [self.navigationController.navigationBar setBarTintColor:barColor];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 60, 25)];
    //[backButton setImage:[UIImage imageNamed:@"箭头9x17px"] forState:UIControlStateNormal];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:backButton];
    
}

- (void)back:(id)sender {
    //[self.navigationController popViewControllerAnimated:YES];
    //[self.navigationController popToRootViewControllerAnimated:YES];
    
    homeViewController *homeVC = [[homeViewController alloc] init];
    
    [self.navigationController popToViewController:homeVC animated:YES];
    
    
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
