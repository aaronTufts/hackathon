//
//  JobHelperAppDelegate.m
//  JobHelper
//
//  Created by Aaron Tietz on 2/23/13.
//  Copyright (c) 2013 j.a.m. All rights reserved.
//

#import "JH_AppDelegate.h"
#import "EvernoteSDK.h"

@implementation JH_AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    _dataController = [[JH_dataController alloc] init];
    // Override point for customization after application launch.
    
    // Initial development is done on the sandbox service
    // Change this to BootstrapServerBaseURLStringUS to use the production Evernote service
    // Change this to BootstrapServerBaseURLStringCN to use the Yinxiang Biji production service
    // BootstrapServerBaseURLStringSandbox does not support the  Yinxiang Biji service
    NSString *EVERNOTE_HOST = BootstrapServerBaseURLStringSandbox;
    
    // Fill in the consumer key and secret with the values that you received from Evernote
    // To get an API key, visit http://dev.evernote.com/documentation/cloud/
    NSString *CONSUMER_KEY = @"caroline-marcks";
    NSString *CONSUMER_SECRET = @"d3d6a66e0b555854";
    
    // set up Evernote session singleton
    [EvernoteSession setSharedSessionHost:EVERNOTE_HOST
                              consumerKey:CONSUMER_KEY
                           consumerSecret:CONSUMER_SECRET];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[EvernoteSession sharedSession] handleDidBecomeActive];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [self saveContext];
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.dataController.managedObjectContext;
    
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}
            
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    BOOL canHandle = NO;
    if ([[NSString stringWithFormat:@"en-%@", [[EvernoteSession sharedSession] consumerKey]] isEqualToString:[url scheme]] == YES) {
        canHandle = [[EvernoteSession sharedSession] canHandleOpenURL:url];
    }
    return canHandle;
}

- (BOOL) canHandleSwitchProfileURL:(NSURL *)url {
    NSString *requestURL = [url path];
    NSArray *components = [requestURL componentsSeparatedByString:@"/"];
    if ([components count] < 2) {
        NSLog(@"URL:%@ has invalid component count: %i", url, [components count]);
        return NO;
    }
    [[EvernoteSession sharedSession] updateCurrentBootstrapProfileWithName:components[1]];
    return YES;
}

@end
