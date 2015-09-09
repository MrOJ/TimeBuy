//
//  timeTableViewCell.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/9/7.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "timeTableViewCell.h"

@implementation timeTableViewCell

@synthesize dateLabel;

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
