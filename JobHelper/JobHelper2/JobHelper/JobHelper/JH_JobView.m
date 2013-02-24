//
//  JobHelperJobViewController.m
//  JobHelper
//
//  Created by Aaron Tietz on 2/23/13.
//  Copyright (c) 2013 j.a.m. All rights reserved.
//

#import "JH_JobView.h"
#import "NSData+EvernoteSDK.h"
#import "ENMLUtility.h"

@interface JH_JobView ()

-(void)setAllToFirstResponderStatus;
-(void)removeAllFirstResponderStatus;

- (void)textFieldDidBeginEditing:(UITextField *)textField;
- (void)keyboardWasShown:(NSNotification *)notification;
- (void)keyboardWillHide:(NSNotification *)notification;
- (void)textFieldDidEndEditing:(UITextField *)textField;
-(NSString*)buildNoteMiddle;

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
    /*
    self.company.allowsEditingTextAttributes = TRUE;
    self.location.allowsEditingTextAttributes = TRUE;
    self.contact.allowsEditingTextAttributes = TRUE;
    self.notes.allowsEditingTextAttributes = TRUE;
    self.jobTitle.allowsEditingTextAttributes = TRUE;
     */
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
   
    //[self setAllToFirstResponderStatus];
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

- (IBAction)exportToEvernote:(id)sender {
}

- (void)createNote:(EDAMNote *)note
           success:(void(^)(EDAMNote *note))success
           failure:(void(^)(NSError *error))failure{
    
}

- (IBAction)exportJobToEvernote:(id)sender {

    EvernoteSession *session = [EvernoteSession sharedSession];
    [session authenticateWithViewController:self completionHandler:^(NSError *error) {
        if (error || !session.isAuthenticated) {
            NSLog(@"can't make note");
        } else {
            
            
            /*
             NSString* filePath = [[NSBundle mainBundle] pathForResource:@"evernote_logo_4c-sm" ofType:@"png"];
             NSData *myFileData = [NSData dataWithContentsOfFile:filePath];
             NSData *dataHash = [myFileData md5];
             EDAMData *edamData = [[EDAMData alloc] initWithBodyHash:dataHash size:myFileData.length body:myFileData];
             EDAMResource* resource = [[EDAMResource alloc] initWithGuid:nil noteGuid:nil data:edamData mime:@"image/png" width:0 height:0 duration:0 active:0 recognition:0 attributes:nil updateSequenceNum:0 alternateData:nil];
             NSString *noteContent = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
             "<!DOCTYPE en-note SYSTEM \"http://xml.evernote.com/pub/enml2.dtd\">"
             "<en-note>"
             "<span style=\"font-weight:bold;\">Hello photo note.</span>"
             "<br />"
             "<span>Evernote logo :</span>"
             "<br />"
             "%@"
             "</en-note>",[ENMLUtility mediaTagWithDataHash:dataHash mime:@"image/png"]];
             NSMutableArray* resources = [NSMutableArray arrayWithArray:@[resource]];
             EDAMNote *newNote = [[EDAMNote alloc] initWithGuid:nil title:@"Test photo note" content:noteContent contentHash:nil contentLength:noteContent.length created:0 updated:0 deleted:0 active:YES updateSequenceNum:0 notebookGuid:nil tagGuids:nil resources:resources attributes:nil tagNames:nil];
             [[EvernoteNoteStore noteStore] createNote:newNote success:^(EDAMNote *note) {
             NSLog(@"Note created successfully.");
             } failure:^(NSError *error) {
             NSLog(@"Error creating note : %@",error);
             }];
             */
            NSLog(@"made note");
            NSString *front = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?><!DOCTYPE en-note SYSTEM \"http://xml.evernote.com/pub/enml2.dtd\"><en-note><span style=\"font-weight:bold;\">"];
            
            NSString *middle = [self buildNoteMiddle];
            
            NSString *end = [NSString stringWithFormat:@"</en-note>"];
            NSString *titleString = [NSString stringWithFormat:@"%@",  _company.text];
            NSString *noteContent = [NSString stringWithFormat:@"%@ %@ %@", front, middle, end];
            EDAMNote *newNote = [[EDAMNote alloc] initWithGuid:nil title:titleString content:noteContent contentHash:nil contentLength:noteContent.length created:0 updated:0 deleted:0 active:YES updateSequenceNum:0 notebookGuid:nil tagGuids:nil resources:nil attributes:nil tagNames:nil];
            [[EvernoteNoteStore noteStore] createNote:newNote success:^(EDAMNote *note) {
                NSLog(@"Note exported successfully");
            } failure:^(NSError *error) {
                NSLog(@"Error creating note : %@",error);
            }];
        }
    }];

}

-(NSString*)buildNoteMiddle{
    NSString *temp =[NSString stringWithFormat:@" Company: %@ <br /> Location: %@ <br/> Contact: %@ <br /> Job Title: %@ <br /> Notes: %@ <br /></span>", _company.text, _location.text, _contact.text, _jobTitle.text, _notes.text];
    return temp;
}

@end
