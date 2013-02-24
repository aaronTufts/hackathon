//
//  JobHelperViewController.m
//  JobHelper
//
//  Created by Aaron Tietz on 2/23/13.
//  Copyright (c) 2013 j.a.m. All rights reserved.
//

#import "JH_HomeView.h"

@interface JH_HomeView ()


@end

@implementation JH_HomeView

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.toDoList) {
        [theTextField resignFirstResponder];
    }
    return YES;
}
 */

/*
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    NSLog(@"calling func");
    if (textView == self.upcomingEvents || textView == self.toDoList) {
        [textView resignFirstResponder];
        
    }
 
    // tell dataController to save note 
    
    return YES;
}
*/

- (void)createNote:(EDAMNote *)note
           success:(void(^)(EDAMNote *note))success
           failure:(void(^)(NSError *error))failure{
    
}

- (IBAction)exportToEvernote:(id)sender {
    /*
    EvernoteSession *session = [EvernoteSession sharedSession];
    [session authenticateWithViewController:self completionHandler:^(NSError *error) {
        if (error || !session.isAuthenticated) {
            // authentication failed :(
            // show an alert, etc
            // ...
        } else {
            // authentication succeeded :)
            // do something now that we're authenticated
            // ...
        }
    }];
     */
}

@end

