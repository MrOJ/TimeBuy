//
//  nearbyViewController.m
//  TimeBuy
//
//  Created by yuweize on 15/9/5.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "nearbyViewController.h"

@interface nearbyViewController ()
@property (weak, nonatomic) IBOutlet UITableView *nearbyTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *nearbySearchBar;

@end

@implementation nearbyViewController
//tableview 动态添加交易记录数据
-(void)createTableviewData
{
    [self.nearbyData removeAllObjects];
    self.nearbyData=[[NSMutableArray alloc]init];
    NSMutableDictionary *s1=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"老王",@"name",@"高挺.png",@"picture",@"我是隔壁老王",@"neirong" ,@"约2.3km",@"long",@"1",@"love",@"23",@"yue",nil];
    NSMutableDictionary *s2=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"王小名",@"name",@"portrait.png",@"picture",@"我是腿脚玛丽的超级马里奥",@"neirong",@"约2.3km/",@"long",@"12",@"love",@"23",@"yue",nil];
    self.nearbyData=[[NSMutableArray alloc]initWithObjects:s1,s2, nil];
    [self.nearbyData addObject:[[NSMutableDictionary alloc]initWithObjectsAndKeys:@"girl",@"name",@"portrait.png",@"picture",@"又要交房租啦！",@"neirong",@"约2.7km",@"long",@"33",@"love",@"23",@"yue",nil]];
    [self.nearbyData addObject:s1];
    [self.nearbyData addObject:s1];
    [self.nearbyData addObject:s1];
    [self.nearbyData addObject:s1];
    [self.nearbyData addObject:s1];
    [self.nearbyData addObject:s1];
    [self.nearbyData addObject:s1];
    [self.nearbyData addObject:s1];
    [self.nearbyData addObject:s1];
    [self.nearbyData addObject:s1];
    [self.nearbyData addObject:s1];

}
//搜索方法
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;{
    NSString *text=self.nearbySearchBar.text;
    NSLog(@"%@",text);
    [self.nearbyTableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    //float offset = self.view.bounds.size.width;
    //[SlideNavigationController sharedInstance].portraitSlideOffset = 0.0f;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:24.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"附近的人";
    [self.nearbySearchBar setContentMode:UIViewContentModeCenter];
    //配置dataview
    self.nearbyTableView.delegate=self;
    self.nearbyTableView.dataSource=self;
    self.nearbyTableView.scrollEnabled=YES;
    [self createTableviewData];
    // Do any additional setup after loading the view from its nib.
}
//cell动态创建
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.nearbyData count];
}
//设置tableviewcell的样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView==self.nearbyTableView && [self.nearbyData objectAtIndex:indexPath.row]!=nil)
    {
        static NSString *CellIdentifier = @"Cell3";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        else
        {
            //清楚cell中原有的控件缓存
            NSArray *subviews = [[NSArray alloc] initWithArray:cell.contentView.subviews];
            for (UIView *subview in subviews) {
                [subview removeFromSuperview];
            }
        }
        // Configure the cell.
        cell.backgroundColor=[UIColor whiteColor];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        //添加名字
        UIView *first=[[UIView alloc]initWithFrame:CGRectMake(64, 9, 300, 19)];
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 300, 19)];
        label1.textColor=[UIColor blackColor];
        label1.font=[UIFont fontWithName:@"Arial" size:18];
        [label1 setText:[[self.nearbyData objectAtIndex:indexPath.row]objectForKey:@"name"]];
        [label1 sizeToFit];
        [first addSubview:label1];
        UIImageView *ai=[[UIImageView alloc]init];
        ai.frame=CGRectMake(label1.frame.size.width+3, 4, 12, 11);
        [ai setImage:[UIImage imageNamed:@"爱心1.png"]];
        [first addSubview:ai];
        UILabel *love = [[UILabel alloc] initWithFrame:CGRectMake( ai.frame.origin.x+14, 4, 30, 12)];
        love.textColor=[UIColor blackColor];
        love.font=[UIFont fontWithName:@"Arial" size:12];
        [love setText:[[self.nearbyData objectAtIndex:indexPath.row]objectForKey:@"love"]];
        [love sizeToFit];
        [first addSubview:love];
        UILabel *yue = [[UILabel alloc] initWithFrame:CGRectMake( love.frame.origin.x+love.frame.size.width+2, 4, 30, 19)];
        yue.textColor=[UIColor blackColor];
        yue.font=[UIFont fontWithName:@"Arial" size:12];
        [yue setText:@"约"];
        [yue sizeToFit];
        [first addSubview:yue];
        UILabel *yue2 = [[UILabel alloc] initWithFrame:CGRectMake( yue.frame.origin.x+yue.frame.size.width+2, 4, 30, 19)];
        yue2.textColor=[UIColor blackColor];
        yue2.font=[UIFont fontWithName:@"Arial" size:12];
        [yue2 setText:[[self.nearbyData objectAtIndex:indexPath.row]objectForKey:@"yue"]];
        [yue2 sizeToFit];
        [first addSubview:yue2];
        [cell.contentView addSubview:first];
        //添加完成任务
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake( 64, 41, 300, 14)];
        label2.textColor=[UIColor lightGrayColor];
        label2.font=[UIFont fontWithName:@"Arial" size:14];
        [label2 setText:[[self.nearbyData objectAtIndex:indexPath.row]objectForKey:@"neirong"]];
        [cell.contentView addSubview:label2];
        //添加日期label
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake( 270, 10, 97, 13)];
        label3.textColor=[UIColor lightGrayColor];
        label3.font=[UIFont fontWithName:@"Arial" size:13];
        label3.textAlignment=NSTextAlignmentRight;
        [label3 setText:[[self.nearbyData objectAtIndex:indexPath.row]objectForKey:@"long"]];
        [cell.contentView addSubview:label3];
        //添加image
        UIImageView *image=[[UIImageView alloc]init];
        image.frame=CGRectMake(7, 9, 47, 46);
        image.layer.masksToBounds=true;
        image.layer.cornerRadius=23;
        [image setImage:[UIImage imageNamed:[[self.nearbyData objectAtIndex:indexPath.row]objectForKey:@"picture"]]];
        [cell.contentView addSubview:image];
        return cell;
    }
    return nil;
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
