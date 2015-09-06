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
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
