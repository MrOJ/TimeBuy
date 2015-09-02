//
//  releaseInfoViewController.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/29.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "releaseInfoViewController.h"

@interface releaseInfoViewController ()

@end

@implementation releaseInfoViewController

@synthesize releaseTableView;
@synthesize datePicker;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:24.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"发布";
    
    UIBarButtonItem *registerButton = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(send:)];
    self.navigationItem.rightBarButtonItem = registerButton;
    //self.navigationItem.rightBarButtonItem.enabled = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recModify:) name:@"passModifyInRelease" object:nil];
    
    placeStr = @"杭州小和山";
    startTimeStr = @"2015-10-02";
    finishTimeStr = @"2015-10-02";
    priceStr = @"10.0";
    phoneStr = @"18767122229";
    
}

- (void)send:(id)sender {
    [self sendMgs];
}

- (void)recModify:(NSNotification *)notification
{
    NSDictionary *getDic = [notification userInfo];
    NSString *getType = [getDic objectForKey:@"type"];
    NSString *getValue = [getDic objectForKey:@"value"];
    
    if ([getType isEqualToString:@"place"]) {
        
        placeStr = getValue;
        
        placeTableViewCell *cell= (placeTableViewCell *)[releaseTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
        [cell.placeButton setTitle:getValue forState:UIControlStateNormal];
        
    } else if ([getType isEqualToString:@"price"]) {
        NSString *str = @"￥";
        priceStr = getValue;
        
        details2TableViewCell *cell= (details2TableViewCell *)[releaseTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]];
        cell.myDetailLabel.text = [str stringByAppendingString:getValue];
        
    } else if ([getType isEqualToString:@"phone"]) {
        
        phoneStr = getValue;
        
        details2TableViewCell *cell= (details2TableViewCell *)[releaseTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:5 inSection:0]];
        cell.myDetailLabel.text = getValue;
    }
    //self.navigationItem.rightBarButtonItem.enabled = YES;
}

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 4.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            return 270.0f;
            break;
        case 6:
            return 144.0f;
            break;
        default:
            return 47.0f;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellTableIdentifier=[[NSString alloc] initWithFormat:@"extentedCell%lu",(unsigned long)indexPath.row];
    
    switch (indexPath.row) {
        case 0:
        {
            releaseDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            if (cell == nil) {
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"releaseDetailsTableViewCell" owner:self options:nil] lastObject];
            }
            
            return cell;
            
            break;
        }
        case 1:
        {
            placeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"placeTableViewCell" owner:self options:nil] lastObject];
            }
            
            return cell;
            break;
        }
        case 2:
        {
            detailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"detailsTableViewCell" owner:self options:nil] lastObject];
            }
            
            cell.timeTitleLabel.text = @"时间";
            cell.statusLabel.text = @"开始";
            cell.timeLabel.text = startTimeStr;
            
            return cell;
            break;
        }
        case 3:
        {
            
            detailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"detailsTableViewCell" owner:self options:nil] lastObject];
            }
            
            cell.timeTitleLabel.hidden = YES;
            cell.statusLabel.text = @"结束";
            cell.timeLabel.text = finishTimeStr;
            
            return cell;
            break;
        }
        case 4:
        {
            details2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"details2TableViewCell" owner:self options:nil] lastObject];
            }
            
            NSString *str = @"￥";
            cell.myTitleLabel.text = @"金额";
            cell.myDetailLabel.text = [str stringByAppendingString:priceStr];
            
            return cell;
            break;
        }
        case 5:
        {
            details2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"details2TableViewCell" owner:self options:nil] lastObject];
            }
            
            cell.myTitleLabel.text = @"电话";
            cell.myDetailLabel.text = phoneStr;
            
            return cell;
            break;
        }
        case 6:
        {
            labelsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell = [[[NSBundle mainBundle] loadNibNamed:@"labelsTableViewCell" owner:self options:nil] lastObject];
            }
            
            return cell;
            break;
        }
        default:
        {
            
            return nil;
            break;
        }
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 1:
        {
            placeViewController *placeVC = [[placeViewController alloc] init];
            placeVC.place = @"杭州小和山";
            
            [self.navigationController pushViewController:placeVC animated:YES];
            break;
        }
        case 4:
        {
            priceViewController *priceVC = [[priceViewController alloc] init];
            priceVC.price = priceStr;
            
            [self.navigationController pushViewController:priceVC animated:YES];
            break;
        }
        case 5:
        {
            phoneViewController *phoneVC = [[phoneViewController alloc] init];
            phoneVC.phone = phoneStr;
            [self.navigationController pushViewController:phoneVC animated:YES];
                        
            break;
        }
        default:
            break;
    }
}

- (void)sendMgs
{
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.delegate = self;
    
    //上传至服务器
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"d6089681f79c7627bbac829307e041a7" forHTTPHeaderField:@"x-timebuy-sid"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    //2.设置登录参数

    NSDictionary *dict = @{ @"userid":[userConfiguration getStringValueForConfigurationKey:@"userId"],
                            @"pic":@"123",
                            @"phone":phoneStr,
                            @"news":@"测试内容",
                            @"starttime":startTimeStr,
                            @"finishtime":finishTimeStr,
                            @"label":@"测试label",
                            @"money":priceStr,
                            @"coordname":placeStr,
                            @"coordx":@"30.124546",
                            @"coordy":@"120.214126"};

    /*
     NSDictionary *dict = @{ @"userId":@"27",
                             @"headIcon":@"123",
                             @"nickName":@"oj",
                             @"sex":@"0",
                             @"birthDay":@"2011-10-2",
                             @"profession":@"123",
                             @"address":@"111",
                             @"phone":@"18767122229",
                             @"signature":@"hello"};
    */
    //3.请求
    [manager GET:@"http://192.168.8.102:8080/timebuy/news/info" parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"GET --> %@", responseObject); //自动返回主线程
        
        [HUD hide:YES];
        NSString *getStatus = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"success"]];
        NSString *getCode = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"code"]];
        if ([getStatus isEqualToString:@"1"] && [getCode isEqualToString:@"1000"]) {
            
            HUDinSuccess = [[MBProgressHUD alloc] initWithView:self.view];
            [self.view addSubview:HUDinSuccess];
            HUDinSuccess.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
            HUDinSuccess.mode = MBProgressHUDModeCustomView;
            HUDinSuccess.delegate = self;
            HUDinSuccess.labelText = @"发布成功";
            [HUDinSuccess show:YES];
            [HUDinSuccess hide:YES afterDelay:1];
            
        } else if ([getStatus isEqualToString:@"0"] && [getCode isEqualToString:@"2005"]) {
            [self showErrorWithTitle:@"发布失败" WithMessage:@"错误"];
        } else {
            [self showErrorWithTitle:@"发布失败" WithMessage:@"系统错误"];
        }
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        [HUD hide:YES];
        [self showErrorWithTitle:@"发布失败" WithMessage:@"网络连接失败，请检查网络设置"];
    }];
}

#pragma mark - MBProgressHUDDelegate
- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [hud removeFromSuperview];
    
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
