//
//  getDealViewController.m
//  TimeBuy
//
//  Created by yuweize on 15/9/12.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "getDealViewController.h"

@interface getDealViewController ()
@property (retain, nonatomic) IBOutlet UITableView *deaTableView;

@end

@implementation getDealViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.deaTableView.delegate=self;
    self.deaTableView.dataSource=self;
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:24.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"跑腿";
    // Do any additional setup after loading the view from its nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier =[NSString stringWithFormat:@"Cell%ld",indexPath.row];
    helpDetailTableViewCell *cell = (helpDetailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.backgroundColor=[UIColor whiteColor];
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    if (cell == nil) {
        cell.contentView.frame = cell.bounds;
        cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        cell = [[[NSBundle mainBundle] loadNibNamed:@"helpDetailTableViewCell" owner:self options:nil] lastObject];
    }
    // Configure the cell.
    return cell;
    
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
