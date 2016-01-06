//
//  View4.h
//  Ch05_TabBarController
//
//  Created by Shuran Xu on 2015-05-15.
//
//

#import <UIKit/UIKit.h>
#import "View5.h"
#import "AppDelegate.h"
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <AVFoundation/AVFoundation.h>

@class View5;
@interface View4 : UIViewController <UIWebViewDelegate,UITextViewDelegate,GADBannerViewDelegate>



@property(nonatomic,strong) View5* about_view;
@property(nonatomic,strong) UIButton* about;
@property(nonatomic,strong) UIButton* details;
@property(nonatomic,strong) UIButton* front_title;
@property(nonatomic,strong) UIWebView* webView;
@property(nonatomic,strong) NSTimer* myTimer;
@property(nonatomic,strong) UITextView* addi_content;
@property(nonatomic,strong) UITextField* hint;
@property(nonatomic,strong) UIImageView* content1;
@property(nonatomic,strong) UIImageView* content2;
@property(nonatomic,strong) NSMutableArray* storeData;
@property(nonatomic) BOOL hasData;
@property(nonatomic,strong) UIActivityViewController* act;
@property(nonatomic,strong) GADBannerView* ad_banner;
@property(nonatomic,strong) UISegmentedControl* selectBar;

@end
