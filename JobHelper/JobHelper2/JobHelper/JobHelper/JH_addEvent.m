//
//  JH_addEvent.m
//  JobHelper
//
//  Created by Caroline Marcks on 2/24/13.
//  Copyright (c) 2013 j.a.m. All rights reserved.
//

#import "JH_addEvent.h"

@interface JH_addEvent ()

@end

@implementation JH_addEvent

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveEvent:(id)sender {
    JH_AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];

    JH_dataController *data = [appDelegate dataController];
    
    [data updateEvent:_eventName withDate:[self.datePicker date]];
}

@end
