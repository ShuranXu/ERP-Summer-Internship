//
//  ViewController.h
//  One-minute APP
//
//  Created by Shuran Xu on 2015-05-21.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View1.h"
#import "Info.h"
#import "Sign2.h"
#import "Game_Page.h"
#import "Store_Page.h"
#import "AppDelegate.h"


@class View1;
@class  Game_Page;
@class Info;
@class Sign2;
@class Store_Page;


@interface ViewController : UIViewController <UIAlertViewDelegate>

@property(nonatomic,strong) UIButton* start;
@property(nonatomic,strong) UIButton* Info;
@property(nonatomic,strong) View1* game_View;
@property(nonatomic,strong) Info* info_page;
@property(nonatomic,strong) UIButton* sign;
@property(nonatomic,strong) Sign2* sign_page;
@property(nonatomic,strong) Game_Page* game;
@property(nonatomic,strong) UIButton* lead;
@property(nonatomic,strong) Store_Page* leaderboard;
@property(nonatomic,strong) UIButton* music_set;

@property(nonatomic,strong) UIButton* icon1;
@property(nonatomic,strong) UIButton* icon2;
@property(nonatomic,strong) UIButton* icon3;
@property(nonatomic,strong) UIButton* icon4;

@property(nonatomic) CGFloat GAP_X1;
@property(nonatomic) CGFloat GAP_X2;
@property(nonatomic) CGFloat GAP_Y1;
@property(nonatomic) CGFloat GAP_Y2;
@property(nonatomic) CGFloat WIDTH1;
@property(nonatomic) CGFloat HEIGHT1;
@property(nonatomic) CGFloat WIDTH2;
@property(nonatomic) CGFloat HEIGHT2;





-(UIButton*) Create_Button_WithFream: (CGRect)frame AndTitle:(NSString*)title AndBackgroundImage:(NSString*)Image_Name OrBackgroundColor:(UIColor*)color2 Andfont:(CGFloat)font AndTitleColor:(UIColor*)color;


@end

