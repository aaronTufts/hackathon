//
//  JobHelperAppDelegate.h
//  JobHelper
//
//  Created by Aaron Tietz on 2/23/13.
//  Copyright (c) 2013 j.a.m. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "JH_dataController.h"
#import "EvernoteSDK.h"

    
@interface JH_AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) JH_dataController *dataController;
@property (nonatomic) EvernoteSession *session;

-(void)saveContext;

@end
