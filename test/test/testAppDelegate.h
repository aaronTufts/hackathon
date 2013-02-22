//
//  testAppDelegate.h
//  test
//
//  Created by Aaron Tietz on 2/22/13.
//  Copyright (c) 2013 Aaron Tietz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface testAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@end
