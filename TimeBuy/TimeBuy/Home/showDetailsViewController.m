//
//  showDetailsViewController.m
//  TimeBuy
//
//  Created by yuweize on 15/8/29.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "showDetailsViewController.h"

@interface showDetailsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIImageView *head;
@property (weak, nonatomic) IBOutlet UILabel *labelname;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollviewcontrol;
@end

@implementation showDetailsViewController
//tableview 动态添加数据
-(void)createTableviewData
{
    Sections = [[NSMutableArray alloc] initWithObjects:@"记录", nil];
    self.repeatData=[[NSMutableArray alloc]init];
    NSMutableDictionary *s1=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"小刚",@"name",@"高挺.png",@"picture",@"你好",@"neirong" ,@"一分钟前",@"time",nil];
    NSMutableDictionary *s2=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"余维泽",@"name",@"portrait.png",@"picture",@"你好",@"neirong",@"一分钟前",@"time",nil];
    self.repeatData=[[NSMutableArray alloc]initWithObjects:s1,s2, nil];
    NSLog(@"%@",self.repeatData);
    //[self.tableview reloadData];
    NSLog(@"数目%lu",(unsigned long)[self.repeatData count]);
    NSLog(@"suc");
}

- (void)viewDidLoad {
    [self createTableviewData];
    [super viewDidLoad];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.textfield.frame=CGRectMake(14, 585, 347, 45);
    //设置标题
    self.navigationItem.title=@"详情";
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20.0f], NSFontAttributeName, nil];
    self.labelname.text=@"余维泽";
    //设置圆形头像
    self.head.layer.masksToBounds=true;
    self.head.layer.cornerRadius=20;
    //设置滚动
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.scrollviewcontrol.contentSize=CGSizeMake(375,800);
    NSLog(@"suc3");
    
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.repeatData count];
}
// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [Sections count];
}

//设置tableviewcell的样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if(tableView==self.tableview && [self.repeatData objectAtIndex:indexPath.row]!=nil)
    {
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        // Configure the cell.
        cell.backgroundColor=[UIColor whiteColor];
        [cell setAccessoryType:UITableViewCellAccessoryNone]; 
        //添加名字
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake( 64, 10, 300, 19)];
        label1.textColor=[UIColor blackColor];
        label1.font=[UIFont fontWithName:@"Arial" size:18];
        [label1 setText:[[self.repeatData objectAtIndex:indexPath.row]objectForKey:@"name"]];
        [cell.contentView addSubview:label1];
        //添加回复
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake( 64, 40, 300, 19)];
        label2.textColor=[UIColor blackColor];
        label2.font=[UIFont fontWithName:@"Arial" size:18];
        [label2 setText:[[self.repeatData objectAtIndex:indexPath.row]objectForKey:@"neirong"]];
        [cell.contentView addSubview:label2];
        //添加日期label
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake( 314, 10, 60, 13)];
        label3.textColor=[UIColor lightGrayColor];
        //label3.text =@"1分钟前";
        label3.font=[UIFont fontWithName:@"Arial" size:13];
        [label3 setText:[[self.repeatData objectAtIndex:indexPath.row]objectForKey:@"time"]];
        [cell.contentView addSubview:label3];
        //添加image
        //[[cell textLabel] setText:[[repeatData objectAtIndex: indexPath.row] objectForKey:@"name"]];
        UIImageView *image=[[UIImageView alloc]init];
        image.frame=CGRectMake(14, 10, 39, 39);
        image.layer.masksToBounds=true;
        image.layer.cornerRadius=20;
        [image setImage:[UIImage imageNamed:[[self.repeatData objectAtIndex:indexPath.row]objectForKey:@"picture"]]];
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
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete)
 {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert)
 {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end