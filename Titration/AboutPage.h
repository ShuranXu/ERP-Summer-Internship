//
//  AboutPage.h
//  Titration
//
//  Created by Shuran Xu on 2015-08-06.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class AppDelegate;
@interface AboutPage : UIViewController

@property(nonatomic) AppDelegate* delegate;
@property(nonatomic,strong) UISegmentedControl* info_selection;
@property(nonatomic,strong) UITextView* about_text;
@property(nonatomic,strong) UITextView* instr_text;
@property(nonatomic,strong) UIButton* back;
@property(nonatomic,strong) UITextView* author_text;
@end
