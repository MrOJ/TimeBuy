//
//  settingViewController.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/8.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "settingViewController.h"

@interface settingViewController ()

@end

@implementation settingViewController

@synthesize settingTableView;
@synthesize menuArray;

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    NSLog(@"left view appear");
    //[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    
    /*
    shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    shadowView.backgroundColor = [UIColor blackColor];
    shadowView.alpha = 0.45f;
    */
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
    NSLog(@"left view disappear");
    //[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    //[shadowView removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor colorWithRed:10.0f / 255.0f green:7.0f / 255.0f blue:26.0f / 255.0f alpha:1];
    
    self.settingTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    menuArray = [[NSArray alloc] initWithObjects:@"个人信息",@"我的足迹",@"我的消息",@"我的日程",@"支付方式",@"退出登录", nil];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return menuArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    //需要对每个cell进行标识，不然刷新会有问题
    NSString *CellTableIdentifier=[[NSString alloc]initWithFormat:@"extentedCell%lu-%lu",(unsigned long)indexPath.section,(unsigned long)row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
        
    }
    
    cell.backgroundColor = self.view.backgroundColor = [UIColor colorWithRed:10.0f / 255.0f green:7.0f / 255.0f blue:26.0f / 255.0f alpha:1];
    
    UIImageView *menuImgView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 13, 16, 18)];
    menuImgView.image = [UIImage imageNamed:[menuArray objectAtIndex:row]];
    
    UILabel *menuLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 16, 80, 20)];
    menuLabel.text = [menuArray objectAtIndex:row];
    menuLabel.textColor = [UIColor whiteColor];
    menuLabel.font = [UIFont systemFontOfSize:16.0f];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 49, 220, 1)];
    lineView.backgroundColor = [UIColor whiteColor];
    [cell addSubview:lineView];
    
    [cell addSubview:menuLabel];
    [cell addSubview:menuImgView];
    
    //cell.textLabel.text = @"Hello";
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"row = %ld",(long)indexPath.row);
    switch (indexPath.row) {
        case 0:
        {
            profilesViewController *vc = [[profilesViewController alloc] init];
            //vc.navigationItem.title = @"我的信息";
            
            [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
                                                                     withSlideOutAnimation:YES
                                                                             andCompletion:nil];
        }
            break;
            
        default:
            break;
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
