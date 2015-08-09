//
//  AppDelegate.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/5.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MMDrawerController.h"
#import "MMDrawerVisualState.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    @private
    MMDrawerController *drawerController;
}

@property (strong, nonatomic) UIWindow *window;


@end

