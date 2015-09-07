//
//  infoTableViewCell.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/9/7.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "infoTableViewCell.h"

@implementation infoTableViewCell

@synthesize portraitImgView;
@synthesize nicknameTitle;

- (void)awakeFromNib {
    // Initialization code
    
    portraitImgView.layer.masksToBounds = YES;
    portraitImgView.layer.cornerRadius = portraitImgView.bounds.size.height / 2;
    
    self.backgroundColor = [UIColor clearColor];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
