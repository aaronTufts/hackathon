//
//  testSecondViewController.m
//  test
//
//  Created by Aaron Tietz on 2/22/13.
//  Copyright (c) 2013 Aaron Tietz. All rights reserved.
//

#import "testSecondViewController.h"

@interface testSecondViewController ()
@property (nonatomic) NSString* note;
@end

@implementation testSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
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

@end
