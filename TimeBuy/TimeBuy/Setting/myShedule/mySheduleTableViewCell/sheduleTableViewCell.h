//
//  sheduleTableViewCell.h
//  TimeBuy
//
//  Created by CraftDream on 15/9/9.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sheduleTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIView *roundView;
@property (weak, nonatomic) IBOutlet UIImageView *portraitImgView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *msgDetailLabel;
@property (weak, nonatomic) IBOutlet UIButton *modifyButton;
@property (weak, nonatomic) IBOutlet UIImageView *backgoundImgView;
@end
