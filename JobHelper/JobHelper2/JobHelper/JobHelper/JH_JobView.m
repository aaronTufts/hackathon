//
//  JobHelperJobViewController.m
//  JobHelper
//
//  Created by Aaron Tietz on 2/23/13.
//  Copyright (c) 2013 j.a.m. All rights reserved.
//

#import "JH_JobView.h"

@interface JH_JobView ()

-(void)setAllToFirstResponderStatus;
-(void)removeAllFirstResponderStatus;

- (void)textFieldDidBeginEditing:(UITextField *)textField;
- (void)keyboardWasShown:(NSNotification *)notification;
- (void)keyboardWillHide:(NSNotification *)notification;
- (void)textFieldDidEndEditing:(UITextField *)textField;

@end

@implementation JH_JobView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {;
        [_notes.layer setBorderWidth:4.0f];
        [_notes.layer setBorderColor:[[UIColor blackColor] CGColor]];
    }
    return self;
}
-(void)setAllToFirstResponderStatus{
    [self.company becomeFirstResponder];
    [self.location becomeFirstResponder];
    [self.contact becomeFirstResponder];
    [self.notes becomeFirstResponder];
    [self.jobTitle becomeFirstResponder];
}

-(void)removeAllFirstResponderStatus{
    [self.company resignFirstResponder];
    [self.location resignFirstResponder];
    [self.contact resignFirstResponder];
    [self.notes resignFirstResponder];
    [self.jobTitle resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    JH_AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
   
   // [self setAllToFirstResponderStatus];
    NSLog(@"in view did load");
    JH_dataController *data = [appDelegate dataController];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                          selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    if(data.curJob==nil){
        _jobTitle.text= @"";
        _company.text = @"";
        _contact.text = @"";
        _location.text = @"";
        _notes.text = @"";
    }else{
        _jobTitle.text= data.curJob[0];
        _company.text = data.curJob[1];
        _contact.text = data.curJob[2];
        _location.text = data.curJob[3];
        _notes.text = data.curJob[4];
    }
    //@"jobTitle",@"company",@"contact",@"location",@"notes"
}

- (void)keyboardWasShown:(NSNotification *)notification
{
    NSLog(@"keyboard shown");
    // Step 1: Get the size of the keyboard.
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    // Step 2: Adjust the bottom content inset of your scroll view by the keyboard height.
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
    _jobViewScroll.contentInset = contentInsets;
    _jobViewScroll.scrollIndicatorInsets = contentInsets;
    // Step 3: Scroll the target text field into view.
    CGRect aRect = self.view.frame;
    aRect.size.height -= keyboardSize.height;
    if (!CGRectContainsPoint(aRect, _activeTextField.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, _activeTextField.frame.origin.y - (keyboardSize.height-15));
        [_jobViewScroll setContentOffset:scrollPoint animated:YES];
    }
}

- (void) keyboardWillHide:(NSNotification *)notification {
    NSLog(@"keyboard hiding");
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    _jobViewScroll.contentInset = contentInsets;
    _jobViewScroll.scrollIndicatorInsets = contentInsets;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.activeTextField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.activeTextField = nil;
}



- (void)updateJob:(id)sender{
    JH_AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    JH_dataController *data = [appDelegate dataController];
    if(data.curJob==nil){

        NSMutableArray* newJob=[NSMutableArray arrayWithObjects:_jobTitle.text,_company.text,_contact.text,_location.text,_notes.text,nil];
        [data addJob:newJob];
    }else{
        data.curJob[0]=_jobTitle.text;
        data.curJob[1]=_company.text;
        data.curJob[2]=_contact.text ;
        data.curJob[3]=_location.text;
        data.curJob[4]=_notes.text;
    }
    [self removeAllFirstResponderStatus];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {

    [theTextField resignFirstResponder];
    return YES;
}

@end
