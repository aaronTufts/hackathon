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
    
    EvernoteSession *session = [EvernoteSession sharedSession];
    [session authenticateWithViewController:self completionHandler:^(NSError *error) {
        if (error || !session.isAuthenticated) {
          NSLog(@"can't make note");
        } else {
             NSLog(@"made note");
            NSString *noteContent = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
                                     "<!DOCTYPE en-note SYSTEM \"http://xml.evernote.com/pub/enml2.dtd\">"
                                     "<en-note>"
                                     "<span style=\"font-weight:bold;\">Hello Caroline!</span>"
                                     "<br />"
                                     "<span>Evernote logo :</span>"
                                     "<br />"
                                     "</en-note>"];
            EDAMNote *newNote = [[EDAMNote alloc] initWithGuid:nil title:@"Test note" content:noteContent contentHash:nil contentLength:noteContent.length created:0 updated:0 deleted:0 active:YES updateSequenceNum:0 notebookGuid:nil tagGuids:nil resources:nil attributes:nil tagNames:nil];
            NSLog(@"Hey I just met you and this is crazy");
            [[EvernoteNoteStore noteStore] createNote:newNote success:^(EDAMNote *note) {
                NSLog(@"I gots the stuff");
            } failure:^(NSError *error) {
                NSLog(@"Error creating note : %@",error);
            }];
           
        }
    }];
     
}

@end

