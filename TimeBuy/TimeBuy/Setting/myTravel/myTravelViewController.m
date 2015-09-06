//
//  footTransactionViewController.m
//  TimeBuy
//
//  Created by yuweize on 15/8/31.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "myTravelViewController.h"

@interface myTravelViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UITableView *dataTableview;

@end

@implementation myTravelViewController
//tableview 动态添加交易记录数据
-(void)createDealTableviewData
{
    [self.dealData removeAllObjects];
    [self.data removeAllObjects];
    self.dealData=[[NSMutableArray alloc]init];
    NSMutableDictionary *s1=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"小刚",@"name",@"高挺.png",@"picture",@"你完成了小刚的任务",@"neirong" ,@"2015年10月1号8时5分",@"time",nil];
    NSMutableDictionary *s2=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"余维泽",@"name",@"portrait.png",@"picture",@"你完成了余维泽的任务",@"neirong",@"2015年10月1号8时5分",@"time",nil];
    self.dealData=[[NSMutableArray alloc]initWithObjects:s1,s2, nil];
    [self.dealData addObject:s1];
    [self.dealData addObject:s1];
    [self.dealData addObject:s1];
    [self.dealData addObject:s1];
    [self.dealData addObject:s1];
    [self.dealData addObject:s1];
    [self.dealData addObject:s1];
    [self.dealData addObject:s1];
    [self.dealData addObject:s1];
    [self.dealData addObject:s1];
    [self.dealData addObject:s1];
    [self.dealData addObject:s1];
    [self.dealData addObject:s1];
    [self.dealData addObject:s1];
    [self.dealData addObject:s1];
    self.data=[[NSMutableArray alloc]initWithArray:self.dealData];
}
//tableview 动态添加响应数据
-(void)createResponseTableviewData
{
    [self.responseData removeAllObjects];
    [self.data removeAllObjects];
    self.responseData=[[NSMutableArray alloc]init];
    NSMutableDictionary *s1=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"小余",@"name",@"高挺.png",@"picture",@"你完成了小余的任务",@"neirong" ,@"2015年10月1号8时5分",@"time",nil];
    NSMutableDictionary *s2=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"小猫",@"name",@"portrait.png",@"picture",@"你完成了小猫的任务",@"neirong",@"2015年10月1号8时5分",@"time",nil];
    self.responseData=[[NSMutableArray alloc]initWithObjects:s1,s2, nil];
    self.data=[[NSMutableArray alloc]initWithArray:self.responseData];
}
//tableview 动态添加我的收藏数据
-(void)createFavoriteDataTableviewData
{
    [self.favoriteData removeAllObjects];
    [self.data removeAllObjects];
    self.favoriteData=[[NSMutableArray alloc]init];
    NSMutableDictionary *s1=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"小哥",@"name",@"高挺.png",@"picture",@"你响应了小哥的任务",@"neirong" ,@"2015年10月1号8时5分",@"time",nil];
    NSMutableDictionary *s2=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"小宣",@"name",@"portrait.png",@"picture",@"你响应了小宣的任务",@"neirong",@"2015年10月1号8时5分",@"time",nil];
    self.favoriteData=[[NSMutableArray alloc]initWithObjects:s1,s2, nil];
    self.data=[[NSMutableArray alloc]initWithArray:self.favoriteData];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置navigationcontrol颜色和字体
    
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:24.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"我的足迹";
    //配置dataview
    self.dataTableview.delegate=self;
    self.dataTableview.dataSource=self;
    self.segmentControl.selectedSegmentIndex=0;
    [self pressdown:self];
    self.dataTableview.scrollEnabled=YES;
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)pressdown:(id)sender {
    if(self.segmentControl.selectedSegmentIndex==0)
    {
        NSLog(@"press 1");
        [self createDealTableviewData];
        [self.dataTableview reloadData];
        
    }
    else if(self.segmentControl.selectedSegmentIndex==1)
    {
        NSLog(@"press 2");
        [self createResponseTableviewData];
        [self.dataTableview reloadData];


    }
    else if(self.segmentControl.selectedSegmentIndex==2)
    {
        NSLog(@"press 3");
        [self createFavoriteDataTableviewData];
        [self.dataTableview reloadData];

    }
    else{
        NSLog(@"nil");
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
}
//设置tableviewcell的样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView==self.dataTableview && [self.data objectAtIndex:indexPath.row]!=nil)
    {
        NSLog(@"in");
        static NSString *CellIdentifier = @"Cell1";
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
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake( 64, 10, 300, 19)];
        label1.textColor=[UIColor blackColor];
        label1.font=[UIFont fontWithName:@"Arial" size:18];
        [label1 setText:[[self.data objectAtIndex:indexPath.row]objectForKey:@"name"]];
        [cell.contentView addSubview:label1];
        //添加完成任务
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake( 64, 40, 300, 14)];
        label2.textColor=[UIColor lightGrayColor];
        label2.font=[UIFont fontWithName:@"Arial" size:14];
        [label2 setText:[[self.data objectAtIndex:indexPath.row]objectForKey:@"neirong"]];
        [cell.contentView addSubview:label2];
        //添加日期label
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake( 153, 10, 215, 13)];
        label3.textColor=[UIColor lightGrayColor];
        label3.font=[UIFont fontWithName:@"Arial" size:13];
        label3.textAlignment= NSTextAlignmentRight;
        [label3 setText:[[self.data objectAtIndex:indexPath.row]objectForKey:@"time"]];
        [cell.contentView addSubview:label3];
        //添加image
        UIImageView *image=[[UIImageView alloc]init];
        image.frame=CGRectMake(7, 9, 47, 46);
        image.layer.masksToBounds=true;
        image.layer.cornerRadius=23;
        [image setImage:[UIImage imageNamed:[[self.data objectAtIndex:indexPath.row]objectForKey:@"picture"]]];
        [cell.contentView addSubview:image];
        
        return cell;
        
    }
    return NULL;
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
