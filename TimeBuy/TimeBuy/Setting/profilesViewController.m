//
//  profilesViewController.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/9.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "profilesViewController.h"

@interface profilesViewController ()

@end

@implementation profilesViewController

@synthesize myTableView;
@synthesize titleArray1,titleArray2,detailsArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"个人信息";
    
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    //myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:myTableView];
    
    titleArray1 = [[NSArray alloc] initWithObjects:@"头像",@"名字",@"性别",@"年龄",@"职业", nil];
    titleArray2 = [[NSArray alloc] initWithObjects:@"地址",@"电话",@"个性签名", nil];
    
    detailsArray = [[NSArray alloc] initWithObjects:@" ",@"黄小名",@"男",@"22",@"学生",@"杭州",@"187123456789",@"人生只有一次", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 5;
            break;
        case 1:
            return 3;
            break;
        default:
            break;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 80.0f;
    }
    
    return 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellTableIdentifier=[[NSString alloc] initWithFormat:@"cell"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = [titleArray1 objectAtIndex:indexPath.row];
        if (indexPath.row == 0) {
            UIImageView *portraitView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 100, 10, 60, 60)];
            portraitView.image = [UIImage imageNamed:@"portrait.png"];
            [cell addSubview:portraitView];
        } else {
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 240, 10, 200, 30)];
            titleLabel.textColor = [UIColor lightGrayColor];
            titleLabel.textAlignment = NSTextAlignmentRight;
            titleLabel.text = [detailsArray objectAtIndex:indexPath.section * 5 + indexPath.row];
            [cell addSubview:titleLabel];
        }
        
    } else if (indexPath.section == 1) {
        cell.textLabel.text = [titleArray2 objectAtIndex:indexPath.row];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 240, 10, 200, 30)];
        titleLabel.textColor = [UIColor lightGrayColor];
        titleLabel.textAlignment = NSTextAlignmentRight;
        titleLabel.text = [detailsArray objectAtIndex:indexPath.section * 5 + indexPath.row];
        [cell addSubview:titleLabel];
    }
    
    //cell.textLabel.text = @"Hello";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {

        switch (indexPath.row) {
            case 0:
            {
                
                break;
            }
            case 1:
            {
                modifyNameViewController *modifyNameVC = [[modifyNameViewController alloc] init];
                [self.navigationController pushViewController:modifyNameVC animated:YES];
                break;
            }
            case 2:
            {
                
                modifySexViewController *modifySexVC = [[modifySexViewController alloc] init];
                [self.navigationController pushViewController:modifySexVC animated:YES];
                
                break;
            }
            case 3:
            {
                
                modifyAgeViewController *modifyAgeVC = [[modifyAgeViewController alloc] init];
                [self.navigationController pushViewController:modifyAgeVC animated:YES];
                
                break;
            }
            case 4:
            {
                occupationViewController *occupationVC = [[occupationViewController alloc] init];
                [self.navigationController pushViewController:occupationVC animated:YES];
                
                break;
            }
            default:
                break;
        }
        
    } else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
            {
                addressViewController *addressVC = [[addressViewController alloc] init];
                [self.navigationController pushViewController:addressVC animated:YES];
                break;
            }
            case 1:
            {
                telephoneViewController *telephoneVC = [[telephoneViewController alloc] init];
                [self.navigationController pushViewController:telephoneVC animated:YES];
                break;
            }
            case 2:
            {
                signatureViewController *signatureVC = [[signatureViewController alloc] init];
                [self.navigationController pushViewController:signatureVC animated:YES];
                break;
            }
            default:
                break;
        }
    }
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
