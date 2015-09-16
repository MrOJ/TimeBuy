//
//  backScheduleTableViewCell.m
//  TimeBuy
//
//  Created by CraftDream on 15/9/10.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "backScheduleTableViewCell.h"

@implementation backScheduleTableViewCell

@synthesize portraitImgView,myBackgroundView,detailsLabel,modifyButton,nickNameLabel;

- (void)drawRect:(CGRect)rect
{
    myBackgroundView.frame = CGRectMake(90, 7, [UIScreen mainScreen].bounds.size.width - 120 - 5, 32);
    
    myBackgroundView.layer.cornerRadius = 3;
    //modifyButton.frame = CGRectMake(10, 8, 15, 15);
    
    //detailsLabel.frame = CGRectMake(10 + 15 + 8, 5, 108, 21);
    
    //NSLog(@"%f",myBackgroundView.bounds.size.width);
    portraitImgView.frame = CGRectMake(90 + [UIScreen mainScreen].bounds.size.width - 120 - 5 - 22 - 10, 12, 22, 22);
    
    //需要和xib的文件大小一致，不然字体会显示很奇怪
    nickNameLabel.frame = CGRectMake(90 + [UIScreen mainScreen].bounds.size.width - 120 - 5 - 42 - 40, 13, 60, 20);
    nickNameLabel.adjustsFontSizeToFitWidth = YES;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    self.backgroundColor = [UIColor clearColor];
    
    portraitImgView.layer.masksToBounds = YES;
    portraitImgView.layer.cornerRadius = portraitImgView.bounds.size.height / 2;
    
}

@end
