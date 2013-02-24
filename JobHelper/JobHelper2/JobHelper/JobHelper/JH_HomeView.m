//
//  JobHelperViewController.m
//  JobHelper
//
//  Created by Aaron Tietz on 2/23/13.
//  Copyright (c) 2013 j.a.m. All rights reserved.
//

#import "JH_HomeView.h"
#import "NSData+EvernoteSDK.h"
#import"NSData+ENBase64.h"
#import "ENMLUtility.h"

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
            NSString *noteContent = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
                                     "<!DOCTYPE en-note SYSTEM \"http://xml.evernote.com/pub/enml2.dtd\">"
                                     "<en-note>"
                                     "<span style=\"font-weight:bold;\">Hello Caroline!</span>"
                                     "<br />"
                                     "<span>Evernote logo :</span>"
                                     "<br />"
                                     "</en-note>"];
            EDAMNote *newNote = [[EDAMNote alloc] initWithGuid:nil title:@"Test note" content:noteContent contentHash:nil contentLength:noteContent.length created:0 updated:0 deleted:0 active:YES updateSequenceNum:0 notebookGuid:nil tagGuids:nil resources:nil attributes:nil tagNames:nil];
            [[EvernoteNoteStore noteStore] createNote:newNote success:^(EDAMNote *note) {
                NSLog(@"Note exported successfully");
            } failure:^(NSError *error) {
                NSLog(@"Error creating note : %@",error);
            }];
        }
    }];
    
}

@end

