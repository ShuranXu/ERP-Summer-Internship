//
//  AppDelegate.m
//  Titration
//
//  Created by Shuran Xu on 2015-07-21.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize HEIGHT = _HEIGHT;
@synthesize WIDTH = _WIDTH;
@synthesize root = _root;
@synthesize solu_select = _solu_select;
@synthesize point_array = _point_array;
@synthesize to_back = _to_back;
@synthesize original_solu_conc;
@synthesize drop_conc;
@synthesize go_back;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.HEIGHT = [[UIScreen mainScreen]bounds].size.height;
    self.WIDTH = [[UIScreen mainScreen]bounds].size.width;
    self.root = [[LoadingPage alloc]initWithNibName:nil bundle:nil];
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.rootViewController = self.root;
    self.solu_select = 2;
    self.point_array = nil;
    self.to_back = false;
    self.go_back = false;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
