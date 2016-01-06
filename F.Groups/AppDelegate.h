//
//  AppDelegate.h
//  One-minute APP
//
//  Created by Shuran Xu on 2015-05-21.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Load.h"


@class ViewController;
@class Load;

@interface AppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong) Load* view1;
@property(nonatomic) BOOL test;
@property(nonatomic) BOOL test2;
@property(nonatomic) BOOL going_back;
@property(nonatomic) BOOL going_back2;
@property(nonatomic) BOOL check_h;
@property(nonatomic) BOOL check_e;
@property(nonatomic) BOOL store_name1;
@property(nonatomic) BOOL store_name2;
@property(nonatomic) CGFloat WIDTH;
@property(nonatomic) CGFloat HEIGHT;
@property(nonatomic) CGFloat FACTOR;

@property(nonatomic) int best_score1;
@property(nonatomic,strong) NSString* winner1;
@property(nonatomic) BOOL name_input1;
@property(nonatomic) int best_score2;
@property(nonatomic,strong) NSString* winner2;
@property(nonatomic) BOOL name_input2;
@property(nonatomic) int win5;

@property(nonatomic) BOOL Easy_Steak1_Got;
@property(nonatomic) BOOL Easy_Steak2_Got;
@property(nonatomic) BOOL Easy_Steak3_Got;
@property(nonatomic) BOOL Easy_Steak4_Got;


@property(nonatomic) BOOL Hard_Steak1_Got;
@property(nonatomic) BOOL Hard_Steak2_Got;
@property(nonatomic) BOOL Hard_Steak3_Got;
@property(nonatomic) BOOL Hard_Steak4_Got;


@property(nonatomic)BOOL opened;
@property(nonatomic,strong) NSUserDefaults* user_defaut;
@property(nonatomic) BOOL finished;
@property(nonatomic) BOOL sound_off;
@property(nonatomic) BOOL music_set;
@end

