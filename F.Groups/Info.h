//
//  Info.h
//  One-minute APP
//
//  Created by Shuran Xu on 2015-05-25.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AppDelegate.h"

@interface Info : UIViewController <AVSpeechSynthesizerDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UIAlertViewDelegate>

@property(atomic,strong) AVSpeechSynthesizer* info1;
@property(atomic,strong) AVSpeechUtterance* info1_speak;
@property(atomic,strong) UIButton* quit;
@property(atomic,strong) UIButton* icon;
@property(atomic,strong) UIButton* play1;
@property(atomic) BOOL start1;
@property(atomic) int count1;
@property(nonatomic,strong) UIPickerView* picker;
@property(nonatomic,strong) NSArray* score_Array;
@property(nonatomic,strong) UIButton* show;
@property(nonatomic,strong) NSString* text2;
@property(nonatomic,strong) UIButton* reference;
@property(nonatomic,strong) UIButton* icon2;
@property(nonatomic,strong) UIButton* moreApps;
@property(nonatomic,strong) UIButton* speaker;
@property(nonatomic,strong) UIButton* icon3;


-(UIButton*) Create_Button_WithFream: (CGRect)frame AndTitle:(NSString*)title AndBackgroundImage:(NSString*)Image_Name OrBackgroundColor:(UIColor*)color2 Andfont:(CGFloat)font AndTitleColor:(UIColor*)color;

@end
