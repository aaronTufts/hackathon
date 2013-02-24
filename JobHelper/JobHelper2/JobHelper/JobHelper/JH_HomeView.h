//
//  JobHelperViewController.h
//  JobHelper
//
//  Created by Aaron Tietz on 2/23/13.
//  Copyright (c) 2013 j.a.m. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EDAM.h"
#import "JH_AppDelegate.h"
#import "EvernoteSDK.h"

@interface JH_HomeView : UIViewController <UITextFieldDelegate, UITableViewDelegate>

- (void)createNote:(EDAMNote *)note
           success:(void(^)(EDAMNote *note))success
           failure:(void(^)(NSError *error))failure;
- (IBAction)exportToEvernote:(id)sender;
-(IBAction)goToMakeEventPage:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *eventsList;
@end
