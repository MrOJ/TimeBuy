//
//  homeDetailsTableViewCell.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/8.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeDetailsTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *portraitImgView;

@property (strong, nonatomic) IBOutlet UIImageView *msgImgView;
@property (strong, nonatomic) IBOutlet UIImageView *msgImgView2;
@property (strong, nonatomic) IBOutlet UIImageView *msgImgView3;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *likeLabel;
@property (strong, nonatomic) IBOutlet UILabel *numLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *ageLabel;
@property (strong, nonatomic) IBOutlet UILabel *vocationLabel;
@property (strong, nonatomic) IBOutlet UILabel *msgDetailsLabel;
@end
