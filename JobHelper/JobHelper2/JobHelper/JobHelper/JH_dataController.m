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
        // Custom initialization
    }
    return self;
}

-(void)selectJob:(int) job{
    NSLog(@"table sent row %d", job);
}

-(NSArray*)getJobs{
    return [[NSArray alloc] init];
}

@end
