//
//  AppDelegate.h
//  WaveLength
//
//  Created by Shuran Xu on 2015-07-03.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View22.h"
#import "View3.h"
#import "View4.h"
#import "Load.h"


@class View22;
@class View3;
@class View4;
@class Load;

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>


@property (nonatomic, retain) UIWindow* window;
@property (nonatomic, retain) UITabBarController* tabBarController;
@property(nonatomic) CGFloat WIDTH;
@property(nonatomic,strong) View3* ob1;
@property(nonatomic,strong) View22* ob2;
@property(nonatomic,strong) View4* ob3;
@property(nonatomic) float wavelength;
@property(nonatomic) float energy;
@property(nonatomic) float frequency;
@property(nonatomic,strong) Load* load_view;
@property(nonatomic,strong) NSTimer* clock;
@property(nonatomic,strong) NSMutableString* sentence;

@end
