//
//  JH_dataController.m
//  JobHelper
//
//  Created by Aaron Tietz on 2/23/13.
//  Copyright (c) 2013 j.a.m. All rights reserved.
//

#import "JH_dataController.h"

@implementation JH_dataController

-(JH_dataController*) init{
    self = [super init];
    if (self) {
        JH_AppDelegate *appDelegate =
        [[UIApplication sharedApplication] delegate];
        
        NSManagedObjectContext *context =
        [appDelegate managedObjectContext];
        self.context=context;
    }
    return self;
}

-(void)selectJob:(int) job{
    NSLog(@"table sent row %d", job);
    self.curJob=self.allJobs[job];
}

-(NSArray*)getJobs{
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName:@"Job"
                inManagedObjectContext:self.context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    NSError *error;
    NSArray *objects = [self.context executeFetchRequest:request error:&error];
    self.allJobs=objects;
    return objects;
}

@end
