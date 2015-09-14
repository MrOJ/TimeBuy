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
 //   [self.dealData removeAllObjects];
   // [self.data removeAllObjects];
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
    //[self.responseData removeAllObjects];
    //[self.data removeAllObjects];
    self.responseData=[[NSMutableArray alloc]init];
    NSMutableDictionary *s1=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"小哥",@"name",@"高挺.png",@"picture",@"你响应了小哥的任务",@"neirong" ,@"2015年10月1号8时5分",@"time",nil];
    NSMutableDictionary *s2=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"小宣",@"name",@"portrait.png",@"picture",@"你响应了小宣的任务",@"neirong",@"2015年10月1号8时5分",@"time",nil];
    self.responseData=[[NSMutableArray alloc]initWithObjects:s1,s2, nil];
    self.data=[[NSMutableArray alloc]initWithArray:self.responseData];
}
//tableview 动态添加我的收藏数据
-(void)createFavoriteDataTableviewData
{
    //[self.favoriteData removeAllObjects];
    //[self.data removeAllObjects];
    self.favoriteData=[[NSMutableArray alloc]init];
    NSMutableDictionary *s1=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"小余",@"name",@"高挺.png",@"picture",@"骑单车 去赏花",@"neirong" ,@"3分钟前",@"time",@"7:30~8:00/ ￥5",@"get",@"来自浙江外国语学院",@"where",@"showImg3.png,showImg3.png",@"NRPIC",nil];
    NSMutableDictionary *s2=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"小猫",@"name",@"portrait.png",@"picture",@"骑单车 去赏花",@"neirong" ,@"8分钟前",@"time",@"7:30~8:00/ ￥5",@"get",@"来自浙江外国语学院",@"where",@"showImg3.png",@"NRPIC",nil];
    self.favoriteData=[[NSMutableArray alloc]initWithObjects:s1,s2, nil];
    self.data=[[NSMutableArray alloc]initWithArray:self.favoriteData];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置navigationcontrol颜色和字体
    self.x=0;
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
        self.dataTableview.rowHeight=65;
        [self.dataTableview reloadData];
        
    }
    else if(self.segmentControl.selectedSegmentIndex==1)
    {
        NSLog(@"press 2");
        [self createResponseTableviewData];
        self.dataTableview.rowHeight=65;
        [self.dataTableview reloadData];


    }
    else if(self.segmentControl.selectedSegmentIndex==2)
    {
        NSLog(@"press 3");
        [self createFavoriteDataTableviewData];
        self.dataTableview.rowHeight=175;
        [self.dataTableview reloadData];

    }
    else{
        NSLog(@"nil");
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.segmentControl.selectedSegmentIndex==0)
    {
        detailHistoryViewController *showDetailsVC=[[detailHistoryViewController alloc]init];
        [self.navigationController pushViewController:showDetailsVC animated:YES];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
}
//设置tableviewcell的样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.x++;
    //我的收藏
    if(tableView==self.dataTableview && self.segmentControl.selectedSegmentIndex==2  && [self.data objectAtIndex:indexPath.row]!=nil)
    {
        NSString *CellIdentifier =[NSString stringWithFormat:@"Cell%ld",(long)self.x] ;
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        // Configure the cell.
        cell.backgroundColor=[UIColor whiteColor];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        
        //添加名字
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake( 51, 9, 124, 12)];
        label1.textColor=[UIColor blackColor];
        label1.font=[UIFont fontWithName:@"Heiti SC" size:12];
        [label1 setText:[[self.data objectAtIndex:indexPath.row]objectForKey:@"name"]];
        [cell.contentView addSubview:label1];
        //添加时间标签
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake( 51, 22, 108, 11)];
        label2.textColor=[UIColor lightGrayColor];
        label2.font=[UIFont fontWithName:@"Heiti SC" size:11];
        [label2 setText:[[self.data objectAtIndex:indexPath.row]objectForKey:@"time"]];
        [cell.contentView addSubview:label2];
        //添加时间轴和价格
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(276,12,100,11)];
        label3.textColor=[UIColor colorWithRed:216.f/255 green:150.f/255 blue:127.f/255 alpha:100];
        label3.font=[UIFont fontWithName:@"Heiti SC" size:11];
        //label3.textAlignment= NSTextAlignmentRight;
        [label3 setText:[[self.data objectAtIndex:indexPath.row]objectForKey:@"get"]];
        [cell.contentView addSubview:label3];
        //添加任务
        UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(14,132,215,14)];
        //label4.textColor=[UIColor lightGrayColor];
        label4.font=[UIFont fontWithName:@"Heiti SC"size:14];
        [label4 setText:[[self.data objectAtIndex:indexPath.row]objectForKey:@"neirong"]];
        [cell.contentView addSubview:label4];
        //添加地点
        UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(29,152, 215, 13)];
        label5.textColor=[UIColor colorWithRed:80.f/255 green:227.f/255 blue:194.f/255 alpha:100];
        label5.font=[UIFont fontWithName:@"Heiti SC" size:13];
        [label5 setText:[[self.data objectAtIndex:indexPath.row]objectForKey:@"where"]];
        [cell.contentView addSubview:label5];
        //添加头像image
        UIImageView *image=[[UIImageView alloc]init];
        image.frame=CGRectMake(15, 7, 30, 30);
        image.layer.masksToBounds=true;
        image.layer.cornerRadius=15;
        [image setImage:[UIImage imageNamed:[[self.data objectAtIndex:indexPath.row]objectForKey:@"picture"]]];
        [cell.contentView addSubview:image];
        //添加地点image
        UIImageView *image2=[[UIImageView alloc]init];
        image2.frame=CGRectMake(14, 151, 14, 14);
        image2.layer.masksToBounds=true;
        [image2 setImage:[UIImage imageNamed:@"dingwei1.png"]];
        [cell.contentView addSubview:image2];
        
        //添加内容image
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 43, 375, 85)];
        NSString *images=[[self.data objectAtIndex:indexPath.row]objectForKey:@"NRPIC"];
        NSMutableArray *arr1 = [[images componentsSeparatedByString:@","] mutableCopy];
        for(int i=0;i<[arr1 count] && i<3;i++){
            UIImageView *image3=[[UIImageView alloc]init];
            image3.frame=CGRectMake(14+(i*113), 0, 109, 85);
            image3.layer.masksToBounds=true;
            [image3 setImage:[UIImage imageNamed:arr1[i]]];
            [view addSubview:image3];
        }
        [cell.contentView addSubview:view];
        return cell;
        
    }
    //响应记录
    else if(tableView==self.dataTableview && self.segmentControl.selectedSegmentIndex==1  && [self.data objectAtIndex:indexPath.row]!=nil)
    {
        NSString *CellIdentifier =[NSString stringWithFormat:@"Cell%ld",(long)self.x] ;
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        /*else
         {
         //清楚cell中原有的控件缓存
         NSArray *subviews = [[NSArray alloc] initWithArray:cell.contentView.subviews];
         for (UIView *subview in subviews) {
         [subview removeFromSuperview];
         }
         }*/
        // Configure the cell.
        cell.backgroundColor=[UIColor whiteColor];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        
        //添加名字
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake( 64, 10, 300, 19)];
        label1.textColor=[UIColor blackColor];
        label1.font=[UIFont fontWithName:@"Heiti SC"size:18];
        [label1 setText:[[self.data objectAtIndex:indexPath.row]objectForKey:@"name"]];
        [cell.contentView addSubview:label1];
        //添加完成任务
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake( 64, 40, 300, 14)];
        label2.textColor=[UIColor lightGrayColor];
        label2.font=[UIFont fontWithName:@"Heiti SC" size:14];
        [label2 setText:[[self.data objectAtIndex:indexPath.row]objectForKey:@"neirong"]];
        [cell.contentView addSubview:label2];
        //添加日期label
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake( 153, 10, 215, 13)];
        label3.textColor=[UIColor lightGrayColor];
        label3.font=[UIFont fontWithName:@"Heiti SC" size:13];
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
    //交易记录
    else if(tableView==self.dataTableview && self.segmentControl.selectedSegmentIndex==0  && [self.data objectAtIndex:indexPath.row]!=nil)
    {
        NSString *CellIdentifier =[NSString stringWithFormat:@"Cell%ld",(long)self.x] ;
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        /*else
        {
            //清楚cell中原有的控件缓存
            NSArray *subviews = [[NSArray alloc] initWithArray:cell.contentView.subviews];
            for (UIView *subview in subviews) {
                [subview removeFromSuperview];
            }
        }*/
        // Configure the cell.
        cell.backgroundColor=[UIColor whiteColor];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        
        //添加名字
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake( 64, 10, 300, 19)];
        label1.textColor=[UIColor blackColor];
        label1.font=[UIFont fontWithName:@"Heiti SC"size:18];
        [label1 setText:[[self.data objectAtIndex:indexPath.row]objectForKey:@"name"]];
        [cell.contentView addSubview:label1];
        //添加完成任务
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake( 64, 40, 300, 14)];
        label2.textColor=[UIColor lightGrayColor];
        label2.font=[UIFont fontWithName:@"Heiti SC" size:14];
        [label2 setText:[[self.data objectAtIndex:indexPath.row]objectForKey:@"neirong"]];
        [cell.contentView addSubview:label2];
        //添加日期label
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake( 153, 10, 215, 13)];
        label3.textColor=[UIColor lightGrayColor];
        label3.font=[UIFont fontWithName:@"Heiti SC" size:13];
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
