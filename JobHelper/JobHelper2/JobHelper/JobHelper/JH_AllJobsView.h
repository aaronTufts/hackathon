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

@interface JH_AllJobsView : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) NSArray *jobs;
@property (weak, nonatomic) IBOutlet UITableView *jobsList;
- (IBAction)makeJob:(id)sender;

@end
