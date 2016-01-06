//
//  AppDelegate.m
//  One-minute APP
//
//  Created by Shuran Xu on 2015-05-21.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize window = _window;
@synthesize view1 = _view1;
@synthesize test = _test;
@synthesize going_back = _going_back;
@synthesize test2 = _test2;
@synthesize going_back2 = _going_back2;
@synthesize check_e = _check_e;
@synthesize check_h = _check_h;
@synthesize store_name1 = _store_name1;
@synthesize store_name2 = _store_name2;
@synthesize HEIGHT = _HEIGHT;
@synthesize WIDTH = _WIDTH;
@synthesize FACTOR = _FACTOR;
@synthesize name_input1 = _name_input1;
@synthesize winner1 = _winner1;
@synthesize best_score1 = _best_score1;
@synthesize name_input2 = _name_input2;
@synthesize best_score2 = _best_score2;
@synthesize winner2 = _winner2;
@synthesize win5 = _win5;
@synthesize Easy_Steak1_Got = _Easy_Steak1_Got;
@synthesize Easy_Steak2_Got = _Easy_Steak2_Got;
@synthesize Easy_Steak3_Got = _Easy_Steak3_Got;
@synthesize Easy_Steak4_Got = _Easy_Steak4_Got;
@synthesize Hard_Steak1_Got = _Hard_Steak1_Got;
@synthesize Hard_Steak2_Got = _Hard_Steak2_Got;
@synthesize Hard_Steak3_Got = _Hard_Steak3_Got;
@synthesize Hard_Steak4_Got = _Hard_Steak4_Got;
@synthesize opened = _opened;
@synthesize finished = _finished;
@synthesize sound_off = _sound_off;
@synthesize music_set = _music_set;
@synthesize user_defaut = _user_defaut;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.WIDTH = [[UIScreen mainScreen]bounds].size.width;
    self.HEIGHT = [[UIScreen mainScreen]bounds].size.height;
    self.FACTOR = [[UIScreen mainScreen]scale];
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.view1 = [[Load alloc]initWithNibName:nil bundle:nil];
    self.window.rootViewController = self.view1;
    self.test = false;
    self.going_back = false;
    self.test2 = false;
    self.going_back2 = false;
    self.check_h = false;
    self.check_e = false;
    //By default, the program enables the user to play both easy and hard game, and the scores are also saved in the leaderboard.
    self.store_name1 = false;
    self.store_name2 = false;
    self.win5 = 0;
    self.best_score1 = 0;
    self.winner1 = [[NSString alloc]init];
    self.name_input1 = false;
    self.best_score2 = 0;
    self.winner2 = [[NSString alloc]init];
    self.name_input2 = false;
    
    self.Easy_Steak4_Got = false;
    self.Easy_Steak3_Got = false;
    self.Easy_Steak2_Got = false;
    self.Easy_Steak1_Got = false;
    
    self.Hard_Steak4_Got = false;
    self.Hard_Steak3_Got = false;
    self.Hard_Steak2_Got = false;
    self.Hard_Steak1_Got = false;
    
    self.opened = false;
    self.finished = false;
    self.sound_off = false;
    self.music_set = true;
    
    self.user_defaut = [NSUserDefaults standardUserDefaults];
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
