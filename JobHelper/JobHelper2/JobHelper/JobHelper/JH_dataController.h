//
//  JH_dataController.h
//  JobHelper
//
//  Created by Aaron Tietz on 2/23/13.
//  Copyright (c) 2013 j.a.m. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface JH_dataController : NSObject

@property (nonatomic) NSManagedObject* curJob;

-(void)selectJob:(int) job;

@end
