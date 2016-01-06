//
//  AppDelegate.h
//  Titration
//
//  Created by Shuran Xu on 2015-07-21.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadingPage.h"
@class LoadingPage;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic) CGFloat WIDTH;
@property(nonatomic) CGFloat HEIGHT;
@property(nonatomic,strong) LoadingPage* root;
@property(nonatomic) unsigned solu_select;
@property(nonatomic,strong) NSArray* point_array;
@property(nonatomic) BOOL to_back;
@property(nonatomic) double original_solu_conc;
@property(nonatomic) double drop_conc;
@property(nonatomic) BOOL go_back;

@end

