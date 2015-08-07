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

@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    //在info.plist Set UIViewControllerBasedStatusBarAppearance to NO.
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    UITapGestureRecognizer * doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    [doubleTap setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer * twoFingerDoubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerDoubleTap:)];
    [twoFingerDoubleTap setNumberOfTapsRequired:2];
    [twoFingerDoubleTap setNumberOfTouchesRequired:2];
    [self.view addGestureRecognizer:twoFingerDoubleTap];
    
    
    [self setupLeftMenuButton];
    [self setupRightMenuButton];
    
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
    
    __weak __typeof(self) weakSelf = self;
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
    }];
    
    // 马上进入刷新状态
    //[self.tableView.header beginRefreshing];
    NSLog(@"witdth = %f;height = %f",self.view.bounds.size.width,self.view.bounds.size.height);
    
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
            return 100.0f;
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
        
        UILabel *releaseLabel = [[UILabel alloc] initWithFrame:CGRectMake(sectionCell.bounds.size.width - 54, 80, 100, 20)];
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
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    //此处有bug
    switch (indexPath.section) {
        case HomeTableViewSectionTypeSlide:
        {
            UIImageView *pageImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
            pageImgView.image = [UIImage imageNamed:@"倔匠1.png"];
            [cell addSubview:pageImgView];
            return cell;
        }
        case HomeTableViewSectionTypeCatagory:
        {
            UIImageView *portraitImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 100, 83)];
            portraitImgView.image = [UIImage imageNamed:@"周杰伦"];
            [cell addSubview:portraitImgView];
            
            
            
            return cell;
        }
        default:
            break;
    }
    
    //cell.textLabel.text = @"Hello";
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - Button Handlers
-(void)setupLeftMenuButton{
    /*
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
    */
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    UIButton *button = [[UIButton alloc] initWithFrame:contentView.bounds];
    [button setBackgroundImage:[UIImage imageNamed:@"个人设置1"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(leftDrawerButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:button];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:contentView];
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

-(void)setupRightMenuButton{
    /*
    MMDrawerBarButtonItem * rightDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(rightDrawerButtonPress:)];
    [self.navigationItem setRightBarButtonItem:rightDrawerButton animated:YES];
    */
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 25)];
    UIButton *button = [[UIButton alloc] initWithFrame:contentView.bounds];
    [button setBackgroundImage:[UIImage imageNamed:@"附近的人1"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightDrawerButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:button];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:contentView];
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

#pragma mark - Button Handlers
-(void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

-(void)rightDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

-(void)doubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideLeft completion:nil];
}

-(void)twoFingerDoubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideRight completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
