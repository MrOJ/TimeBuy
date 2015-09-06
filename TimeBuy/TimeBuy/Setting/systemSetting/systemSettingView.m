//
//  systemSettingView.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/29.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "systemSettingView.h"

@implementation systemSettingView

- (void)initSubViews {
    //CGSize mainSize = self.bounds.size;
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"systemSettingView" owner:self options:nil];
    
    UIView *myView = [nib lastObject];
    
    [self addSubview:myView];
    
    self.backgroundColor = [UIColor clearColor];
    //self.alpha = 0.8f;
}

@end
