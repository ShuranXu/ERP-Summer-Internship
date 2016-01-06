//
//  LoadingPage.h
//  Titration
//
//  Created by Shuran Xu on 2015-08-08.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Menu.h"

@class Menu;
@interface LoadingPage : UIViewController

@property(nonatomic,strong) UIActivityIndicatorView* wait;
@property(nonatomic,strong) NSTimer* clock;
@property(nonatomic,strong) Menu* next_view;

@end
