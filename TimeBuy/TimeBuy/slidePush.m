//
//  slidePush.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/9/3.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "slidePush.h"

@implementation slidePush

- (void)perform {
    
    UIViewController *desVC = (UIViewController *)self.destinationViewController;
    
    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:desVC
                                                             withSlideOutAnimation:NO
                                                                     andCompletion:nil];
}

@end
