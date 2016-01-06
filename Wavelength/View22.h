//
//  View22.h
//  Ch05_TabBarController
//
//  Created by Shuran Xu on 2015-06-02.
//
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <AVFoundation/AVFoundation.h>
@interface View22 : UIViewController <UIAlertViewDelegate,UITextViewDelegate>


@property (retain, nonatomic) UIButton *button_point;
@property (retain, nonatomic) UIButton *button_E;
@property (retain, nonatomic) UIButton *backward;
@property (retain, nonatomic) UIButton *button_CLR;
@property (retain, nonatomic) UIButton *equal_button;
@property(nonatomic,strong) UIButton* clear_all;
@property(nonatomic) int offset;
@property(nonatomic) float input_value;
@property(nonatomic) float output_value;
@property(nonatomic,strong) NSMutableString* input_store;
@property(nonatomic) int choose;
@property(nonatomic,strong) UITextView* input;
@property(nonatomic,strong) UITextView* input2;
@property(nonatomic,strong) UITextView* output; //UITextView doesn't have keyboard coming-up issue !
@property(nonatomic) float waveLength;
@property(nonatomic) float frequency;
@property(nonatomic) float energy;
@property(nonatomic,strong) UISegmentedControl* segment;
@property(nonatomic,strong) UISegmentedControl* segment2;
@property(nonatomic,strong) UISegmentedControl* segment3;
@property(nonatomic) int switches2;
@property(nonatomic,strong) UILabel* label1;
@property(nonatomic,strong) UILabel* label2;
@property(nonatomic,strong) UILabel* label3;
@property(nonatomic,strong) NSMutableString* saved_data;
@property(nonatomic,strong) UIButton* saving;
@property(nonatomic) BOOL checking;
@property(nonatomic) BOOL is_read;
@property(nonatomic,strong) GADBannerView* ad_banner;
@property(nonatomic) BOOL switch3;
@property(nonatomic,strong) NSMutableString* frequency_out;
@property(nonatomic,strong) NSMutableString* result_string;
@property(nonatomic) BOOL clicked;
@property(nonatomic,strong) UIButton* button_3;

-(void)Update_the_View;

@end
