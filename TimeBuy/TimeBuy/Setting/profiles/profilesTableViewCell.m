//
//  profilesTableViewCell.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/31.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "profilesTableViewCell.h"

@implementation profilesTableViewCell

@synthesize subTextLabel;

- (void)awakeFromNib {
    // Initialization code
}

- (void)initSubviews
{
    subTextLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 240, 10, 200, 30)];
    subTextLabel.textColor = [UIColor lightGrayColor];
    subTextLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:subTextLabel];
    
    self.selectionStyle = UITableViewCellAccessoryDisclosureIndicator;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
