//
//  mySheduleViewController.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/9/7.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "mySheduleViewController.h"

@interface mySheduleViewController ()

@end

@implementation mySheduleViewController

@synthesize myTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:24.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"我的日程";
    
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    backgroundView.image = [UIImage imageNamed:@"我的日程 background.png"];
    myTableView.backgroundView = backgroundView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            return 70.0f;
            break;
        case 1:
            return 39.0f;
            break;
        default:
            return 50.0f;
            break;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    NSString *CellTableIdentifier=[[NSString alloc]initWithFormat:@"extentedCell%lu-%lu",(unsigned long)indexPath.section,(unsigned long)row];
    //NSLog(@"%ld",row);
    
    switch (row) {
        case 0:
        {
            infoTableViewCell *cell = (infoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            cell.contentView.frame = cell.bounds;
            cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
            //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell = [[[NSBundle mainBundle] loadNibNamed:@"infoTableViewCell" owner:self options:nil] lastObject];
            
            return cell;
            
            break;
        }
        case 1:
        {
            timeTableViewCell *cell = (timeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            cell.contentView.frame = cell.bounds;
            cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
            //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell = [[[NSBundle mainBundle] loadNibNamed:@"timeTableViewCell" owner:self options:nil] lastObject];
            
            return cell;
            
            break;
        }
        case 2:
        {
            sheduleTableViewCell *cell = (sheduleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
            cell.contentView.frame = cell.bounds;
            cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
            //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell = [[[NSBundle mainBundle] loadNibNamed:@"sheduleTableViewCell" owner:self options:nil] lastObject];
            
            return cell;
            
            break;
        }
        default:
            return nil;
            break;
    }
    
    /*
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
        
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.imageView.image = [UIImage imageNamed:@"portrait.png"];
    cell.textLabel.text = @"Hello";
    */
    //return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
