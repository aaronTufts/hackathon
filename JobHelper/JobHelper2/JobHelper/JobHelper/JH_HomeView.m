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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    JH_AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    JH_dataController *data = [appDelegate dataController];
    NSMutableDictionary* events= [data allEvents];
    
    // Return the number of rows in the section.
    NSLog(@"aaa%d",[events count]);
    
    return [events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //  static NSString *CellIdentifier = @"JH_JobIdentifier";
    //  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"eventCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"eventCell"];
    }
    
    //NSString *jobText = [[NSString alloc] initWithFormat: @"%@ at %@", [[_jobs objectAtIndex:indexPath.row] valueForKey:@"jobTitle"], [[_jobs objectAtIndex:indexPath.row] valueForKey:@"company"]];
    JH_AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    JH_dataController *data = [appDelegate dataController];
    NSMutableDictionary* events= [data allEvents];
    
    NSArray* sortedEvents=[events keysSortedByValueUsingSelector:@selector(compare:)];
    NSString* eventToDisplay = [sortedEvents objectAtIndex:indexPath.row];
    NSString *jobText = [[NSString alloc] initWithFormat: @"%@",eventToDisplay];
    NSLog(@"%@",jobText);
    
    cell.textLabel.text = jobText;
    // NSLog(@"returning cell");
    return cell;
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

-(IBAction)goToMakeEventPage:(id)sender{
    JH_AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    JH_dataController *data = [appDelegate dataController];
    [data setCurEventName:nil];
    
    [self performSegueWithIdentifier:@"toMakeEventPage" sender:self];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
  //  [_dc selectJob:[indexPath row]];
    // NSLog(@"user toched cell %d", [indexPath row]);
    NSString* event=[_eventsList cellForRowAtIndexPath:indexPath].textLabel.text;
    JH_AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    JH_dataController *data = [appDelegate dataController];
    
    [data setCurEventName:event];
    
    [self performSegueWithIdentifier:@"toMakeEventPage" sender:self];
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

