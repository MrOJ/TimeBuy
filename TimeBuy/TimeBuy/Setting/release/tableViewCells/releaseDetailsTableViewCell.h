//
//  releaseDetailsTableViewCell.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/29.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface releaseDetailsTableViewCell : UITableViewCell<UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *detailsTextView;
@property (strong, nonatomic) IBOutlet UIButton *addButton;
@property (strong, nonatomic) IBOutlet UIImageView *imageView1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView2;

- (IBAction)addImage:(id)sender;

@end
