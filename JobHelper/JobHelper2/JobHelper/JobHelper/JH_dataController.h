//
//  JH_dataController.h
//  JobHelper
//
//  Created by Aaron Tietz on 2/23/13.
//  Copyright (c) 2013 j.a.m. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "JH_AppDelegate.h"

@interface JH_dataController : NSObject

@property (nonatomic) NSManagedObject* curJob;
@property (strong, nonatomic) NSManagedObject *currentJob;
@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) NSArray * allJobs;

-(void)selectJob:(int) job;

-(NSArray*)getJobs;

@end
