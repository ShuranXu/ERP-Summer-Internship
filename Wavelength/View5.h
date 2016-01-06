//
//  View5.h
//  Ch05_TabBarController
//
//  Created by Shuran Xu on 2015-05-18.
//
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Testing.h"

@interface View5 : UIViewController
@property(nonatomic,strong) UIButton* back_button;
@property(nonatomic) BOOL switches;
@property(nonatomic,strong) UIButton* framework;

@property(nonatomic,strong) UIButton* main_view;
@property(nonatomic,strong) UIButton* calculator;
@property(nonatomic,strong) UIButton* info_view;
@property(nonatomic,strong) Testing* presenting_page;
@property(nonatomic) BOOL judge1;
@property(nonatomic) BOOL judge2;
@property(nonatomic) BOOL judge3;

@end


/* 明天：

1. iris把那个intro-trans分成3张图片，用addsubview的方法创建3个view controller，并把图片插进去，用touch-event来控制。
 
 2.完成document.
 
 */