//
//  View3.h
//  Ch05_TabBarController
//
//  Created by Shuran Xu on 2015-05-15.
//
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "sys/utsname.h" //获取设备型号的头文件
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <AVFoundation/AVFoundation.h>

@interface View3 : UIViewController <UIAlertViewDelegate>

@property(nonatomic,strong) UISlider* slider1;
@property(nonatomic,strong) UISlider* slider2;
@property(nonatomic,strong) UISlider* slider3;
@property(nonatomic,strong) UILabel* label1;
@property(nonatomic,strong) UILabel* label2;
@property(nonatomic,strong) UILabel* label3;
@property(nonatomic,strong) UILabel* label4;
@property(nonatomic,strong) UIButton* button1;
@property(nonatomic,strong) UIButton* button2;
@property(nonatomic,strong) UIButton* button3;
@property(nonatomic,strong) UIButton* button4;
@property(nonatomic) float waveLength;
@property(nonatomic) float frequency;
@property(nonatomic) float energy;
@property(nonatomic,strong) UIButton* Copy_values;
@property(nonatomic,strong) NSMutableString* saved_data;
@property(nonatomic) BOOL slider_touched;
@property(nonatomic,strong) UIAlertView* alert;
@property(nonatomic) CGFloat slider_X_Position;
@property(nonatomic) CGFloat slider_width;
@property(nonatomic) CGFloat slider_height;

@property(nonatomic) CGFloat barHeight;
@property(nonatomic) CGFloat barWidth;

@property(nonatomic) CGFloat labelWidth;
@property(nonatomic) CGFloat labelHeight;
@property(nonatomic) BOOL is_read;
@property(nonatomic,strong) NSString* state;
@property(nonatomic,strong) GADBannerView* ad_banner;
@property(nonatomic,strong) NSMutableString* result_string;
@property(nonatomic,strong) NSMutableString* frequency_out;

@end
