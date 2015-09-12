//
//  telephoneViewController.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/19.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "telephoneViewController.h"

@interface telephoneViewController ()

@end

@implementation telephoneViewController

@synthesize telTableView;
@synthesize telephone;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"手机";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recModify:) name:@"passModify" object:nil];
    [self.telTableView reloadData];
    
}
- (void)recModify:(NSNotification *)notification
{
    NSDictionary *getDic = [notification userInfo];
    NSLog(@"phone");
    if([[getDic objectForKey:@"type"]isEqualToString: @"phone"])
    {
        telephone = [getDic objectForKey:@"value"];
        [self.telTableView reloadData];

    }
    
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
    NSString *CellTableIdentifier=[[NSString alloc] initWithFormat:@"cell"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    
    if (indexPath.row == 0) {
        NSString *newString = [NSString stringWithFormat:@"绑定手机                                  %@",telephone];
        cell.textLabel.text = newString;
    } else {
        cell.textLabel.text = @"更换绑定手机";
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    changeTelephoneViewController *VC=[[changeTelephoneViewController alloc]init];
            [self.navigationController pushViewController:VC animated:YES];            
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
