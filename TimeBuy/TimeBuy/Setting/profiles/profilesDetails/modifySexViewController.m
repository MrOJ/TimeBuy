//
//  modifySexViewController.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/16.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "modifySexViewController.h"

@interface modifySexViewController ()

@end

@implementation modifySexViewController

@synthesize sex;
@synthesize sexTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    currentRow = [sex integerValue];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"名字";
    
    UIBarButtonItem *registerButton = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = registerButton;
    
}

- (void)save:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"passModify"
                                                        object:self
                                                      userInfo:@{@"type":@"sex",@"value":[NSString stringWithFormat:@"%ld",(long)currentRow]}];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellTableIdentifier=[[NSString alloc] initWithFormat:@"cell%ld",(long)indexPath.row];
    //NSString *CellTableIdentifier=[[NSString alloc] initWithFormat:@"cell"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
        //cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    }
    
    if ([sex integerValue] == indexPath.row) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"男";
    } else {
        cell.textLabel.text = @"女";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    currentRow = indexPath.row;
    //设置只选择一个勾
    NSArray *array = [tableView visibleCells];
    for (UITableViewCell *cell in array) {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    UITableViewCell *cell=[sexTableView cellForRowAtIndexPath:indexPath];
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    
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
