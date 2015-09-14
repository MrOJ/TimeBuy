//
//  messageViewController.m
//  TimeBuy
//
//  Created by yuweize on 15/9/3.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "messageViewController.h"

@interface messageViewController ()
@property (weak, nonatomic) IBOutlet UITableView *messageTableview;
@property (weak, nonatomic) IBOutlet UISearchBar *messageSearchBar;
@property IBActionSheet  *customIBAS;
@property (strong, nonatomic) IBOutlet UISegmentedControl *buttonEffectSegmentedControl;
@end

@implementation messageViewController
//tableview 动态添加交易记录数据
-(void)createTableviewData
{
    [self.messageData removeAllObjects];
    self.messageData=[[NSMutableArray alloc]init];
    NSMutableDictionary *s1=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"小刚",@"name",@"高挺.png",@"picture",@"你完成了小刚的任务",@"neirong" ,@"约2.3km/9:23",@"time",@"1",@"message",nil];
    NSMutableDictionary *s2=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"余维泽",@"name",@"portrait.png",@"picture",@"你完成了余维泽的任务",@"neirong",@"约2.3km/14:23",@"time",@"12",@"message",nil];
    self.messageData=[[NSMutableArray alloc]initWithObjects:s1,s2, nil];
    [self.messageData addObject:[[NSMutableDictionary alloc]initWithObjectsAndKeys:@"余维泽",@"name",@"portrait.png",@"picture",@"你完成了余维泽的任务",@"neirong",@"约2.7km/9:23",@"time",@"33",@"message",nil]];
    [self.messageData addObject:s1];
    [self.messageData addObject:s1];
    [self.messageData addObject:s1];
    [self.messageData addObject:s1];
    [self.messageData addObject:s1];
    [self.messageData addObject:s1];
    [self.messageData addObject:s1];
    [self.messageData addObject:s1];
    [self.messageData addObject:s1];
    [self.messageData addObject:s1];
    [self.messageData addObject:s1];
    [self.messageData addObject:s1];
    [self.messageData addObject:s1];
    [self.messageData addObject:s1];
    [self.messageData addObject:s1];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:24.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"我的消息";
    [self.messageSearchBar setContentMode:UIViewContentModeCenter];
    //配置dataview
    self.messageTableview.delegate=self;
    self.messageTableview.dataSource=self;
    self.messageTableview.scrollEnabled=YES;
    [self createTableviewData];
    // Do any additional setup after loading the view from its nib.
}
//搜索方法
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;{
    NSLog(@"开始搜索");
    NSString *text=self.messageSearchBar.text;
    NSLog(@"%@",text);
    [self.messageTableview reloadData];
}
//点击tableviewcell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[self.messageData objectAtIndex:indexPath.row]setObject:@"0" forKey:@"message"];
    [self.messageTableview reloadData];
}
//cell动态创建
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.messageData count];
}
//设置tableviewcell的样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView==self.messageTableview && [self.messageData objectAtIndex:indexPath.row]!=nil)
    {
        NSString *CellIdentifier =[NSString stringWithFormat:@"Cell%ld",indexPath.row];
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
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake( 64, 9, 300, 19)];
        label1.textColor=[UIColor blackColor];
        label1.font=[UIFont fontWithName:@"Arial" size:18];
        [label1 setText:[[self.messageData objectAtIndex:indexPath.row]objectForKey:@"name"]];
        [cell.contentView addSubview:label1];
        //添加完成任务
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake( 64, 41, 300, 14)];
        label2.textColor=[UIColor lightGrayColor];
        label2.font=[UIFont fontWithName:@"Arial" size:14];
        [label2 setText:[[self.messageData objectAtIndex:indexPath.row]objectForKey:@"neirong"]];
        [cell.contentView addSubview:label2];
        //添加日期label
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake( 270, 10, 97, 13)];
        label3.textColor=[UIColor lightGrayColor];
        label3.font=[UIFont fontWithName:@"Arial" size:13];
        label3.textAlignment=NSTextAlignmentCenter;
        [label3 setText:[[self.messageData objectAtIndex:indexPath.row]objectForKey:@"time"]];
        [cell.contentView addSubview:label3];
        //添加image
        UIImageView *image=[[UIImageView alloc]init];
        image.frame=CGRectMake(7, 9, 47, 46);
        image.layer.masksToBounds=true;
        image.layer.cornerRadius=23;
        [image setImage:[UIImage imageNamed:[[self.messageData objectAtIndex:indexPath.row]objectForKey:@"picture"]]];
        [cell.contentView addSubview:image];
        //添加消息数量label
        UILabel *label4=[[UILabel alloc] initWithFrame:CGRectMake(40, 7, 16, 16)];
        label4.textColor=[UIColor whiteColor];
        label4.font=[UIFont fontWithName:@"Arial" size:11];
        NSString *label4text=[[self.messageData objectAtIndex:indexPath.row]objectForKey:@"message"];
        [label4 setText:label4text];
        [label4 setBackgroundColor:[UIColor redColor]];
        label4.layer.masksToBounds=true;
        label4.layer.cornerRadius=8;
        label4.textAlignment=NSTextAlignmentCenter;
        if([label4text isEqualToString:@"0"])
        {
            return cell;
        }
        [cell.contentView addSubview:label4];
        return cell;
    }
    return nil;
}
//cell编辑
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
//actionsheet按钮功能定义
-(void)actionSheet:(IBActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==0){//确定
        NSLog(@"按键1");
    }
    else if(buttonIndex==1)//取消
    {
        NSLog(@"按键2");
    }
}


-(NSArray*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *moreAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"是Ta" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSString *title;
        title = @"确认后将由他为您完成您所发布的任务。";
        self.customIBAS = [[IBActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确认", nil];
        [self.customIBAS setButtonBackgroundColor:[UIColor whiteColor]];
        if (self.buttonEffectSegmentedControl.selectedSegmentIndex == 0) {
            NSLog(@"1");
            //self.customIBAS.buttonResponse = IBActionSheetButtonResponseFadesOnPress;
            
        } else if (self.buttonEffectSegmentedControl.selectedSegmentIndex == 1) {
            NSLog(@"2");
            //self.customIBAS.buttonResponse = IBActionSheetButtonResponseReversesColorsOnPress;
        }
        /*else {
            self.customIBAS.buttonResponse = IBActionSheetButtonResponseHighlightsOnPress;
            [self.customIBAS setButtonHighlightTextColor:[UIColor whiteColor]];
            [self.customIBAS setButtonHighlightBackgroundColor:[UIColor redColor]];
        }*/
        
        [self.customIBAS showInView:self.view];
        NSLog(@"点击了是他");
    }];
    moreAction.backgroundColor=[UIColor colorWithRed:80.f/255 green:227.f/255 blue:194.f/255 alpha:100];
    
    return @[moreAction];
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
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
