//
//  zuJuViewController.m
//  TimeBuy
//
//  Created by yuweize on 15/9/15.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "zuJuViewController.h"

@interface zuJuViewController ()
@property (retain, nonatomic) IBOutlet UITableView *zuJutableView;

@end

@implementation zuJuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.zuJutableView.delegate=self;
    self.zuJutableView.dataSource=self;
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:24.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"组局";
    // Do any additional setup after loading the view from its nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier =[NSString stringWithFormat:@"Cell%ld",indexPath.row];
    zuJuTableViewCell *cell = (zuJuTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.backgroundColor=[UIColor whiteColor];
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    if (cell == nil) {
        cell.contentView.frame = cell.bounds;
        cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        cell = [[[NSBundle mainBundle] loadNibNamed:@"zuJuTableViewCell" owner:self options:nil] lastObject];
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
