//
//  releaseDetailsTableViewCell.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/29.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "releaseDetailsTableViewCell.h"

@implementation releaseDetailsTableViewCell

@synthesize detailsTextView;
@synthesize addButton;
@synthesize imageView1;
@synthesize imageView2;
@synthesize placeButton;

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    defaultStr = @"内容、要求，注明确切地点";
    detailsTextView.tag = 2;
    detailsTextView.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addImage:(id)sender
{
    
}

- (IBAction)location:(id)sender
{
    
}

#pragma mark - TextView delegate
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = defaultStr;
    } else {
        textView.text = @"";
    }
    
}

// 点击编辑区以外的地方 取消键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![detailsTextView isExclusiveTouch]) {
        [detailsTextView resignFirstResponder];
    }
}

@end
