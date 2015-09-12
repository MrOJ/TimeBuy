//
//  addressDetailViewController.m
//  TimeBuy
//
//  Created by yuweize on 15/9/11.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "addressDetailViewController.h"

@interface addressDetailViewController ()
@property (weak, nonatomic) IBOutlet UITableView *AddDetailTableview;

@end

@implementation addressDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.AddDetailTableview.dataSource=self;
    self.AddDetailTableview.delegate=self;
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"地区";
    self.navigationItem.rightBarButtonItem.enabled = NO;

    // Do any additional setup after loading the view from its nib.
}
//设置cell的点击和数据的返回
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *viewCtl = self.navigationController.viewControllers[1];
    [self.navigationController popToViewController:viewCtl animated:YES];
    NSString *celltext=[tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    NSLog(@"点击detailcell");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"passModify"
                                                        object:self
                                                      userInfo:@{@"type":@"address",@"value":celltext}];
}
//设置tableview的cell和数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cities.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([[self.cities objectAtIndex:indexPath.row] objectForKey:@"city"]!=nil)
    {
        NSString *CellIdentifier =[NSString stringWithFormat:@"Cell2%ld",indexPath.row] ;
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.backgroundColor=[UIColor whiteColor];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        cell.textLabel.text=[[self.cities objectAtIndex:indexPath.row] objectForKey:@"city"];
        return cell;
    }
    return nil;
}
//设置uiviewtableheader样式
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *sectiontile=[self tableView:tableView titleForHeaderInSection:section];
    if(sectiontile==nil)
    {
        return nil;
    }
    else
    {
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(15, 20, 200, 14)];
        label.text=sectiontile;
        label.textColor=[UIColor lightGrayColor];
        label.font=[UIFont fontWithName:@"Heiti TC" size:12];
        UIView *sectionview=[[UIView alloc]initWithFrame:CGRectMake(0,0, 375, 40)];
        //[sectionview setBackgroundColor:[UIColor lightGrayColor]];
        [sectionview addSubview:label];
        return sectionview;
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section==0)
    {
        return @"全部";
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{   return 1;
}
//去掉UItableview headerview黏性
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.AddDetailTableview)
    {
        CGFloat sectionHeaderHeight = 40;
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}
- (void)save:(id)sender withadd:(NSString*)add {
    [self.navigationController popViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"passModify"
                                                        object:self
                                                      userInfo:@{@"type":@"address",@"value":
                                                                     add}];
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
