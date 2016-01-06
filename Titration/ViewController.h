//
//  ViewController.h
//  Titration
//
//  Created by Shuran Xu on 2015-07-21.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import "AppDelegate.h"
#import "Table_Point.h"
#import <math.h>
#import "ChartViewController.h"



@class AppDelegate;
@class ChartViewController;

@interface ViewController : UIViewController <UIGestureRecognizerDelegate,UIAlertViewDelegate>

@property(nonatomic,strong) UIButton* PH_Indicator;
@property(nonatomic) AppDelegate* delegate;
@property(nonatomic,strong) UIButton* header;
@property(nonatomic,strong) UIButton* droper;
@property(nonatomic,strong) UILabel* count;
@property(nonatomic,strong) UIButton* container;
@property(nonatomic,strong) UIButton* back;
@property (nonatomic, readonly) CALayer *maskLayer;
@property (nonatomic, assign) CGFloat progress;
@property(nonatomic,strong) UIButton* start;
@property(nonatomic,strong)  CABasicAnimation *basicAnimation;
@property(nonatomic,strong) NSMutableString* text;
@property(nonatomic,strong) CABasicAnimation* animation;
@property(nonatomic) BOOL testerrr;
@property(nonatomic,strong) UISegmentedControl* drop_volume_seletion;
@property(nonatomic,strong) UIAlertView* alert2;
@property(nonatomic) double conc_HA;
@property(nonatomic) double conc_A;
@property(nonatomic) double mol_HA;
@property(nonatomic) double mol_A;
@property(nonatomic) double vol_A;
@property(nonatomic) double vol_HA;
@property(nonatomic) double PH_value;
@property(nonatomic) double total_volume;
@property(nonatomic) double drop_volume;
@property(nonatomic) double cumulated_OH_vol;
@property(nonatomic,strong) NSMutableArray* points_array;
@property(nonatomic) double intial_solu_conc;
@property(nonatomic,strong) UILabel* disp_PH;
@property(nonatomic,strong) UIButton* pink_cover;
@property(nonatomic,strong) NSMutableArray* drop_array;
@property(nonatomic,strong) ChartViewController* chart;
@property(nonatomic) double long_offset;
@property(nonatomic) int animation2_checker;
@property(nonatomic) double mol_HA_Ref;
@property(nonatomic) double mol_A_Ref;

@property(nonatomic) CABasicAnimation* bb;

-(double)PH_Calculation_1_With_Conc:(double)conc_HA And_Conc:(double)conc_A;
-(double)PH_Calculation_2_With_Conc:(double)conc_HA;
-(double)Calulate_Mols;
-(void)Initialize_Water_Drop_Selection;
-(void)Initialize_Pink_Cover;
-(void)Basic_Setup;
-(UIButton*) Create_Button_WithFream: (CGRect)frame AndTitle:(NSString*)title AndBackgroundImage:(NSString*)Image_Name OrBackgroundColor:(UIColor*)color2 Andfont:(CGFloat)font AndTitleColor:(UIColor*)color;
-(void)Spring_Effect_With_Value:(float)to_value;
-(void)Generate_point;


@end

