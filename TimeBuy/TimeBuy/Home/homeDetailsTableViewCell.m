//
//  homeDetailsTableViewCell.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/8.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "homeDetailsTableViewCell.h"

@implementation homeDetailsTableViewCell

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
        
        //self.portraitImgView.layer.masksToBounds = YES;
        //self.portraitImgView.layer.cornerRadius = self.portraitImgView.bounds.size.height / 2;
        
        
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
