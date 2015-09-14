//
//  systemSettingView.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/29.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "systemSettingView.h"
#import "SlideNavigationController.h"

@implementation systemSettingView

- (void)initSubViews {
    //CGSize mainSize = self.bounds.size;
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"systemSettingView" owner:self options:nil];
    UIView *myView = [nib lastObject];
    [self addSubview:myView];
    self.backgroundColor = [UIColor clearColor];
    //self.alpha = 0.8f;
}
- (IBAction)talkButtonPress:(id)sender {
    TalkViewController *vc = [[TalkViewController alloc] init];
    [KLCPopup dismissAllPopups];
    
    //[self.superview removeFromSuperview];
    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
                                                             withSlideOutAnimation:YES
                                                                     andCompletion:nil];
    //UIView *talkview=[[UIView alloc]init];
    //[self pre :showDetailsVC animated:YES];
    

}

@end
