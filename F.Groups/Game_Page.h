//
//  Game_Page.h
//  One-minute APP
//
//  Created by Shuran Xu on 2015-05-25.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View1.h"
#import "View2.h"
#import  "ViewController.h"


@class View2;
@class View1;

@interface Game_Page : UIViewController 


@property(nonatomic,strong) UIButton* simple;
@property(nonatomic,strong) UIButton* hard;
@property(nonatomic,strong) UIButton* quit;
@property(nonatomic,strong) UIButton* sound_setting;
@property(nonatomic,strong) View1* view1;
@property(nonatomic,strong) View2* view2;


@property(nonatomic) CGFloat WIDTH;
@property(nonatomic) CGFloat HEIGHT;
@property(nonatomic) CGFloat GAP_X;




-(UIButton*) Create_Button_WithFream: (CGRect)frame AndTitle:(NSString*)title AndBackgroundImage:(NSString*)Image_Name OrBackgroundColor:(UIColor*)color2 Andfont:(CGFloat)font AndTitleColor:(UIColor*)color;

@end
