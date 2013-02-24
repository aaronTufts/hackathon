//
//  JH_dataController.h
//  JobHelper
//
//  Created by Aaron Tietz on 2/23/13.
//  Copyright (c) 2013 j.a.m. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
//#import "JH_AppDelegate.h"



@interface JH_dataController : NSObject

@property (nonatomic) NSMutableArray* curJob;
@property (nonatomic) NSMutableDictionary* allEvents;
@property (nonatomic) NSMutableString* curEventName;
@property (strong, nonatomic) NSMutableArray* allJobs;


/*
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
*/

-(void)selectJob:(int) job;
-(NSArray*)getJobs;
-(void)addJob:(NSMutableArray*) job;
//-(NSURL *)applicationDocumentsDirectory;
-(void)addDummy;

-(void)updateEvent:(NSString*)name withDate:(NSDate*)date;





@end
