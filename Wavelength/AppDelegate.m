//
//  AppDelegate.m
//  WaveLength
//
//  Created by Shuran Xu on 2015-07-03.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;
@synthesize frequency = _frequency;
@synthesize energy = _energy;
@synthesize wavelength = _wavelength;
@synthesize ob1 = _ob1;
@synthesize ob3 = _ob3;
@synthesize ob2 = _ob2;
@synthesize load_view = _load_view;
@synthesize sentence = _sentence;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.WIDTH = _window.frame.size.width;
    self.window.backgroundColor = [UIColor grayColor];
    
    self.load_view = [[Load alloc]initWithNibName:nil bundle:nil];
     
    //创建一个标签栏控制器
    _tabBarController = [[UITabBarController alloc] init];
    
    //创建3个TabViewController类型的普通视图控制器
    self.ob1 = [[View3 alloc]initWithNibName:nil bundle:nil];
    self.ob2 = [[View22 alloc] initWithNibName:nil bundle:nil];
    self.ob3 = [[View4 alloc] initWithNibName:nil bundle:nil];
    
    self.ob1.tabBarItem.title = @"Slider Bars";
    self.ob1.tabBarItem.image = [UIImage imageNamed:@"MV.png"];

    self.ob2.tabBarItem.title = @"Calculator";
     self.ob2.tabBarItem.image = [UIImage imageNamed:@"cal.png"]; //The image size has to be less or eaual to 301
    
    self.ob3.tabBarItem.title = @"More Info";
    self.ob3.tabBarItem.image = [UIImage imageNamed:@"info.png"];
    
    //将上述3个普通视图控制器添加到标签栏控制器
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:
                                         self.ob1, self.ob2, self.ob3, nil];
      self.tabBarController.delegate = self;
  
    self.sentence = [NSMutableString string];
    [self.window addSubview:self.load_view.view];
    
     self.clock=[NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(StopWait:) userInfo:nil repeats:NO];//建立一个时钟对象，让活动指示器3秒钟后停止动画。
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)Sound_Effect
{
    NSString* path = [[NSBundle mainBundle]pathForResource:@"tabs" ofType:@"wav"];
    if(path)
    {
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL URLWithString:path], &soundID);
        AudioServicesPlaySystemSound(soundID);
    }
}

-(void) StopWait:(id)sender

{
    [self.load_view.view removeFromSuperview];
    [self.window addSubview:self.tabBarController.view];
    
}


- (UIImage*)ChangeimageWithImage:(UIImage*)image
{
    CGRect newRect =[[UIScreen mainScreen] bounds];
    CGSize newSize = newRect.size;
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width*0.05,newSize.height*0.05)];//Draws the entire image in the specified rectangle, scaling it as needed to fit.
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    [self Sound_Effect];
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
