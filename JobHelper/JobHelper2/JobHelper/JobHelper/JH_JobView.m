//
//  JobHelperJobViewController.m
//  JobHelper
//
//  Created by Aaron Tietz on 2/23/13.
//  Copyright (c) 2013 j.a.m. All rights reserved.
//

#import "JH_JobView.h"

@interface JH_JobView ()

@end

@implementation JH_JobView

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
    
    JH_AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    JH_dataController *data = [appDelegate dc];
    
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
- (void)updateJob:(id)sender{
    JH_AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    JH_dataController *data = [appDelegate dc];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
