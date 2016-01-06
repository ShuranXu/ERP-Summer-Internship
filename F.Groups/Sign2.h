//
//  Sign2.h
//  One-minute APP
//
//  Created by Shuran Xu on 2015-06-03.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@interface Sign2 : UIViewController  <UIAlertViewDelegate,UITextFieldDelegate>

@property(nonatomic,strong) UITextField* name;
@property(nonatomic,strong) UILabel* mylabel;
@property(nonatomic,strong) NSMutableArray* name_data;
@property(nonatomic,strong) UIAlertView* alert;
@property(nonatomic,strong) UIAlertView* alert2;
@property(nonatomic) BOOL saved;
@property(nonatomic,strong) NSMutableArray* stored_name;
@property(nonatomic,strong) UIButton* cancel;
@property(nonatomic,strong) UIButton* save;
@property(nonatomic,strong) UIButton* icon;
@property(nonatomic) CGFloat WIDTH1;
@property(nonatomic) CGFloat HEIGHT1;
@property(nonatomic) CGFloat WIDTH2;
@property(nonatomic) CGFloat HEIGHT2;
@property(nonatomic) CGFloat GAP_X1;
@property(nonatomic) CGFloat GAP_Y1;
@property(nonatomic) CGFloat GAP_X2;
@property(nonatomic) CGFloat GAP_Y2;


-(void)Data_Transmit_to_Local_File;
-(void)Read_Data_From_Local_File;

-(void)Data_Transmit_to_Local_File2;
-(void)Read_Data_From_Local_File2;
- (UIImage*)ChangeimageWithImage:(UIImage*)image;
-(UIButton*) Create_Button_WithFream: (CGRect)frame AndTitle:(NSString*)title AndBackgroundImage:(NSString*)Image_Name OrBackgroundColor:(UIColor*)color2 Andfont:(CGFloat)font AndTitleColor:(UIColor*)color;

@end
