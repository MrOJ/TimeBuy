//
//  helpDetailTableViewCell.m
//  TimeBuy
//
//  Created by yuweize on 15/9/12.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "helpDetailTableViewCell.h"

@implementation helpDetailTableViewCell
@synthesize portraitImgView;
@synthesize msgImgView;
@synthesize msgImgView2;
@synthesize msgImgView3;
@synthesize nameLabel;
@synthesize likeLabel;
@synthesize numLabel;
@synthesize timeLabel;
@synthesize ageLabel;
@synthesize vocationLabel;
@synthesize msgDetailsLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
