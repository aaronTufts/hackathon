//
//  JH_addEvent.h
//  JobHelper
//
//  Created by Caroline Marcks on 2/24/13.
//  Copyright (c) 2013 j.a.m. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JH_AppDelegate.h"

@interface JH_addEvent : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *eventName;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)saveEvent:(id)sender;
@end
