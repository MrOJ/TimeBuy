//
//  detailHistoryViewController.m
//  TimeBuy
//
//  Created by yuweize on 15/9/6.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "detailHistoryViewController.h"

@interface detailHistoryViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIImageView *head;
@property (weak, nonatomic) IBOutlet UILabel *labelname;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollviewcontrol;
@end

@implementation detailHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];    //设置标题
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
    //textlabel行距设置
    self.textLabel.numberOfLines=2;
    //设置行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = 5;
    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:13],
                                  NSParagraphStyleAttributeName:paragraphStyle};
    self.textLabel.attributedText = [[NSAttributedString alloc]initWithString:self.textLabel.text attributes:attributes];
    // Do any additional setup after loading the view from its nib.
}

// Customize the number of sections in the table view.


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end

