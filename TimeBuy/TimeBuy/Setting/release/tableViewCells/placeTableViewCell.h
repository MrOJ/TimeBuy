//
//  placeTableViewCell.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/9/2.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface placeTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIButton *placeButton;

- (IBAction)location:(id)sender;
@end