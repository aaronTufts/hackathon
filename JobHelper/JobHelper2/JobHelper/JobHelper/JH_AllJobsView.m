//
//  JobHelperSecondViewController.m
//  JobHelper
//
//  Created by Aaron Tietz on 2/23/13.
//  Copyright (c) 2013 j.a.m. All rights reserved.
//

#import "JH_AllJobsView.h"


@interface JH_AllJobsView ()

@end

@implementation JH_AllJobsView

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    } 
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    JH_AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    _dc = [appDelegate dataController];
    //_jobs = [NSArray arrayWithObjects: @"1", @"2", @"3", nil];
    _jobs = [_dc getJobs];
    
    /*
    to get each field, you do [arrayName[i] valueForKey:@"jobTitle"]; "company" for i=0 through arraysize
     */


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_jobs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  //  static NSString *CellIdentifier = @"JH_JobIdentifier";
  //  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"JH_JobIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"JH_JobIdentifier"];
    }
   
    //NSString *jobText = [[NSString alloc] initWithFormat: @"%@ at %@", [[_jobs objectAtIndex:indexPath.row] valueForKey:@"jobTitle"], [[_jobs objectAtIndex:indexPath.row] valueForKey:@"company"]];
    NSMutableArray* job=[_jobs objectAtIndex:indexPath.row];
    NSString *jobText = [[NSString alloc] initWithFormat: @"%@ at %@",[job objectAtIndex:0],[job objectAtIndex:1]];
    
    cell.textLabel.text = jobText;
   // NSLog(@"returning cell");
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
            NSString *end = [NSString stringWithFormat:@"</span></en-note>"];
            
            NSString *noteContent = [NSString stringWithFormat:@"%@ %@ %@", front, middle, end];
            EDAMNote *newNote = [[EDAMNote alloc] initWithGuid:nil title:@"My Jobs" content:noteContent contentHash:nil contentLength:noteContent.length created:0 updated:0 deleted:0 active:YES updateSequenceNum:0 notebookGuid:nil tagGuids:nil resources:nil attributes:nil tagNames:nil];
            [[EvernoteNoteStore noteStore] createNote:newNote success:^(EDAMNote *note) {
                NSLog(@"Note exported successfully");
            } failure:^(NSError *error) {
                NSLog(@"Error creating note : %@",error);
            }];
        }
    }];
    
}

-(NSString*)buildNoteMiddle{
    NSString *mid = [NSString stringWithFormat:@""];
    for (NSMutableArray* a in _dc.allJobs) {
        mid =  [NSString stringWithFormat:@"%@ <br/> Company: %@ <br /> Location: %@ <br/> Contact: %@ <br /> Job Title: %@ <br /> Notes: %@ <br />", mid, a[0], a[1], a[2], a[3], a[4]];
    }
    return mid;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    [_dc selectJob:[indexPath row]];
   // NSLog(@"user toched cell %d", [indexPath row]);
    [self performSegueWithIdentifier:@"toJobView" sender:self];
}

- (IBAction)makeJob:(id)sender {
    [_dc selectJob:-1];
    NSLog(@"adding new job?");
    [self performSegueWithIdentifier:@"toJobView" sender:self];
}



@end
