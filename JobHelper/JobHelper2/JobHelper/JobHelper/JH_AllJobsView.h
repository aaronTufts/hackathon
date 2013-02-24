//
//  JobHelperSecondViewController.h
//  JobHelper
//
//  Created by Aaron Tietz on 2/23/13.
//  Copyright (c) 2013 j.a.m. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JH_AllJobsView : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) NSArray *jobs;
@property (weak, nonatomic) IBOutlet UITableView *jobsList;


- (IBAction)addJob:(UIBarButtonItem *)sender;

@end
