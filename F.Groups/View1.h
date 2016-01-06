//
//  View1.h
//  One-minute APP
//
//  Created by Shuran Xu on 2015-05-21.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import "Sign2.h"
#import "AppDelegate.h"
#import "Info.h"


@class Sign2;
@class Info;

/*typedef struct {
    CGFloat answerABC_height;
    CGFloat answerABC_width;
    CGFloat answerABC_gapX;
    CGFloat buttonBC_height;
    CGFloat chemical_height;
    CGFloat buttonsABC_width;
    CGFloat question_GapY;
    CGFloat buttonABC_GapX;
    CGFloat question_GapX;
    CGFloat question_width;
    CGFloat question_height;
    CGFloat answer_GAP_Y;
    CGFloat button_GAP_Y;
    CGFloat answer_initial_Y;
    CGFloat button_initial_Y;
    CGFloat initial_question_Y_Position;
    
}Standard_Setup;*/

@interface View1 : UIViewController <UIAlertViewDelegate>

@property(nonatomic,strong) UIButton* example;
@property(nonatomic,strong) UIButton* chemical_class;
@property(nonatomic,strong) UIButton* formula;
@property(nonatomic,strong) UIButton* structural_formula;
@property(nonatomic,strong) NSDictionary* chemical_class_Dic;
@property(nonatomic,strong) NSArray* chemical_class_Array;

@property(nonatomic,strong) NSDictionary* structural_dic;
@property(nonatomic,strong) NSDictionary* formula_dic;
@property(nonatomic,strong) NSDictionary* example_dic;
@property(nonatomic) int title_switch;
@property(nonatomic, strong) NSTimer* my_timer; //This tiemr keeps the timing record.
@property(nonatomic,strong) UIButton* time_display;
@property(nonatomic) int time_counter;
@property(nonatomic) int question_counter;
@property(nonatomic,strong) NSArray* title_container;
@property(nonatomic) int content_switch;
@property(nonatomic) int score_counter;
@property(nonatomic,strong) UIButton* score;
@property(nonatomic) int correctness_switch;
@property(nonatomic) int save;
@property(nonatomic) int is_Answer;
@property(nonatomic) BOOL Question_Correct;
@property(nonatomic) BOOL Question_Done;
@property(nonatomic, strong) UIButton* answer_A;
@property(nonatomic, strong) UIButton* answer_B;
@property(nonatomic, strong) UIButton* answer_C;
@property(nonatomic) int option_A;
@property(nonatomic) int option_B;
@property(nonatomic) int option_C;
@property(nonatomic)BOOL back_to_game;
@property(nonatomic) int comparator;
@property(nonatomic,strong) UIAlertView* alert;
@property(nonatomic,strong) NSMutableArray* data_read;
@property(nonatomic,strong) NSDate* current;
@property(nonatomic,strong) Sign2* sign_up_Page;
@property(nonatomic) BOOL present_finished;
@property(nonatomic) CGFloat button_option_Width;
@property(nonatomic) CGFloat answer_option_Width;
@property(nonatomic) CGFloat button_GapX;
@property(nonatomic) CGFloat answer_GapX;
@property(nonatomic) CGFloat question_height;
@property(nonatomic) CGFloat button_height;
@property(nonatomic,strong) UIButton* pass;

@property(nonatomic) BOOL C1;
@property(nonatomic) BOOL E1;
@property(nonatomic) BOOL S1;
@property(nonatomic) BOOL F1;

@property(nonatomic,strong) UIButton* exit;
@property(nonatomic) BOOL exit_touched;
@property(nonatomic,strong) UIButton* Score_button;
@property(nonatomic,strong) NSString* timer_message;
@property(nonatomic)int Tracking;
@property(nonatomic) BOOL streak1Got;
@property(nonatomic) BOOL streak2Got;
@property(nonatomic) BOOL streak3Got;
@property(nonatomic) BOOL streak4Got;
@property(nonatomic,strong) NSMutableArray* Achievement_Messages;
@property(nonatomic,strong) UILabel* time_disp;



-(UIButton*) Create_Button_WithFream: (CGRect)frame AndTitle:(NSString*)title AndBackgroundImage:(NSString*)Image_Name OrBackgroundColor:(UIColor*)color2 Andfont:(CGFloat)font AndTitleColor:(UIColor*)color;
-(void)Update_Question_And_Answer_Content;
-(void) Setup_Database;
-(void) Configurate_four_elements:(NSString*)record;
-(void)Update_Question_and_Answer_Configuration:(int)question_switch;
-(void)Setup_Question_and_Answer_Configuration;
-(void)Update_Everything;
-(void) Update_Title_Switch;
-(void) Update_Answer_Content:(int)Question_index And_Chemical_Class: (NSString*)Chemical_class OrSaveNum:(int)saveNum;
-(void) Update_Content_Switch;
-(void) Update_Content_Switch_With_Constraints:(int)constraint And:(int)constraint2;
-(void) Check_Example_Button_With_Answer_Button:(UIButton*)answer;
-(void) Check_Structural_Button_With_Answer_Button:(UIButton*)answer;
-(void) Check_Formula_Button_With_Answer_Button:(UIButton*)answer;
-(void) Check_Chemical_Class_Button_With_Answer_Button:(UIButton*)answer;
-(void) soundEffect;
-(void) ResetEverything;
-(void) BaseSetup;
-(void)Data_Transmit_to_Local_File;
-(void)Read_Data_From_Local_File;
-(int)Find_Maximum_Value;
-(void)Touch_Delay;
-(void)Go_Back;
-(void)Post_Achievement_Message1;
-(void)Post_Achievement_Message2;

@end
