//
//  LineChartView.h
//  DrawDemo
//
//  Created by 东子 Adam on 12-5-31.
//  Copyright (c) 2012年 热频科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"


@class AppDelegate;
@interface LineChartView : UIView

//点信息
@property (nonatomic, strong) NSArray *array;
@property(nonatomic,strong) UIButton* back;

@property(nonatomic) AppDelegate* delegate;
@property(nonatomic) double horizontal_length;
@property(nonatomic) double vertical_length;
@property(nonatomic) double x_scale;
@property(nonatomic) double y_scale;
@property(nonatomic) double beginning_x;
@property(nonatomic) double beginning_y;
@property(nonatomic) double ending_x;
@property(nonatomic) double ending_y;
@end
