//
//  sheduleTableViewCell.m
//  TimeBuy
//
//  Created by CraftDream on 15/9/9.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "sheduleTableViewCell.h"

@implementation sheduleTableViewCell

@synthesize timeLabel,roundView,portraitImgView,nickNameLabel,msgDetailLabel,modifyButton,backgoundImgView;

- (void)drawRect:(CGRect)rect
{
    NSLog(@"Hello");
    backgoundImgView.frame = CGRectMake(85, 10, [UIScreen mainScreen].bounds.size.width - 120, 32);
    
    modifyButton.frame = CGRectMake((85 + [UIScreen mainScreen].bounds.size.width - 120) - 15 - 8, 18, 15, 15);
    
    msgDetailLabel.frame = CGRectMake((85 + [UIScreen mainScreen].bounds.size.width - 120) - 15 - 8 - 110, 15, 108, 21);
    
}

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
    
    roundView.layer.masksToBounds = YES;
    roundView.layer.cornerRadius = roundView.bounds.size.height / 2;
    
    //backgoundImgView.frame = CGRectMake(85, 10, [UIScreen mainScreen].bounds.size.width - 80, 32);
    //[backgoundImgView setFrame:CGRectMake(85, 10, [UIScreen mainScreen].bounds.size.width - 80, 32)];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
