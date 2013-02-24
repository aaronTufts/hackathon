//
//  JobHelperJobViewController.h
//  JobHelper
//
//  Created by Aaron Tietz on 2/23/13.
//  Copyright (c) 2013 j.a.m. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JH_dataController;
#import "JH_AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@interface JH_JobView : UIViewController <UITextFieldDelegate, UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *company;
@property (strong, nonatomic) IBOutlet UITextField *location;
@property (strong, nonatomic) IBOutlet UITextField *contact;
@property (strong, nonatomic) IBOutlet UITextField *jobTitle;
@property (strong, nonatomic) IBOutlet UITextView *notes;
@property(nonatomic) UITextField *activeTextField;
//@property (nonatomic getter=isScrollEnabled) BOOL scrollEnabled;
@property (weak, nonatomic) IBOutlet UIScrollView *jobViewScroll;
- (IBAction)updateJob:(id)sender;
- (IBAction)goBack:(id)sender;

@end
