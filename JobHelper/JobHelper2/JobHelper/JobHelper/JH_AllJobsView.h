//
//  JobHelperSecondViewController.h
//  JobHelper
//
//  Created by Aaron Tietz on 2/23/13.
//  Copyright (c) 2013 j.a.m. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JH_AppDelegate.h"
#import "JH_dataController.h"
#import <CoreData/CoreData.h>

@interface JH_AllJobsView : UITableViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (nonatomic) NSArray *jobs;
@property (weak, nonatomic) IBOutlet UITableView *jobsList;
@property (nonatomic) JH_dataController *dc;
- (IBAction)makeJob:(id)sender;

@end
