//
//  Load.h
//  One-minute APP
//
//  Created by Shuran Xu on 2015-06-07.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ViewController.h"

@class ViewController;
@interface Load : UIViewController


@property(nonatomic,strong) UIActivityIndicatorView* wait;
@property(nonatomic,strong) NSTimer* clock;
@property(nonatomic,strong) ViewController* nextView;
@end
