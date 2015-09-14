//
//  ViewController.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/5.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "homeViewController.h"

@interface homeViewController ()

@end

@implementation homeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    NSLog(@"home view appear");
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    //NSLog(@"lanched = %d",[userConfiguration getBoolValueForConfigurationKey:Launched]);
    //NSLog(@"user = %@",[userConfiguration getStringValueForConfigurationKey:@"userId"]);
    //NSLog(@"in state = %@", getState);
    
    if ([[userConfiguration getStringValueForConfigurationKey:@"userId"] isEqualToString:@""]) {
        if (![getState isEqualToString:@"2"] && ![getState isEqualToString:@"1"]) {
            loginViewController *loginVC = [[loginViewController alloc] init];
            [self.navigationController presentViewController:loginVC animated:YES completion:nil];
        }
    }
    
    [userConfiguration setApplicationStartupDefaults];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    //在info.plist Set UIViewControllerBasedStatusBarAppearance to NO.
    
    /*
    //清空本地数据
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = [defaults dictionaryRepresentation];
    for (id key in dict) {
        [defaults removeObjectForKey:key];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    */
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    /*
    //设置顶部bar的颜色(在storyboard中设置的key设置为：navigationController.navigationBar.barTintColor)
    UIColor * barColor = [UIColor
                          colorWithRed:48.0/255.0
                          green:47.0/255.0
                          blue:52.0/255.0
                          alpha:1.0];
    [self.navigationController.navigationBar setBarTintColor:barColor];
    */
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"导航条375x64"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.translucent = NO;
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 42, 20)];
    /*
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    title.text = @"TimeBuy";
    title.font = [UIFont fontWithName:@"Heiti SC" size:20.0f];
    title.textColor = [UIColor whiteColor];
    title.textAlignment = NSTextAlignmentCenter;
    [titleView addSubview:title];
    */
    UIImageView *logoImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 42, 20)];
    logoImgView.image = [UIImage imageNamed:@"导航字体"];
    [titleView addSubview:logoImgView];
    [self.navigationItem setTitleView:titleView];
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    __weak __typeof(self) weakSelf = self;
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
    }];
    
    // 马上进入刷新状态
    //[self.tableView.heade r beginRefreshing];
    //NSLog(@"witdth = %f;height = %f",self.view.bounds.size.width,self.view.bounds.size.height);
    [SlideNavigationController sharedInstance].enableShadow = NO;
    
    float offset = self.view.bounds.size.width;
    [SlideNavigationController sharedInstance].portraitSlideOffset = offset - 249.0f;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recState:) name:@"passState" object:nil];
    
}

- (void)recState:(NSNotification *)notification {
    NSDictionary *getDic = [notification userInfo];
    getState = [getDic objectForKey:@"state"];
    
    NSLog(@"get state = %@", getState);
    
    switch ([getState integerValue]) {
        case 0:
        {
            
        }
            break;
            
        case 1:
        {
            forgetPwdViewController *forgetPwdVC = [[forgetPwdViewController alloc] init];
            [self.navigationController presentViewController:forgetPwdVC animated:YES completion:nil];
            break;
        }
        case 2:
        {
            registerViewController *registerVC = [[registerViewController alloc] init];
            [self.navigationController presentViewController:registerVC animated:YES completion:nil];
            break;
        }
        case 4:
        {
            
            loginViewController *loginVC = [[loginViewController alloc] init];
            [self.navigationController presentViewController:loginVC animated:NO completion:nil];
            break;
        }
        default:
            break;
    }
    
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return YES;
}

#pragma mark - 数据处理相关
#pragma mark 下拉刷新数据
- (void)loadNewData
{
    NSLog(@"下拉");
    //结束刷新
    [_tableView.header endRefreshing];
}

#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case HomeTableViewRowTypeSlide:
            return 188.f;
            break;
        case HomeTableViewRowTypeCatagory:
            return 112.0f;
            break;
        default:
            return 277.0f;
            break;
    }
    
    return 0.0;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0f;
}

/*
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == HomeTableViewSectionTypeCatagory) {
        UITableViewCell *sectionCell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 80)];
        sectionCell.backgroundColor = [UIColor whiteColor];
        //sectionCell.alpha = 0.8f;
        //sectionCell.textLabel.text = @"偏好选择";
        //sectionCell.textLabel.textColor = [UIColor blackColor];
        sectionCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIImageView *iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 25, 25)];
        iconImgView.image = [UIImage imageNamed:@"跑图标1"];
        [sectionCell addSubview:iconImgView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 10, 240, 25)];
        titleLabel.text = @"跑腿 | 勤劳的小蜜蜂";
        titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.0f];
        titleLabel.textColor = [UIColor blackColor];
        [sectionCell addSubview:titleLabel];
        
        NSString *str = @"如果你想强壮，跑步吧！如果你想健美，跑步吧！\n如果你想聪明，跑步吧！";
        
        UILabel *subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 32, 300, 50)];
        subTitleLabel.text = str;
        subTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        subTitleLabel.numberOfLines = 0;
        subTitleLabel.font = [UIFont systemFontOfSize:12.0f];
        subTitleLabel.textColor = [UIColor darkGrayColor];
        [sectionCell addSubview:subTitleLabel];
        
        UILabel *releaseLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 80, 80, 100, 20)];
        releaseLabel.text = @"已发布230条";
        releaseLabel.textColor = [UIColor darkGrayColor];
        releaseLabel.font = [UIFont systemFontOfSize:11.0f];
        [sectionCell addSubview:releaseLabel];
        
        return sectionCell;
    }
    
    return nil;
}
*/
-(void)help
{
    getHelpViewController *vc=[[getHelpViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];

}
-(void)deal
{
    getDealViewController *vc=[[getDealViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row=[indexPath row];
    
    //需要对每个cell进行标识，不然刷新会有问题
    NSString *CellTableIdentifier=[[NSString alloc]initWithFormat:@"extentedCell%lu-%lu",(unsigned long)indexPath.section,(unsigned long)row];
    
    switch (indexPath.row) {
        case HomeTableViewRowTypeSlide:
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            if (cell == nil) {
                
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
                
            }
            
            //自动推送图片
            JScrollView_PageControl_AutoScroll *view = [[JScrollView_PageControl_AutoScroll alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 188)];
            view.autoScrollDelayTime = 5.0f;
            view.delegate = self;
            
            UIImageView *pageImgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 188)];
            pageImgView1.image = [UIImage imageNamed:@"推送.png"];
            
            UIImageView *pageImgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 188)];
            pageImgView2.image = [UIImage imageNamed:@"zisu10.1.png"];
            
            UIImageView *pageImgView3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 188)];
            pageImgView3.image = [UIImage imageNamed:@"3首页-07.jpg"];
            
            NSMutableArray *viewsArray = [[NSMutableArray alloc] initWithObjects:pageImgView3,pageImgView1,pageImgView2, nil];
            [view setViewsArray:viewsArray];
            
            [cell addSubview:view];
            [view shouldAutoShow:YES];
            
            return cell;
            break;
        }
        case HomeTableViewRowTypeCatagory:
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            if (cell == nil) {
                
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
            }
            
            cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
            
            UIView *catagoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, self.view.bounds.size.width, 102)];
            catagoryView.backgroundColor = [UIColor whiteColor];
            [cell addSubview:catagoryView];
            
            NSArray *logoImageName = [[NSArray alloc] initWithObjects:@"qiuzhu",@"组局(1)",@"paotui",@"gongyi", nil];
            NSArray *logoTitle = [[NSArray alloc] initWithObjects:@"求助",@"组局",@"跑腿",@"公益", nil];
            
            for (int i = 0; i < 4 ; i++) {
                UIButton *logoButton = [[UIButton alloc] initWithFrame:CGRectMake(23 + i * (50 + 43), 13, 50, 50)];
                [logoButton setImage:[UIImage imageNamed:[logoImageName objectAtIndex:i]] forState:UIControlStateNormal];
                [catagoryView addSubview:logoButton];
                
                UILabel *logoLabel = [[UILabel alloc] initWithFrame:CGRectMake(32 + i * (34 +59), 71, 34, 18)];
                logoLabel.text = [logoTitle objectAtIndex:i];
                logoLabel.font = [UIFont systemFontOfSize:17.0f];
                if(i==0)
                {
                    [logoButton addTarget:self
                                action:@selector(help)
                      forControlEvents:UIControlEventTouchUpInside
                     ];
                }
                else if(i==2)
                {
                    [logoButton addTarget:self
                                   action:@selector(deal)
                         forControlEvents:UIControlEventTouchUpInside
                     ];

                }
                [catagoryView addSubview:logoLabel];
            }
            
            return cell;
            break;
        }
            
        default:
        {
            NSString *CellTableIdentifier=[[NSString alloc]initWithFormat:@"extentedCell%lu-%lu",(unsigned long)indexPath.section,(unsigned long)row];
            homeDetailsTableViewCell *cell = (homeDetailsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            
            if (cell == nil) {
                
                cell.contentView.frame = cell.bounds;
                cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                
                cell = [[[NSBundle mainBundle] loadNibNamed:@"homeDetailsTableViewCell" owner:self options:nil] lastObject];
            }
            
            //cell.nameLabel.text = @"123";
            cell.portraitImgView.layer.masksToBounds = YES;
            cell.portraitImgView.layer.cornerRadius = cell.portraitImgView.bounds.size.height / 2;
            
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            return cell;
            
            break;
        }
    }
    
    /*
    switch (indexPath.section) {
        case HomeTableViewSectionTypeSlide:
        {
            //需要对每个cell进行标识，不然刷新会有问题
            NSString *CellTableIdentifier=[[NSString alloc]initWithFormat:@"extentedCell%lu-%lu",(unsigned long)indexPath.section,(unsigned long)row];
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            if (cell == nil) {
                
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
                
            }
            
            //自动推送图片
            JScrollView_PageControl_AutoScroll *view = [[JScrollView_PageControl_AutoScroll alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 158)];
            view.autoScrollDelayTime = 6.0f;
            view.delegate = self;
            
            UIImageView *pageImgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 158)];
            pageImgView1.image = [UIImage imageNamed:@"倔匠1.png"];
            
            UIImageView *pageImgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 158)];
            pageImgView2.image = [UIImage imageNamed:@"周杰伦.png"];
            
            NSMutableArray *viewsArray = [[NSMutableArray alloc] initWithObjects:pageImgView1,pageImgView2, nil];
            [view setViewsArray:viewsArray];
            
            [cell addSubview:view];
            [view shouldAutoShow:YES];
            
            return cell;
        }
        case HomeTableViewSectionTypeCatagory:
        {
            
            // row attribute
            if (indexPath.row == 0) {
                // 分类信息
                UIView *catagoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 90)];
                catagoryView.backgroundColor = [UIColor blackColor];
                
                NSString *CellTableIdentifier=[[NSString alloc]initWithFormat:@"extentedCell%lu-%lu",(unsigned long)indexPath.section,(unsigned long)row];
                
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
                
                if (!cell) {
                    
                    [cell addSubview:catagoryView];
                    
                }
                
                return cell;
                
            } else {
                NSString *CellTableIdentifier=[[NSString alloc]initWithFormat:@"extentedCell%lu-%lu",(unsigned long)indexPath.section,(unsigned long)row];
                homeDetailsTableViewCell *cell = (homeDetailsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
                
                if (cell == nil) {
                    
                    cell.contentView.frame = cell.bounds;
                    cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
                    
                    cell = [[[NSBundle mainBundle] loadNibNamed:@"homeDetailsTableViewCell" owner:self options:nil] lastObject];
                }
                
                //cell.nameLabel.text = @"123";
                
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                
                return cell;
            }
            
        }
        default:
            return nil;
    }
    */
    
    return nil;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //testViewController *testVC = [[testViewController alloc] init];
    //[self.navigationController pushViewController:testVC animated:YES];
    switch (indexPath.row) {
        case 2:
        {
            showDetailsViewController *showDetailsVC=[[showDetailsViewController alloc]init];
            [self.navigationController pushViewController:showDetailsVC animated:YES];
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

@end
