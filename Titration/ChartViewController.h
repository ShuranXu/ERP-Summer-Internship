//
//  ChartViewController.h
//  Titration
//
//  Created by Shuran Xu on 2015-07-31.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LineChartView.h"
#import "AppDelegate.h"

@class AppDelegate;
@class LineChartView;

@interface ChartViewController : UIViewController 

@property(nonatomic,strong) LineChartView* chart;
@property(nonatomic) AppDelegate* delegate;
@property(nonatomic) int num_to_cut;
@property(nonatomic,strong) UIButton* back;
@property(nonatomic,strong) NSMutableArray* vArr;
@property(nonatomic) BOOL reset_passed;
@property(nonatomic) BOOL did_check_zero;
@property(nonatomic,strong) UITextView* text;
@property(nonatomic,strong) UILabel* shortAnswer;
@property(nonatomic,strong) UIButton* chart_title;
@end
