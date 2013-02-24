//
//  JobHelperJobViewController.h
//  JobHelper
//
//  Created by Aaron Tietz on 2/23/13.
//  Copyright (c) 2013 j.a.m. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JH_dataController.h"
#import "JH_AppDelegate.h"

@interface JH_JobView : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *company;
@property (strong, nonatomic) IBOutlet UITextField *location;
@property (strong, nonatomic) IBOutlet UITextField *contact;
@property (strong, nonatomic) IBOutlet UITextField *jobTitle;
@property (strong, nonatomic) IBOutlet UITextField *notes;
- (IBAction)updateJob:(id)sender;

@end
