//
//  Menu.h
//  Titration
//
//  Created by Shuran Xu on 2015-07-29.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ViewController.h"
#import "AboutPage.h"

@class AppDelegate;
@class ViewController;
@class AboutPage;
@interface Menu : UIViewController

@property(nonatomic,strong) UIButton* PH_Indicator;
@property(nonatomic) AppDelegate* delegate;
@property(nonatomic,strong) UIButton* header;
@property(nonatomic,strong) UIButton* container;
@property(nonatomic,strong) UIButton* solu1;
@property(nonatomic,strong) UIButton* solu2;
@property(nonatomic,strong) ViewController* nextView;
@property(nonatomic,strong) UIButton* dropper;
@property(nonatomic,strong) UIButton* about_page;
@property(nonatomic,strong) AboutPage* next_Page;

@end
