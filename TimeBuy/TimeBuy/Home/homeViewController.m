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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    //在info.plist Set UIViewControllerBasedStatusBarAppearance to NO.
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    //设置顶部bar的颜色(在storyboard中设置的key设置为：navigationController.navigationBar.barTintColor)
    UIColor * barColor = [UIColor
                          colorWithRed:48.0/255.0
                          green:47.0/255.0
                          blue:52.0/255.0
                          alpha:1.0];
    [self.navigationController.navigationBar setBarTintColor:barColor];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    title.text = @"TimeBuy";
    title.font = [UIFont fontWithName:@"Heiti SC" size:20.0f];
    title.textColor = [UIColor whiteColor];
    title.textAlignment = NSTextAlignmentCenter;
    [titleView addSubview:title];
    [self.navigationItem setTitleView:titleView];
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    /*
    UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [button setImage:[UIImage imageNamed:@"个人设置1"] forState:UIControlStateNormal];
    [button addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleLeftMenu) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [SlideNavigationController sharedInstance].leftBarButtonItem = leftBarButtonItem;
    
    UIButton *button2  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 45)];
    [button2 setImage:[UIImage imageNamed:@"附近的人1"] forState:UIControlStateNormal];
    [button2 addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleRightMenu) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button2];
    [SlideNavigationController sharedInstance].rightBarButtonItem = rightBarButtonItem;
    */
    
    __weak __typeof(self) weakSelf = self;
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
    }];
    
    // 马上进入刷新状态
    //[self.tableView.header beginRefreshing];
    //NSLog(@"witdth = %f;height = %f",self.view.bounds.size.width,self.view.bounds.size.height);
    [SlideNavigationController sharedInstance].enableShadow = NO;
    
    float offset = self.view.bounds.size.width;
    [SlideNavigationController sharedInstance].portraitSlideOffset = offset - 260.0f;
    
    
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case HomeTableViewSectionTypeSlide:
            return 1;
        case HomeTableViewSectionTypeCatagory:
            return 20;
        default:
            return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case HomeTableViewSectionTypeSlide:
            return 200.0f;
        case HomeTableViewSectionTypeCatagory:
            return 90.0f;
        default:
            return 0.0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case HomeTableViewSectionTypeSlide:
            return 0.0f;
        case HomeTableViewSectionTypeCatagory:
            return 110.0f;
        default:
            return 0.0;
    }
}

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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row=[indexPath row];
    
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
            JScrollView_PageControl_AutoScroll *view = [[JScrollView_PageControl_AutoScroll alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
            view.autoScrollDelayTime = 6.0f;
            view.delegate = self;
            
            UIImageView *pageImgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
            pageImgView1.image = [UIImage imageNamed:@"推送.png"];
            
            UIImageView *pageImgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
            pageImgView2.image = [UIImage imageNamed:@"周杰伦.png"];
            
            NSMutableArray *viewsArray = [[NSMutableArray alloc] initWithObjects:pageImgView1,pageImgView2, nil];
            [view setViewsArray:viewsArray];
            
            [cell addSubview:view];
            [view shouldAutoShow:YES];
            
            return cell;
        }
        case HomeTableViewSectionTypeCatagory:
        {
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
            
            /*
            UIImageView *portraitImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 100, 83)];
            portraitImgView.image = [UIImage imageNamed:@"周杰伦"];
            [cell addSubview:portraitImgView];
            
            UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(125, 0, 80, 20)];
            nameLabel.text = @"周老师";
            nameLabel.font = [UIFont systemFontOfSize:12.0f];
            nameLabel.textColor = [UIColor colorWithRed:77.0f / 255.0f green:100.0f / 255.0f blue:138.0f / 255.0f alpha:1];
            [cell addSubview:nameLabel];
            
            UIImageView *likeImgView = [[UIImageView alloc] initWithFrame:CGRectMake(170, 5, 10, 10)];
            likeImgView.image = [UIImage imageNamed:@"爱心1"];
            [cell addSubview:likeImgView];
            UILabel *likeLabel = [[UILabel alloc] initWithFrame:CGRectMake(183, 2, 30, 15)];
            likeLabel.text = @"14";
            likeLabel.font = [UIFont systemFontOfSize:12.0f];
            likeLabel.textColor = [UIColor colorWithRed:231.0f / 255.0f green:154.0f / 255.0f blue:154.0f / 255.0f alpha:1];
            [cell addSubview:likeLabel];
            
            UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectMake(203, 2, 50, 15)];
            numLabel.text = @"约 12";
            numLabel.font = [UIFont systemFontOfSize:12.0f];
            numLabel.textColor = [UIColor colorWithRed:168.0f / 255.0f green:227.0f / 255.0f blue:243.0f / 255.0f alpha:1];
            [cell addSubview:numLabel];
            
            UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 60, 2, 80, 15)];
            timeLabel.text = @"1分钟前";
            timeLabel.font = [UIFont systemFontOfSize:12.0f];
            timeLabel.textColor = [UIColor darkGrayColor];
            [cell addSubview:timeLabel];
            
            return cell;
            */
            
        }
        default:
            return nil;
    }
    
    //cell.textLabel.text = @"Hello";
    return nil;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
