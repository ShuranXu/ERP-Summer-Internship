//
//  View1.m
//  One-minute APP
//
//  Created by Shuran Xu on 2015-05-21.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import "View1.h"

@interface View1 ()

@end

@implementation View1

#define chemical_class_count  0
#define formula_count 1
#define structural_form_count  2
#define example_count  3

#define chemical_class_option 11
#define formula_option 12
#define structural_option 13
#define example_option 14


#define A_level 40
#define B_level 30
#define C_level 20


@synthesize formula = _formula;
@synthesize example = _example;
@synthesize chemical_class = _chemical_class;
@synthesize chemical_class_Array = _chemical_class_Array;
@synthesize example_dic = _example_dic;
@synthesize formula_dic = _formula_dic;
@synthesize structural_dic = _structural_dic;
@synthesize time_display = _time_display;
@synthesize my_timer = _my_timer;
@synthesize time_counter = _time_counter;
@synthesize title_container = _title_container;
@synthesize title_switch = _title_switch;
@synthesize question_counter = _question_counter;
@synthesize content_switch = _content_switch;
@synthesize score = _score;
@synthesize score_counter = _score_counter;
@synthesize correctness_switch = _correctness_switch;
@synthesize save = _save;
@synthesize is_Answer = _is_Answer;
@synthesize Question_Done = _Question_Done;
@synthesize Question_Correct = _Question_Correct;
@synthesize answer_A = _answer_A;
@synthesize answer_B = _answer_B;
@synthesize answer_C = _answer_C;
@synthesize option_A = _option_A;
@synthesize option_B = _option_B;
@synthesize option_C = _option_C;
@synthesize back_to_game = _back_to_game;
@synthesize comparator = _comparator;
@synthesize alert = _alert;
@synthesize data_read = _data_read;
@synthesize current = _current;
@synthesize sign_up_Page = _sign_up_Page;
@synthesize present_finished = _present_finished;
@synthesize button_height = _button_height;
@synthesize question_height = _question_height;
@synthesize button_GapX = _button_GapX;
@synthesize answer_GapX = _answer_GapX;
@synthesize answer_option_Width = _answer_option_Width;
@synthesize button_option_Width = _button_option_Width;
@synthesize pass = _pass;
@synthesize C1 = _C1;
@synthesize S1 = _S1;
@synthesize E1 = _E1;
@synthesize F1 = _F1;
@synthesize Score_button = _Score_button;
@synthesize exit = _exit;
@synthesize exit_touched = _exit_touched;
@synthesize timer_message = _timer_message;
@synthesize Tracking = _Tracking;
@synthesize streak1Got = _streak1Got;
@synthesize streak2Got = _streak2Got;
@synthesize streak3Got = _streak3Got;
@synthesize streak4Got = _streak4Got;
@synthesize Achievement_Messages = _Achievement_Messages;
@synthesize time_disp = _time_disp;
@synthesize chemical_class_Dic = _chemical_class_Dic;

- (instancetype)initWithNibName:(NSString *)nibName
                         bundle:(NSBundle *)nibBundle
{
    self = [super initWithNibName:nibName bundle:nibBundle];
    if(self)
    {
      
        self.score = nil;
        self.pass = nil;
        self.my_timer = nil;
        self.time_display = nil;
        self.time_counter = 60;
        self.title_switch = 0;
        self.question_counter = 0;
        self.content_switch = 0;
        self.correctness_switch = 0;
        self.score_counter = 0;
        self.save = 0;
        self.is_Answer = 1;
        self.Question_Done = false;
        self.Question_Correct = false;
        self.option_C = 0;
        self.option_B = 0;
        self.option_A = 0;
        self.back_to_game = false;
        self.comparator = 0;
        self.sign_up_Page = nil;
        self.present_finished = false;
        self.exit_touched = false;
        self.F1 = false;
        self.E1 = false;
        self.S1 = false;
        self.C1 = false;
        self.Tracking = 0;
        self.streak1Got = false;
        self.streak2Got = false;
        self.streak3Got = false;
        self.streak4Got = false;
        self.Achievement_Messages = [[NSMutableArray alloc]init];
        }
    return self;
}


-(UIButton*) Create_Button_WithFream: (CGRect)frame AndTitle:(NSString*)title AndBackgroundImage:(NSString*)Image_Name OrBackgroundColor:(UIColor*)color2 Andfont:(CGFloat)font AndTitleColor:(UIColor*)color
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    if(title != nil)
        [button setTitle:title forState:UIControlStateNormal];
    if(Image_Name !=nil)
        [button setBackgroundImage:[UIImage imageNamed:Image_Name] forState:UIControlStateNormal];
    button.layer.cornerRadius = 5;
    if(font != 0)
    {
        [button.titleLabel setFont:[UIFont fontWithName:@"Avenir" size:font]];
    }
    if(color != nil)
        [button setTitleColor:[UIColor colorWithCIColor:[[CIColor alloc]initWithColor:color]] forState:UIControlStateNormal];
    if(color2 !=nil)
        [button setBackgroundColor:[UIColor colorWithCIColor:[[CIColor alloc]initWithColor:color2]]];
    button.layer.opacity = 0.9;
    //By default, the button is not hidden:
    button.hidden = NO;
    [self.view addSubview:button];
    return button;
    
}

-(UIButton*) Create_Chemical_Class_Button_WithFream: (CGRect)frame AndTitle:(NSString*)title AndBackgroundImage:(NSString*)Image_Name OrBackgroundColor:(UIColor*)color2 Andfont:(CGFloat)font AndTitleColor:(UIColor*)color
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    if(title != nil)
        [button setTitle:title forState:UIControlStateNormal];
    if(Image_Name !=nil)
        [button setBackgroundImage:[UIImage imageNamed:Image_Name] forState:UIControlStateNormal];
    button.layer.cornerRadius = 5;
    if(font != 0)
    {
        [button.titleLabel setFont:[UIFont systemFontOfSize:font]];
    }
    if(color != nil)
        [button setTitleColor:[UIColor colorWithCIColor:[[CIColor alloc]initWithColor:color]] forState:UIControlStateNormal];
    if(color2 !=nil)
        [button setBackgroundColor:[UIColor colorWithCIColor:[[CIColor alloc]initWithColor:color2]]];
    button.layer.opacity = 0.9;
    //By default, the button is not hidden:
    button.hidden = NO;
    [self.view addSubview:button];
    return button;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self BaseSetup];
    [self Setup_Database];
    [self Setup_Question_and_Answer_Configuration];
    
    
}

-(void) BaseSetup
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    //Setup the time-display button: note that the button title will be updated every second.
    NSString* message = [NSString stringWithFormat:@"Time:"];
    if(self.time_display == nil)
        self.time_display = [self Create_Button_WithFream:CGRectMake(delegate.WIDTH*0.5, delegate.HEIGHT*0.05,delegate.WIDTH*0.2, delegate.HEIGHT*0.05) AndTitle:message AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor blackColor]];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.time_display.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    
    //Setup the timer:
    if(self.my_timer == nil)
        self.my_timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(Update_Timing:) userInfo:self repeats:YES];
    
    self.time_disp = [[UILabel alloc]initWithFrame:CGRectMake(delegate.WIDTH*0.7, delegate.HEIGHT*0.05,delegate.WIDTH*0.2, delegate.HEIGHT*0.05)];
    self.time_disp.text = [NSString stringWithFormat:@"01:00"];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.time_disp setFont:[UIFont systemFontOfSize:30]];
    }
    [self.view addSubview:self.time_disp];
    
    //Setup the score button:
    NSString* message1 = [NSString stringWithFormat:@"Score: "];
    if(self.score == nil)
        self.score = [self Create_Button_WithFream:CGRectMake(delegate.WIDTH*0.4, delegate.HEIGHT*0.92,delegate.WIDTH*0.2, delegate.HEIGHT*0.05) AndTitle:message1 AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor blackColor]];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.score.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    
    //Setup the pass button:
    NSString* message2 = [NSString stringWithFormat:@"PASS"];
    if(self.pass == nil)
        self.pass = [self Create_Button_WithFream:CGRectMake(delegate.WIDTH*0.1, delegate.HEIGHT*0.84,delegate.WIDTH*0.8, delegate.HEIGHT*0.06) AndTitle:message2 AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor blackColor]];
    self.pass.layer.cornerRadius = 10;
    self.pass.layer.borderWidth = delegate.WIDTH*0.005;
    self.pass.layer.masksToBounds = YES;
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.pass.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    [self.pass addTarget:self action:@selector(Pass_Clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //Setup the score button:
    self.Score_button = [self Create_Button_WithFream:CGRectMake(delegate.WIDTH*0.6, delegate.HEIGHT*0.92,delegate.WIDTH*0.2, delegate.HEIGHT*0.05)AndTitle:[NSString stringWithFormat:@"%d",self.score_counter] AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:30 AndTitleColor:[UIColor blackColor]];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.Score_button.titleLabel setFont:[UIFont systemFontOfSize:35]];
    }
    
    //Setup the exit button:
    self.exit = [self Create_Button_WithFream:CGRectMake(delegate.WIDTH*0.1, delegate.HEIGHT*0.05,delegate.WIDTH*0.2, delegate.HEIGHT*0.05) AndTitle:[NSString stringWithFormat:@"Exit"] AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor blackColor]];
    self.exit.layer.cornerRadius = 10;
    self.exit.layer.borderWidth = delegate.WIDTH*0.005;
    self.exit.layer.masksToBounds = YES;
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.exit.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    [self.exit addTarget:self action:@selector(EXIT_CLIKED:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //Setup the sign-up page:
    self.sign_up_Page = [[Sign2 alloc]initWithNibName:nil bundle:nil];
    
}

-(void)EXIT_CLIKED:(id)sender
{
    self.exit_touched = true;
    [self dismissViewControllerAnimated:NO completion:nil];
}


- (void)viewWillAppear:(BOOL)animated
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
      if(delegate.going_back)
    {
        delegate.going_back = false;
        [self dismissViewControllerAnimated:NO completion:nil];
        return;
    }
    if(self.exit_touched)
    {
        self.exit_touched = false;
    }
    [super viewWillAppear:YES];
    if(self.back_to_game)
    {
        self.back_to_game = false;
    }
   [self ResetEverything];
    
}

-(void)Update_Time_Display
{
    if(self.time_counter<10)
    {
        self.timer_message = [NSString stringWithFormat:@"00:0%d",self.time_counter];
        self.time_disp.text = self.timer_message;
        return;
    }
    else if(self.time_counter>10)
    {
        self.timer_message = [NSString stringWithFormat:@"00:%d",self.time_counter];
        self.time_disp.text = self.timer_message;
        return;
        
    }
    else if (self.time_counter == 60)
    {
        self.timer_message = [NSString stringWithFormat:@"01:00"];
        self.time_disp.text = self.timer_message;
        return;
    }
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSString* choosen=[alertView buttonTitleAtIndex:buttonIndex];
    if([choosen isEqualToString:@"Restart"])
    {
        self.present_finished = false;
        [self ResetEverything];
        
    }
    else if([choosen isEqualToString:@"Quit"])
    {
        [self Read_Data_From_Local_File];
        [self Data_Transmit_to_Local_File];
        self.back_to_game = true;
         self.present_finished = false;
        [self dismissViewControllerAnimated:NO completion:nil];
    }
    else if([choosen isEqualToString:@"Sign up"])
    {
        [self Read_Data_From_Local_File];
        [self Data_Transmit_to_Local_File];
        delegate.check_h = true;
        delegate.going_back = true;
        delegate.store_name1 = true;
        delegate.store_name2 = false;
        [self presentViewController:self.sign_up_Page animated:NO completion:nil];
    }
}


-(void)Go_Back
{
    [self dismissViewControllerAnimated:NO completion:nil];
}


-(void) ResetEverything
{
    self.time_counter = 60;
    self.title_switch = 0;
    self.question_counter = 0;
    self.content_switch = 0;
    self.correctness_switch = 0;
    self.score_counter = 0;
    self.save = 0;
    self.is_Answer = 0;
    self.Question_Done = false;
    self.Question_Correct = false;
    self.option_C = 0;
    self.option_B = 0;
    self.option_A = 0;
    self.Tracking = 0;
    self.streak1Got = false;
    self.streak2Got = false;
    self.streak3Got = false;
    self.streak4Got = false;
    self.timer_message = [NSString stringWithFormat:@"01:00"];
    self.time_disp.text = self.timer_message;
    [self.my_timer setFireDate:[NSDate distantPast]];
    [self Update_Everything];

}
-(void) Score_Button_Animation
{
    CABasicAnimation *theAnimation;
    theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    theAnimation.duration=0.5;
    theAnimation.repeatCount=0.0;
    theAnimation.autoreverses=NO;
    theAnimation.fromValue=[NSNumber numberWithFloat:1.0];
    theAnimation.toValue=[NSNumber numberWithFloat:2];
    theAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.Score_button.layer addAnimation:theAnimation forKey:nil];
    
}

-(void)Aninimation_Start_With_Button:(UIButton*)button
{
    CABasicAnimation *theAnimation;
    theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    theAnimation.duration=0.5;
    theAnimation.repeatCount=0.0;
    theAnimation.autoreverses=NO;
    theAnimation.fromValue=[NSNumber numberWithFloat:1.0];
    theAnimation.toValue=[NSNumber numberWithFloat:1.2];
    theAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [button.layer addAnimation:theAnimation forKey:nil];
}

-(void)Pass_Clicked:(id)sender
{
     AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(!delegate.sound_off)
        [self Pass_Sound];
    self.Question_Done = true;
    [self Aninimation_Start_With_Button:self.pass];
}


-(void)Time_Display_Animation
{
    CABasicAnimation *theAnimation;
    theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    theAnimation.duration=0.5;
    theAnimation.repeatCount=0.0;
    theAnimation.autoreverses=NO;
    theAnimation.fromValue=[NSNumber numberWithFloat:1.0];
    theAnimation.toValue=[NSNumber numberWithFloat:2];
    theAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.time_disp.layer addAnimation:theAnimation forKey:nil];
    
}


-(void)Update_Timing:(id)sender
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(!self.exit_touched)
    {
        if(self.time_counter > 0)
        {
            self.time_counter = self.time_counter - 1;
            [self Update_Time_Display];
            if(self.time_counter <= 5)
            {
                [self Time_Display_Animation];
                if(!delegate.sound_off)
                [self soundEffect];
            }
        if(self.Question_Done)
            [self Update_Everything];
    }
    else
    {
        [self.my_timer setFireDate:[NSDate distantFuture]];
        [self Post_Achievement_Message1];
        [self Post_Achievement_Message2];
        AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        delegate.store_name1 = true;
        delegate.store_name2 = false;
        NSString* level;
        if(self.score_counter <= C_level)
            level = @" You are at C level !";
        else if(self.score_counter > C_level && self.score_counter <= B_level)
            level = @" You are at B level !";
        else
            level = @" You are at A level !";
            NSString* end = [NSString stringWithFormat:@"Your Score is %d",self.score_counter];
            NSString* msg = [NSString stringWithFormat:@"Congratulations! You just got the highest score!"];
        if(self.comparator < self.score_counter)
        {
            delegate.best_score1 = self.score_counter;
            [delegate.user_defaut setInteger:self.score_counter forKey:@"Highest Score1"];
        
            //Setup the alert view:
            self.alert = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:@"Restart" otherButtonTitles:@"Quit",@"Sign up",nil];
            self.alert.delegate = self;
            self.alert.title = msg;
            self.alert.message = [NSString stringWithFormat:@"Check out the leaderboard if you have signed up!"];
            if(!delegate.sound_off)
                [self soundEffect2];
        }
        else
        {
            //Setup the alert view:
            self.alert = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:@"Restart" otherButtonTitles:@"Quit",nil];
            self.alert.delegate = self;
            self.alert.title = end;
            self.alert.message = level;
        }
        [self.alert show];
    }
    }
}

//缺少能够展示大量文字的class/method!一会儿研究。

-(void)Post_Achievement_Message1
{
    if(self.streak1Got)
        [self.Achievement_Messages addObject:[NSString stringWithFormat:@"10 in a row no error"]];
    if(self.streak2Got)
        [self.Achievement_Messages addObject:[NSString stringWithFormat:@"20 in a row no error"]];
    if(self.streak3Got)
        [self.Achievement_Messages addObject:[NSString stringWithFormat:@"40 in a row no error"]];
    if(self.streak4Got)
        [self.Achievement_Messages addObject:[NSString stringWithFormat:@"100 in a row no error"]];
    
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    delegate.Hard_Steak1_Got = self.streak1Got;
    delegate.Hard_Steak2_Got = self.streak2Got;
    delegate.Hard_Steak3_Got = self.streak3Got;
    delegate.Hard_Steak4_Got = self.streak4Got;
}

-(void)Post_Achievement_Message2
{
    if(self.score_counter>=10)
    {
        [self.Achievement_Messages addObject:[NSString stringWithFormat:@"First time to reach 10"]];
    }
    if(self.score_counter>=20)
    {
        [self.Achievement_Messages addObject:[NSString stringWithFormat:@"First time to reach 20"]];
    }
    if(self.score_counter>=40)
    {
        [self.Achievement_Messages addObject:[NSString stringWithFormat:@"First time to reach 40"]];
    }
    if(self.score_counter>=100)
    {
        [self.Achievement_Messages addObject:[NSString stringWithFormat:@"First time to reach 100"]];
    }
}



-(void)Correct_Sound
{
    //Find the path:
    NSString* path=[[NSBundle mainBundle]pathForResource:@"correct" ofType:@"wav"];
    if(path != NULL)
    {
        SystemSoundID soundID;//A system sound object, identified with a sound file you want to play.
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:path]), &soundID);//Creates a system sound object.
        AudioServicesPlaySystemSound(soundID);
    }
}

-(void)Wrong_Sound
{
    //Find the path:
    NSString* path=[[NSBundle mainBundle]pathForResource:@"wrong" ofType:@"wav"];
    if(path != NULL)
    {
        SystemSoundID soundID;//A system sound object, identified with a sound file you want to play.
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:path]), &soundID);//Creates a system sound object.
        AudioServicesPlaySystemSound(soundID);
    }
}

-(void)Pass_Sound
{
    //Find the path:
    NSString* path=[[NSBundle mainBundle]pathForResource:@"pass" ofType:@"wav"];
    if(path != NULL)
    {
        SystemSoundID soundID;//A system sound object, identified with a sound file you want to play.
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:path]), &soundID);//Creates a system sound object.
        AudioServicesPlaySystemSound(soundID);
    }

}


-(void)soundEffect2
{
    //Find the path:
    NSString* path=[[NSBundle mainBundle]pathForResource:@"11" ofType:@"wav"];
    if(path != NULL)
    {
        SystemSoundID soundID;//A system sound object, identified with a sound file you want to play.
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:path]), &soundID);//Creates a system sound object.
        AudioServicesPlaySystemSound(soundID);
    }
}


-(void)Read_Data_From_Local_File
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);//Creates a list of directory search paths.
    NSString* documentsDirPath = [paths objectAtIndex:0];//Obtain the path for Documents directory.
    NSString* DirPath = [documentsDirPath stringByAppendingPathComponent:@"Score1"];//Create an new path under "Document" directory.
    NSString* FilePath = [DirPath stringByAppendingPathComponent:@"score1.txt"];//Create a path for the text file for the saving data under "Document" directory.
    
    NSError* error;
    //Read data from the local file:
    NSString* nameInfoString = [NSString stringWithContentsOfFile:FilePath encoding:NSUTF8StringEncoding error:&error];
    if(nameInfoString != nil)
    {
        self.data_read = [[NSMutableArray alloc]initWithArray:[nameInfoString componentsSeparatedByString:@","]]; //self.data_read stores strings!!!
        self.comparator = [self Find_Maximum_Value];
        NSString* delete_one = [self.data_read lastObject];
        if([delete_one isEqualToString:[NSString stringWithFormat:@""]])
            [self.data_read removeObjectAtIndex:[self.data_read count]-1];
    }
    else
    {
        self.comparator = 0;
        self.data_read = [[NSMutableArray alloc]init];
    }
}

-(int)Find_Maximum_Value
{
    int temp = 0;
    for(NSString* ele in self.data_read)
    {
        int temp2 = [ele intValue];
        if(temp2>temp)
            temp = temp2;
    }
    return temp;
}


-(void)Data_Transmit_to_Local_File
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);//Creates a list of directory search paths.
    NSString* documentsDirPath = [paths objectAtIndex:0];//Obtain the path for Documents directory.
    NSString* DirPath = [documentsDirPath stringByAppendingPathComponent:@"Score1"];//Create an new path under "Document" directory.
    NSString* FilePath = [DirPath stringByAppendingPathComponent:@"score1.txt"];//Create a path for the text file for the saving data under "Document" directory.
    
    NSLog(@"%@",FilePath);
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    BOOL isDirectory;
    //Check if 'AppHome/Documents/Products/product.txt' file exists or not:
    if(![fileManager fileExistsAtPath:FilePath isDirectory:&isDirectory])
    {
        //If the file is non-exist, we need to create the corresponding directory under Document directory:
        
        NSError* error = nil;
        //Create "Names" directory under Document directory:
        if(![fileManager createDirectoryAtPath:DirPath
                   withIntermediateDirectories:YES attributes:nil error:&error])
        {
            printf("Fail to create directory:\n%s\n", [[error description] UTF8String]);
            return;
        }
    }

           // Transfer elements of score data into NSString type data:
    
        [self.data_read addObject:[NSString stringWithFormat:@"%d",self.score_counter]];
    
        NSMutableString* scoreInfoString = [[NSMutableString alloc]init];
        for(NSString* ele in self.data_read)
        {
            [scoreInfoString appendFormat:@"%@",ele];
            [scoreInfoString appendFormat:@","];
            
        }
    
        //Encode productInfoString, and save it in our new file:
        NSData* nameData = [scoreInfoString dataUsingEncoding:NSUTF8StringEncoding];//Returns an NSData object containing a representation of the receiver encoded using a given encoding.
    
        if(![fileManager createFileAtPath:FilePath contents:nameData attributes:nil])
        {
            printf("Fail to create file to store data");
            return;
        }
}


-(void)soundEffect
{
    //Find the path:
    NSString* path=[[NSBundle mainBundle]pathForResource:@"click" ofType:@"wav"];
    if(path != NULL)
    {
        SystemSoundID soundID;//A system sound object, identified with a sound file you want to play.
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:path]), &soundID);//Creates a system sound object.
        AudioServicesPlaySystemSound(soundID);
    }
}


-(void)Update_Everything
{
    [self Touch_Delay];
    self.option_C = 0;
    self.option_B = 0;
    self.option_A = 0;
     self.is_Answer = 0;
    self.Question_Correct = false;
    self.Question_Done = false;
    self.question_counter++;
    [self Reset_Answers_Background_Color];
    //Update the title_switch:
    [self Update_Title_Switch];
    [self Update_Question_and_Answer_Configuration:self.title_switch];
    [self Update_Question_And_Answer_Content];
    //Update the score:
    [self.Score_button setTitle:[NSString stringWithFormat:@"%d",self.score_counter] forState:UIControlStateNormal];
    [self.view reloadInputViews];
}

-(void)Reset_Answers_Background_Color
{
    [self.answer_A  setBackgroundColor:[UIColor clearColor]];
    [self.answer_A setTitle:@"A" forState:UIControlStateNormal];
    [self.answer_A setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.answer_B  setBackgroundColor:[UIColor clearColor]];
    [self.answer_B setTitle:@"B" forState:UIControlStateNormal];
    [self.answer_B setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.answer_C setTitle:@"C" forState:UIControlStateNormal];
    [self.answer_C  setBackgroundColor:[UIColor clearColor]];
    [self.answer_C setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}


-(void)Setup_Question_and_Answer_Configuration
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.answer_option_Width = delegate.WIDTH*0.2;
    self.answer_GapX = delegate.WIDTH*0.1;
    self.question_height = delegate.HEIGHT*0.05;

    self.answer_A = [self Create_Button_WithFream:CGRectMake(self.answer_GapX, delegate.HEIGHT*0.33, delegate.WIDTH*0.25,delegate.WIDTH*0.2) AndTitle:@"A" AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor blackColor]];
    [self.answer_A addTarget:self action:@selector(answer_A_clicked:) forControlEvents:UIControlEventTouchUpInside];
    self.answer_A.layer.cornerRadius = 10;
    self.answer_A.layer.borderWidth = delegate.WIDTH*0.005;
    self.answer_A.layer.masksToBounds = YES;
    
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.answer_A.titleLabel setFont:[UIFont systemFontOfSize:35]];
    }
    
    self.answer_B = [self Create_Button_WithFream:CGRectMake(self.answer_GapX, delegate.HEIGHT*0.51, delegate.WIDTH*0.25,delegate.WIDTH*0.2) AndTitle:@"B" AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor blackColor]];
    [self.answer_B addTarget:self action:@selector(answer_B_clicked:) forControlEvents:UIControlEventTouchUpInside];
    self.answer_B.layer.cornerRadius = 10;
    self.answer_B.layer.borderWidth = delegate.WIDTH*0.005;
    self.answer_B.layer.masksToBounds = YES;
    
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.answer_B.titleLabel setFont:[UIFont systemFontOfSize:35]];
    }
    
    self.answer_C = [self Create_Button_WithFream:CGRectMake(self.answer_GapX, delegate.HEIGHT*0.68, delegate.WIDTH*0.25,delegate.WIDTH*0.2) AndTitle:@"C" AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor blackColor]];
    [self.answer_C addTarget:self action:@selector(answer_C_clicked:) forControlEvents:UIControlEventTouchUpInside];
    self.answer_C.layer.cornerRadius = 10;
    self.answer_C.layer.borderWidth = delegate.WIDTH*0.005;
    self.answer_C.layer.masksToBounds = YES;
    
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.answer_C.titleLabel setFont:[UIFont systemFontOfSize:35]];
    }
    
    [self.view addSubview:self.answer_A];
    [self.view addSubview:self.answer_B];
    [self.view addSubview:self.answer_C];

    
    NSString* record = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:0]];
    
    //Create 4 buttons for example, chemical class, formula and structural formula:
    [self Configurate_four_elements:record];
    
}

-(void) Configurate_four_elements:(NSString*)record
{
    
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.button_option_Width = delegate.WIDTH*0.55;
    self.button_GapX = delegate.WIDTH*0.4;
    self.button_height = delegate.HEIGHT*0.05;
    CGFloat butonBCHeight = delegate.HEIGHT*0.1;
/*
 
 Q: CGRectMake(self.button_GapX,delegate.HEIGHT*0.2,self.button_option_Width,delegate.HEIGHT*0.05)
 
 A: CGRectMake(self.button_GapX,delegate.HEIGHT*0.3,self.button_option_Width,delegate.HEIGHT*0.1)
 
 B: CGRectMake(self.button_GapX,delegate.HEIGHT*0.5,self.button_option_Width,delegate.HEIGHT*0.1)
 
 C: CGRectMake(self.button_GapX,delegate.HEIGHT*0.7,self.button_option_Width,delegate.HEIGHT*0.1)
 
 */
    //Setup chemical class button: By default, this will be the first question.
    
   self.chemical_class = [self Create_Chemical_Class_Button_WithFream:CGRectMake(delegate.WIDTH*0.1,delegate.WIDTH*0.24,delegate.WIDTH*0.8,delegate.WIDTH*0.25) AndTitle:[NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]] AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:25 AndTitleColor:[UIColor blackColor]];
    
    if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
        CGFloat r = (CGFloat) 192/255;
        CGFloat g = (CGFloat) 192/255;
        CGFloat b = (CGFloat) 192/255;
        CGFloat a = (CGFloat) 1.0;
        CGFloat components[4] = {r,g,b,a};
        CGColorRef color = CGColorCreate(colorSpaceRef,components);
        self.chemical_class.layer.borderColor = color;
        self.chemical_class.frame = CGRectMake(delegate.WIDTH*0.1,delegate.WIDTH*0.23,delegate.WIDTH*0.8,delegate.WIDTH*0.15);
        [self.chemical_class.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    else
    {
        self.chemical_class.layer.borderWidth = delegate.WIDTH*0.005;
        self.chemical_class.layer.masksToBounds = YES;
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
        CGFloat r = (CGFloat) 255/255;
        CGFloat g = (CGFloat) 255/255;
        CGFloat b = (CGFloat) 255/255;
        CGFloat a = (CGFloat) 1.0;
        CGFloat components[4] = {r,g,b,a};
        CGColorRef color = CGColorCreate(colorSpaceRef,components);
        self.chemical_class.layer.borderColor = color;
    }
    
    //Setup formula button:
    self.formula = [self Create_Button_WithFream:CGRectMake(self.button_GapX,delegate.HEIGHT*0.35,self.button_option_Width,butonBCHeight) AndTitle:nil
                              AndBackgroundImage:[NSString stringWithString:[self.formula_dic objectForKey:record]] OrBackgroundColor:nil Andfont:0 AndTitleColor:nil];
    [self.formula addTarget:self action:@selector(formula_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.formula.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    
    //Setup structural_formula button:
    self.structural_formula = [self Create_Button_WithFream: CGRectMake(self.button_GapX,delegate.HEIGHT*0.5,self.button_option_Width,butonBCHeight) AndTitle:nil
                                         AndBackgroundImage: [NSString stringWithString:[self.structural_dic objectForKey:record]]OrBackgroundColor:nil Andfont:0 AndTitleColor:nil];
    
    [self.structural_formula addTarget:self action:@selector(structural_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.structural_formula.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    
    //Setup example button:
    self.example = [self Create_Button_WithFream: CGRectMake(self.button_GapX,delegate.HEIGHT*0.7,self.button_option_Width,butonBCHeight) AndTitle:nil AndBackgroundImage:[NSString stringWithString:[self.example_dic objectForKey:record]] OrBackgroundColor:nil Andfont:0 AndTitleColor:nil];
    [self.example addTarget:self action:@selector(example_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.example.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    
    self.option_A = formula_option;
    self.option_B = structural_option;
    self.option_C = example_option;

}

//Create a time delay: setup two NSDate instance, using methods: date and dateWithTimeInterval: sinceDate: , so that the comparison of NSDate object can be applied here.

-(void) Touch_Delay
{
    [NSThread sleepForTimeInterval:0.25];
    
}


-(void)Update_Buttons_Statues:(int)question_switch
{
    switch (question_switch) {
        case 0: //self.Chemical_class
        {
            [self.chemical_class removeTarget:self action:@selector(chemical_class_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.example addTarget:self action:@selector(example_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.formula addTarget:self action:@selector(formula_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
             [self.structural_formula addTarget:self action:@selector(structural_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        case 1: // self.formula
        {
            [self.chemical_class addTarget:self action:@selector(chemical_class_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.example addTarget:self action:@selector(example_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.formula removeTarget:self action:@selector(formula_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.structural_formula addTarget:self action:@selector(structural_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        case 2:// self.structural_formula
        {
            [self.chemical_class addTarget:self action:@selector(chemical_class_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.example addTarget:self action:@selector(example_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.formula addTarget:self action:@selector(formula_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.structural_formula removeTarget:self action:@selector(structural_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
            break;

        }
        case 3:
        {
            [self.chemical_class addTarget:self action:@selector(chemical_class_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.example removeTarget:self action:@selector(example_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.formula addTarget:self action:@selector(formula_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.structural_formula addTarget:self action:@selector(structural_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
            
        default:
            break;
    }
    
}

-(void)Update_Events_Set:(int)question_switch
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    switch (question_switch)
    {
        case 0: //self.Chemical_class
        {
            self.chemical_class.frame = CGRectMake(delegate.WIDTH*0.1,delegate.WIDTH*0.25,delegate.WIDTH*0.8,delegate.WIDTH*0.25);
            self.chemical_class.layer.borderWidth = delegate.WIDTH*0.005;
            self.chemical_class.layer.masksToBounds = YES;
            CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
            CGFloat r = (CGFloat) 255/255;
            CGFloat g = (CGFloat) 255/255;
            CGFloat b = (CGFloat) 255/255;
            CGFloat a = (CGFloat) 1.0;
            CGFloat components[4] = {r,g,b,a};
            CGColorRef color = CGColorCreate(colorSpaceRef,components);
            self.chemical_class.layer.borderColor = color;
            break;
        }
        case 1:
        {
            CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
            CGFloat r = (CGFloat) 255/255;
            CGFloat g = (CGFloat) 255/255;
            CGFloat b = (CGFloat) 255/255;
            CGFloat a = (CGFloat) 1.0;
            CGFloat components[4] = {r,g,b,a};
            CGColorRef color = CGColorCreate(colorSpaceRef,components);
            self.chemical_class.layer.borderColor = color;
            break;
        }
        case 2:
        {
            CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
            CGFloat r = (CGFloat) 255/255;
            CGFloat g = (CGFloat) 255/255;
            CGFloat b = (CGFloat) 255/255;
            CGFloat a = (CGFloat) 1.0;
            CGFloat components[4] = {r,g,b,a};
            CGColorRef color = CGColorCreate(colorSpaceRef,components);
            self.chemical_class.layer.borderColor = color;
            break;
        }
        case 3:
        {
            CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
            CGFloat r = (CGFloat) 255/255;
            CGFloat g = (CGFloat) 255/255;
            CGFloat b = (CGFloat) 255/255;
            CGFloat a = (CGFloat) 1.0;
            CGFloat components[4] = {r,g,b,a};
            CGColorRef color = CGColorCreate(colorSpaceRef,components);
            self.chemical_class.layer.borderColor = color;
            break;
        }
    
        default:
            break;
    }
}

-(void)Update_Question_and_Answer_Configuration:(int)question_switch
{
    
    self.chemical_class.hidden = NO;
    self.structural_formula.hidden = NO;
    self.formula.hidden = NO;
    self.example.hidden = NO;
    
    [self Update_Buttons_Statues:question_switch];
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [self Update_Events_Set:question_switch];
    switch (question_switch)
    {
        case 0: //self.Chemical_class
        {
            /* A. formula
               B. structural form
               C. example
             */
            
            self.option_A = formula_option;
            self.option_B = structural_option;
            self.option_C = example_option;
            
            //Q:
            if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
                /*@property(nonatomic, readonly) UIUserInterfaceIdiom userInterfaceIdiom
                 Description:
                 The style of interface to use on the current device. (read-only)
                 
                 UIUserInterfaceIdiomPad: The user interface should be designed for iPad.*/
                
                CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
                CGFloat r = (CGFloat) 192/255;
                CGFloat g = (CGFloat) 192/255;
                CGFloat b = (CGFloat) 192/255;
                CGFloat a = (CGFloat) 1.0;
                CGFloat components[4] = {r,g,b,a};
                CGColorRef color = CGColorCreate(colorSpaceRef,components);
                self.chemical_class.layer.borderColor = color;
                self.chemical_class.frame = CGRectMake(delegate.WIDTH*0.1,delegate.WIDTH*0.23,delegate.WIDTH*0.8,delegate.WIDTH*0.15);
                
                    [self.chemical_class.titleLabel setFont:[UIFont systemFontOfSize:30]];
                
                }
           else
            self.chemical_class.frame = CGRectMake(delegate.WIDTH*0.1,delegate.WIDTH*0.24,delegate.WIDTH*0.8,delegate.WIDTH*0.25);
            [self.chemical_class setTitle:nil forState:UIControlStateNormal];
            
            self.formula.frame = CGRectMake(self.button_GapX,delegate.HEIGHT*0.35,self.button_option_Width,delegate.HEIGHT*0.1);
            
            
            self.structural_formula.frame = CGRectMake(self.button_GapX,delegate.HEIGHT*0.5,self.button_option_Width,delegate.HEIGHT*0.1);
            
            self.example.frame = CGRectMake(self.button_GapX,delegate.HEIGHT*0.7,self.button_option_Width,delegate.HEIGHT*0.1);
            
            break;
            
        }
        case 1: // self.formula
        {
            
            /* A. chemical class
                B. Structural form
                c. example */
            
            self.option_A = chemical_class_option;
            self.option_B = structural_option;
            self.option_C = example_option;
            
        //Q:
            
            AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
            if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
                CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
                CGFloat r = (CGFloat) 255/255;
                CGFloat g = (CGFloat) 255/255;
                CGFloat b = (CGFloat) 255/255;
                CGFloat a = (CGFloat) 1.0;
                CGFloat components[4] = {r,g,b,a};
                CGColorRef color = CGColorCreate(colorSpaceRef,components);
                self.formula.layer.borderColor = color;
                
                self.formula.frame = CGRectMake(delegate.WIDTH*0.1,delegate.WIDTH*0.21,delegate.WIDTH*0.8,delegate.WIDTH*0.2);
            }
            else
            self.formula.frame = CGRectMake(delegate.WIDTH*0.1,delegate.WIDTH*0.24,delegate.WIDTH*0.8,delegate.WIDTH*0.25);
            
            self.chemical_class.frame =  CGRectMake(self.button_GapX,delegate.HEIGHT*0.35,self.button_option_Width,delegate.HEIGHT*0.1);
            if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
                [self.chemical_class.titleLabel setFont:[UIFont systemFontOfSize:30]];
            }
            
            self.structural_formula.frame = CGRectMake(self.button_GapX,delegate.HEIGHT*0.5,self.button_option_Width,delegate.HEIGHT*0.1);
            
            self.example.frame = CGRectMake(self.button_GapX,delegate.HEIGHT*0.7,self.button_option_Width,delegate.HEIGHT*0.1);
            break;
            
        }
        case  2: // self.structural_formula
        {
            /* A. formula
             B. chemical class
             c. example */
        
            AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
             

            self.option_A = formula_option;
            self.option_B = chemical_class_option;
            self.option_C = example_option;
            
            /* Ans_A:CGRectMake(self.answer_GapX, delegate.HEIGHT*0.35, self.answer_option_Width, delegate.HEIGHT*0.05)
             
             Ans_B: CGRectMake(self.answer_GapX, delegate.HEIGHT*0.53, self.answer_option_Width, answer_height)
             
             Ans_C: CGRectMake(self.answer_GapX, delegate.HEIGHT*0.73, self.answer_option_Width, answer_height)
             */
            if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
                CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
                CGFloat r = (CGFloat) 255/255;
                CGFloat g = (CGFloat) 255/255;
                CGFloat b = (CGFloat) 255/255;
                CGFloat a = (CGFloat) 1.0;
                CGFloat components[4] = {r,g,b,a};
                CGColorRef color = CGColorCreate(colorSpaceRef,components);
                self.structural_formula.layer.borderColor = color;
                 self.structural_formula.frame = CGRectMake(delegate.WIDTH*0.1,delegate.WIDTH*0.21,delegate.WIDTH*0.8,delegate.WIDTH*0.2);
            }
            else
             self.structural_formula.frame = CGRectMake(delegate.WIDTH*0.1,delegate.WIDTH*0.24,delegate.WIDTH*0.8,delegate.WIDTH*0.25);
            
            self.formula.frame = CGRectMake(self.button_GapX,delegate.HEIGHT*0.35,self.button_option_Width,delegate.HEIGHT*0.1);
            
            self.chemical_class.frame = CGRectMake(self.button_GapX,delegate.HEIGHT*0.5,self.button_option_Width,delegate.HEIGHT*0.1);
            
            if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
                [self.chemical_class.titleLabel setFont:[UIFont systemFontOfSize:30]];
            }
            
            self.example.frame = CGRectMake(self.button_GapX,delegate.HEIGHT*0.7,self.button_option_Width,delegate.HEIGHT*0.1);
            break;
            
        }
        case 3: // self.example
        {
            /* A. chemical class
             B.  formula
             c. structural form */
            
            self.option_A = chemical_class_option;
            self.option_B = formula_option;
            self.option_C = structural_option;
            
            /*
             
             Q_Class: CGRectMake(self.button_GapX,delegate.HEIGHT*0.2,self.button_option_Width,delegate.HEIGHT*0.05)
             
             A: CGRectMake(self.button_GapX,delegate.HEIGHT*0.35,self.button_option_Width,delegate.HEIGHT*0.1)
             
             B: CGRectMake(self.button_GapX,delegate.HEIGHT*0.5,self.button_option_Width,delegate.HEIGHT*0.1)
             
             C: CGRectMake(self.button_GapX,delegate.HEIGHT*0.7,self.button_option_Width,delegate.HEIGHT*0.1)
             
             */
            
            if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
                CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
                CGFloat r = (CGFloat) 255/255;
                CGFloat g = (CGFloat) 255/255;
                CGFloat b = (CGFloat) 255/255;
                CGFloat a = (CGFloat) 1.0;
                CGFloat components[4] = {r,g,b,a};
                CGColorRef color = CGColorCreate(colorSpaceRef,components);
                self.example.layer.borderColor = color;
                self.example.frame = CGRectMake(delegate.WIDTH*0.1,delegate.WIDTH*0.21,delegate.WIDTH*0.8,delegate.WIDTH*0.2);
            }
            else
             self.example.frame = CGRectMake(delegate.WIDTH*0.1,delegate.WIDTH*0.24,delegate.WIDTH*0.8,delegate.WIDTH*0.25);
            self.chemical_class.frame = CGRectMake(self.button_GapX,delegate.HEIGHT*0.35,self.button_option_Width,delegate.HEIGHT*0.1);
            if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
                [self.chemical_class.titleLabel setFont:[UIFont systemFontOfSize:30]];
            }
            
            self.formula.frame = CGRectMake(self.button_GapX,delegate.HEIGHT*0.5,self.button_option_Width,delegate.HEIGHT*0.1);
            
            self.structural_formula.frame = CGRectMake(self.button_GapX,delegate.HEIGHT*0.7,self.button_option_Width,delegate.HEIGHT*0.1);
            break;
            
        }
}
    
}

-(void)Check_Formula_Button_With_Answer_Button2:(UIButton*)answer
{
    if(self.is_Answer == formula_count)
    {
        [answer setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [answer setBackgroundColor:[UIColor greenColor]];
    }
    else
    {
        [answer setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [answer setBackgroundColor:[UIColor redColor]];
    }
}

-(void)Check_Structural_Button_With_Answer_Button2:(UIButton*)answer
{
    if(self.is_Answer == structural_form_count)
    {
        [answer setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [answer setBackgroundColor:[UIColor greenColor]];
    }
    else
    {
        [answer setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [answer setBackgroundColor:[UIColor redColor]];
    }
}

-(void)Check_Chemical_Class_Button_With_Answer_Button2:(UIButton*)answer
{
    if(self.is_Answer == chemical_class_count)
    {
        [answer setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [answer setBackgroundColor:[UIColor greenColor]];
    }
    else
    {
        [answer setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [answer setBackgroundColor:[UIColor redColor]];
    }
}

-(void)Check_Example_Button_With_Answer_Button2:(UIButton*)answer
{
    if(self.is_Answer == example_count)
    {
        [answer setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [answer setBackgroundColor:[UIColor greenColor]];
    }
    else
    {
        [answer setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [answer setBackgroundColor:[UIColor redColor]];
    }
}

-(void)Checking_Answers_Color
{
    switch (self.title_switch) {
        case 0:
        {        //self.Chemical_class
            
            /* A. formula
             B. structural form
             C. example
             */
            [self Check_Formula_Button_With_Answer_Button2:self.answer_A];
            [self Check_Structural_Button_With_Answer_Button2:self.answer_B];
            [self Check_Example_Button_With_Answer_Button2:self.answer_C];
            break;
        }
        case 1:
        {
            // self.formula
            
            
            /* A. chemical class
             B. Structural form
             c. example */
            [self Check_Chemical_Class_Button_With_Answer_Button2:self.answer_A];
            [self Check_Structural_Button_With_Answer_Button2:self.answer_B];
            [self Check_Example_Button_With_Answer_Button2:self.answer_C];
            break;
        }
        case 2:
        {
            // self.structural_formula
            
            /* A. formula
             B. chemical class
             c. example */
            [self Check_Formula_Button_With_Answer_Button2:self.answer_A];
            [self Check_Chemical_Class_Button_With_Answer_Button2:self.answer_B];
            [self Check_Example_Button_With_Answer_Button2:self.answer_C];
            break;
        }
        case 3:
        {
            // self.example
            
            /* A. chemical class
             B.  formula
             c. structural form */
            [self Check_Chemical_Class_Button_With_Answer_Button2:self.answer_A];
            [self Check_Formula_Button_With_Answer_Button2:self.answer_B];
            [self Check_Structural_Button_With_Answer_Button2:self.answer_C];
            break;
        }
    }

}
-(void)answer_A_clicked:(id)sender
{
     [self.answer_A removeTarget:self action:@selector(answer_A_clicked:) forControlEvents:UIControlEventTouchUpInside];
    switch (self.option_A)
    {
        case chemical_class_option:
        {
            [self Check_Chemical_Class_Button_With_Answer_Button:self.answer_A];
            [self Checking_Answers_Color];
             [self.answer_A addTarget:self action:@selector(answer_A_clicked:) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
       case formula_option:
        {
            [self Check_Formula_Button_With_Answer_Button:self.answer_A];
             [self Checking_Answers_Color];
             [self.answer_A addTarget:self action:@selector(answer_A_clicked:) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
       case structural_option:
        {
           [self Check_Structural_Button_With_Answer_Button:self.answer_A];
             [self Checking_Answers_Color];
             [self.answer_A addTarget:self action:@selector(answer_A_clicked:) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
       case example_option:
        {
            [self Check_Example_Button_With_Answer_Button:self.answer_A];
             [self Checking_Answers_Color];
             [self.answer_A addTarget:self action:@selector(answer_A_clicked:) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
    }
}

-(void)answer_B_clicked:(id)sender
{
    [self.answer_B removeTarget:self action:@selector(answer_B_clicked:) forControlEvents:UIControlEventTouchUpInside];
    switch (self.option_B)
    {
        case chemical_class_option:
        {
            [self Check_Chemical_Class_Button_With_Answer_Button:self.answer_B];
            [self Checking_Answers_Color];
            [self.answer_B addTarget:self action:@selector(answer_B_clicked:) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        case formula_option:
        {
            [self Check_Formula_Button_With_Answer_Button:self.answer_B];
            [self Checking_Answers_Color];
            [self.answer_B addTarget:self action:@selector(answer_B_clicked:) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        case structural_option:
        {
            [self Check_Structural_Button_With_Answer_Button:self.answer_B];
            [self Checking_Answers_Color];
            [self.answer_B addTarget:self action:@selector(answer_B_clicked:) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        case example_option:
        {
            [self Check_Example_Button_With_Answer_Button:self.answer_B];
            [self Checking_Answers_Color];
            [self.answer_B addTarget:self action:@selector(answer_B_clicked:) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
    }
}

-(void)answer_C_clicked:(id)sender
{
    [self.answer_C removeTarget:self action:@selector(answer_C_clicked:) forControlEvents:UIControlEventTouchUpInside];
    switch (self.option_C)
    {
        case chemical_class_option:
        {
            [self Check_Chemical_Class_Button_With_Answer_Button:self.answer_C];
            [self Checking_Answers_Color];
            [self.answer_C addTarget:self action:@selector(answer_C_clicked:) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        case formula_option:
        {
            [self Check_Formula_Button_With_Answer_Button:self.answer_C];
            [self Checking_Answers_Color];
            [self.answer_C addTarget:self action:@selector(answer_C_clicked:) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        case structural_option:
        {
            [self Check_Structural_Button_With_Answer_Button:self.answer_C];
            [self Checking_Answers_Color];
            [self.answer_C addTarget:self action:@selector(answer_C_clicked:) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        case example_option:
        {
            [self Check_Example_Button_With_Answer_Button:self.answer_C];
            [self Checking_Answers_Color];
            [self.answer_C addTarget:self action:@selector(answer_C_clicked:) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
    }
}

-(void)example_button_clicked: (id)sender
{
    self.E1 = true;
     [self.example removeTarget:self action:@selector(example_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self Checking_Answers_Color];
    [self Check_Example_Button_With_Answer_Button:self.example];
}

-(void) structural_button_clicked:(id)sender
{
    self.S1 = true;
    [self.structural_formula removeTarget:self action:@selector(structural_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self Checking_Answers_Color];
    [self Check_Structural_Button_With_Answer_Button:self.structural_formula];
}

-(void)formula_button_clicked:(id)sender
{
    self.F1 = true;
     [self.formula removeTarget:self action:@selector(formula_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self Checking_Answers_Color];
    [self Check_Formula_Button_With_Answer_Button:self.formula];
}

-(void)chemical_class_button_clicked:(id)sender
{
    self.C1 = true;
     [self.chemical_class removeTarget:self action:@selector(chemical_class_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self Checking_Answers_Color];
    [self Check_Chemical_Class_Button_With_Answer_Button:self.chemical_class];
}


-(void) Check_Example_Button_With_Answer_Button:(UIButton *)answer
{
     AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(self.is_Answer == example_count)
    {
        self.Tracking++;
        [self Checking_Achievement1];
        if(!delegate.sound_off)
            [self Correct_Sound];
        [self Aninimation_Start_With_Button:answer];

        self.score_counter = self.score_counter+ 2;
        [self Score_Button_Animation];
        self.Question_Correct = true;
        //Update the score button's title:
         [self.Score_button setTitle:[NSString stringWithFormat:@"%d",self.score_counter] forState:UIControlStateNormal];
    }
    else{
            self.Tracking = 0;
         if(!delegate.sound_off)
        [self Wrong_Sound];
            self.Question_Correct = false;
        if (self.score_counter <= 0)
        {
            self.score_counter = 0;
        }
        else
            self.score_counter = self.score_counter - 1;
        }
    self.Question_Done = true;
    if(self.E1)
    {
        [self.example addTarget:self action:@selector(example_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
        self.E1 = false;
    }

}

-(void) Check_Structural_Button_With_Answer_Button:(UIButton *)answer
{
     AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(self.is_Answer == structural_form_count)
    {
         self.score_counter = self.score_counter+ 2;
        self.Tracking++;
        [self Checking_Achievement1];
        if(!delegate.sound_off)
        [self Correct_Sound];
        [self Aninimation_Start_With_Button:answer];
        [self Score_Button_Animation];
        //Update the score button's title:
         [self.Score_button setTitle:[NSString stringWithFormat:@"%d",self.score_counter] forState:UIControlStateNormal];
        self.Question_Correct = true;
    }
    else
    {
        self.Tracking = 0;
        if(!delegate.sound_off)
        [self Wrong_Sound];
        self.Question_Correct = false;
        if (self.score_counter <= 0)
        {
            self.score_counter = 0;
        }
        else
            self.score_counter = self.score_counter - 1;
    }
    self.Question_Done = true;
    if(self.S1)
    {
        [self.structural_formula addTarget:self action:@selector(structural_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
        self.S1 = false;
    }

}

-(void) Check_Formula_Button_With_Answer_Button:(UIButton *)answer
{
     AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(self.is_Answer == formula_count)
    {
        self.score_counter = self.score_counter+ 2;
        self.Tracking++;
        if(!delegate.sound_off)
            [self Correct_Sound];
        [self Checking_Achievement1];
        [self Aninimation_Start_With_Button:answer];
        [self Score_Button_Animation];
        self.Question_Correct = true;
        //Update the score button's title:
         [self.Score_button setTitle:[NSString stringWithFormat:@"%d",self.score_counter] forState:UIControlStateNormal];
    }
    else
    {
        self.Tracking = 0;
        if(!delegate.sound_off)
            [self Wrong_Sound];
        self.Question_Correct = false;
        if (self.score_counter <= 0)
        {
            self.score_counter = 0;
        }
        else
        self.score_counter = self.score_counter - 1;
    }
    self.Question_Done = true;
    if(self.F1)
    {
     [self.formula addTarget:self action:@selector(formula_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
        self.F1 = false;
    }
}

-(void)Checking_Achievement1
{
    switch (self.Tracking) {
        case 10:
            if(!self.streak1Got)
             self.streak1Got = true;
            break;
        case 20:
            if(!self.streak2Got)
            self.streak2Got = true;
        case 40:
            if(!self.streak3Got)
            self.streak3Got = true;
        case 100:
            if(!self.streak4Got)
            self.streak4Got = true;
        default:
            break;
    }
    
}


-(void) Check_Chemical_Class_Button_With_Answer_Button:(UIButton *)answer
{
     AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(self.is_Answer == chemical_class_count)
    {
         self.score_counter = self.score_counter+ 2;
        self.Tracking++;
        [self Checking_Achievement1];
        if(!delegate.sound_off)
            [self Correct_Sound];
        [self Aninimation_Start_With_Button:answer];
        [self Score_Button_Animation];
        self.Question_Correct = true;
        //Update the score button's title:
        [self.Score_button setTitle:[NSString stringWithFormat:@"%d",self.score_counter] forState:UIControlStateNormal];
    }
    else
    {
        self.Tracking = 0;
        if(!delegate.sound_off)
            [self Wrong_Sound];
        self.Question_Correct = false;
        if (self.score_counter <= 0)
        {
            self.score_counter = 0;
        }
        else
            self.score_counter = self.score_counter - 1;
    }
    self.Question_Done = true;
    if(self.C1)
    {
        [self.chemical_class addTarget:self action:@selector(chemical_class_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
        self.C1 = false;
    }
}

-(void)Setup_Database
{
    
    //Setup the title container:
    self.title_container = [NSArray arrayWithObjects:@"Chemical Class",@"Formula",@"Structural Formula",@"Example", nil];
    
    //Setup dictionaries and array:
    
   self.chemical_class_Array = [NSArray arrayWithObjects:@"Alkane",@"Alkene",@"Alkyne",@"Carboxylic acid",@"Ester",@"Ether",@"Amide",@"haloalkane",@"Alcohol",@"Ketone",@"Aldehyde",@"Thiol",@"Sulfide",@"Amines-Primary",@"Amines-Secondary",@"Tertiary amine",@"Nitrile", nil];
    
    self.chemical_class_Dic = [NSDictionary dictionaryWithObjectsAndKeys:@"txt_ether.png",@"Ether",@"txt_haloalkane.png",@"haloalkane",@"txt_ketone.png",@"Ketone",@"txt_amine2.png",@"Amines-Secondary",@"txt_amine3.png",@"Tertiary amine",@"txt_carboxylic.png",@"Carboxylic acid",@"txt_ester.png",@"Ester",@"txt_alkene.png",@"Alkene",@"txt_alkyne.png",@"Alkyne",@"txt_amide.png",@"Amide",@"txt_amine1.png", @"Amines-Primary",@"txt_alcohol.png",@"Alcohol",@"txt_aldehyde.png",@"Aldehyde",@"txt_alkane.png",@"Alkane",@"txt_nitrile.png",@"Nitrile",@"txt_sulfide.png",@"Sulfide",@"txt_thiol.png",@"Thiol", nil];
    
    //formala_dic provides the name of the image associated with the Formula.However, some of the formulas are already provided as strings.
    self.formula_dic = [NSDictionary dictionaryWithObjectsAndKeys:@"Alkane3.png",@"Alkane",@"Alkene2.png",@"Alkene",@"Alkyne2.png",@"Alkyne",@"RCOOH.png",@"Carboxylic acid",@"RCOOR'.png",@"Ester",@"ROR'.png",@"Ether",@"Amide3.png",@"Amide",@"RX.png",@"haloalkane",@"ROH.png",@"Alcohol",@"RCOR'.png",@"Ketone",@"RCHO.png",@"Aldehyde",@"RSH.png",@"Thiol",@"RSR'.png",@"Sulfide",@"Primary amine3.png",@"Amines-Primary",@"Secondary amine2.png",@"Amines-Secondary", @"Tertiary amine.png",@"Tertiary amine",@"RCN.png",@"Nitrile",nil];
    
    //Be aware of some structural forms as strings:
    self.structural_dic = [NSDictionary dictionaryWithObjectsAndKeys:@"Alkane2.png",@"Alkane",@"Alkene3.png",@"Alkene",@"Alkyne3.png",@"Alkyne",@"Carboxylic acid2.png",@"Carboxylic acid",@"Ester.png",@"Ester",@"Ether.png",@"Ether",@"Amide2.png", @"Amide",@"R-X.png",@"haloalkane", @"Alcohol2.png",@"Alcohol",@"Ketone2.png",@"Ketone",@"Aldehyde.png",@"Aldehyde",@"Thiol.png",@"Thiol",@"Sulfide.png",@"Sulfide",@"Primary amine2.png",@"Amines-Primary",@"Secondary amine.png",@"Amines-Secondary",@"Tertiary amine3.png",@"Tertiary amine",@"Nitrile.png",@"Nitrile",nil];
    
    //For example dictionary,
    self.example_dic = [NSDictionary dictionaryWithObjectsAndKeys:@"Alkane.png",@"Alkane",@"Alkene.png",@"Alkene",@"Alkyne.png",@"Alkyne",@"Carboxylic acid.png",@"Carboxylic acid",@"Ester2.png",@"Ester",@"Ether2.png",@"Ether",@"Amide.png", @"Amide",@"haloalkane.png",@"haloalkane",@"Alcohol.png",@"Alcohol",@"Ketone.png",@"Ketone",@"Aldehyde2.png",@"Aldehyde",@"Thiol2.png",@"Thiol",@"Sulfide2.png",@"Sulfide",@"Primary amine.png",@"Amines-Primary",@"Secondary amine3.png",@"Amines-Secondary", @"Tertiary amine2.png",@"Tertiary amine",@"Nitrile2.png",@"Nitrile",nil];

}

-(void) Update_Title_Switch
{
    self.title_switch = arc4random()%4;
}

-(void)Update_Question_And_Answer_Content
{
    [self Update_Content_Switch];
    self.save = self.content_switch;
    
    //Update the content of answers:
    self.correctness_switch = arc4random()%3;
    
     NSString* record2 = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.save]];

    //Update the question:
    switch (self.title_switch)
    {
        case 0: //self.Chemical_class
        {
            NSString* argu = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]];
            NSString* argux = [self.chemical_class_Dic objectForKey:argu];
            [self.chemical_class setBackgroundImage:[UIImage imageNamed:argux] forState:UIControlStateNormal];
            
             [self.chemical_class setTitle:nil forState:UIControlStateNormal];
          //  [self Check_For_Amine_Secondary];
            [self Update_Answer_Content:0 And_Chemical_Class:record2 OrSaveNum:self.save];
             break;
        }
        case 1: // self.formula
        {
            NSString* argu = [self.formula_dic objectForKey:record2];
            [self.formula setBackgroundImage:[UIImage imageNamed:argu] forState:UIControlStateNormal];
             [self Update_Answer_Content:1 And_Chemical_Class:record2 OrSaveNum:self.save];
            break;
        }
        case 2: // self.structural_formula
        {
            NSString* argu2 = [self.structural_dic objectForKey:record2];
            [self.structural_formula setBackgroundImage:[UIImage imageNamed:argu2] forState:UIControlStateNormal];
             [self Update_Answer_Content:2 And_Chemical_Class:record2 OrSaveNum:self.save];
            break;
        }
        case 3: // self.example
        {
            
            NSString* argu3 = [self.example_dic objectForKey:record2];
            [self.example setBackgroundImage:[UIImage imageNamed:argu3] forState:UIControlStateNormal];
             [self Update_Answer_Content:3 And_Chemical_Class:record2 OrSaveNum:self.save];
            break;
        }
}
}

-(void)Update_Content_Switch
{
    //Update the content of question:
    int record = self.content_switch;
    do{
        self.content_switch = arc4random()%17;
    }while (record == self.content_switch); //After this, there has to be one question and one answer using self.content_switch as the offset!
}

-(void) Update_Content_Switch_With_Constraints:(int)constraint And:(int)constraint2
{
    if(constraint == 0 && constraint2 != 0)
    {
        do{
            self.content_switch = arc4random()%17;
        }while (self.content_switch == constraint2);
    }
    else if (constraint != 0 && constraint2 == 0)
    {
        do{
            self.content_switch = arc4random()%17;
        }while (self.content_switch == constraint);
    }
    else if(constraint != 0 && constraint2 != 0)
    {
        do{
            self.content_switch = arc4random()%17;
        }while (self.content_switch == constraint ||self.content_switch == constraint2);
    }
}


-(void) Update_Answer_Content:(int)Question_index And_Chemical_Class:(NSString *)Chemical_class OrSaveNum:(int)saveNum
{
    switch (Question_index)
    {
        case 0: //The question is the Chemical class
        {
           if(self.correctness_switch == 0)// self.formula
           {
               self.is_Answer = formula_count;
               NSString* argu = [self.formula_dic objectForKey:Chemical_class];
               [self.formula setBackgroundImage:[UIImage imageNamed:argu] forState:UIControlStateNormal];
               
               [self Update_Content_Switch_With_Constraints:0 And:saveNum];
               NSString* msg = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]];
               NSString* argu2 = [self.structural_dic objectForKey:msg];
                [self.structural_formula setBackgroundImage:[UIImage imageNamed:argu2] forState:UIControlStateNormal];
               
                [self Update_Content_Switch_With_Constraints:self.content_switch And:saveNum];
               NSString* msg2 = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]];
               NSString* argu3 = [self.example_dic objectForKey:msg2];
            
                [self.example setBackgroundImage:[UIImage imageNamed:argu3] forState:UIControlStateNormal];

           }
            else if(self.correctness_switch == 1) // self.structural_formula
            {
                self.is_Answer = structural_form_count;
                NSString* argu = [self.structural_dic objectForKey:Chemical_class];
                [self.structural_formula setBackgroundImage:[UIImage imageNamed:argu] forState:UIControlStateNormal];
                
                 [self Update_Content_Switch_With_Constraints:0 And:saveNum];
                NSString* msg = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]];
                NSString* argu2 = [self.formula_dic objectForKey:msg];
                 [self.formula setBackgroundImage:[UIImage imageNamed:argu2] forState:UIControlStateNormal];
                [self Update_Content_Switch_With_Constraints:self.content_switch And:saveNum];
                 NSString* msg2 = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]];
                NSString* argu3 = [self.example_dic objectForKey:msg2];
                [self.example setBackgroundImage:[UIImage imageNamed:argu3] forState:UIControlStateNormal];
            }
            else if(self.correctness_switch == 2) //example
            {
                self.is_Answer = example_count;
                NSString* argu = [self.example_dic objectForKey:Chemical_class];
                [self.example setBackgroundImage:[UIImage imageNamed:argu] forState:UIControlStateNormal];
                
                 [self Update_Content_Switch_With_Constraints:0 And:saveNum];
                  NSString* msg = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]];
                NSString* argu2 = [self.formula_dic objectForKey:msg];
                [self.formula setBackgroundImage:[UIImage imageNamed:argu2] forState:UIControlStateNormal];
                
                [self Update_Content_Switch_With_Constraints:self.content_switch And:saveNum];
                 NSString* msg2 = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]];
                NSString* argu3 = [self.structural_dic objectForKey:msg2];
                [self.structural_formula setBackgroundImage:[UIImage imageNamed:argu3] forState:UIControlStateNormal];
            }
            break;
        }
        
        case 1: //The question is Formula
        {
            if(self.correctness_switch == 0)// self.chemical_Class
            {
                self.is_Answer = chemical_class_count;
                NSString* argu = [self.chemical_class_Array objectAtIndex:saveNum];
                
                NSString* xarg = [self.chemical_class_Dic objectForKey:argu];
                [self.chemical_class setBackgroundImage:[UIImage imageNamed:xarg] forState:UIControlStateNormal];
                [self.chemical_class setTitle:nil forState:UIControlStateNormal];
                
                [self Update_Content_Switch_With_Constraints:0 And:saveNum];
                
                 NSString* msg = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]];
                NSString* argu2 = [self.structural_dic objectForKey:msg];
                [self.structural_formula setBackgroundImage:[UIImage imageNamed:argu2] forState:UIControlStateNormal];
                
                [self Update_Content_Switch_With_Constraints:self.content_switch And:saveNum];
                 NSString* msg2 = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]];
                NSString* argu3 = [self.example_dic objectForKey:msg2];
                [self.example setBackgroundImage:[UIImage imageNamed:argu3] forState:UIControlStateNormal];
                
            }
            else if(self.correctness_switch == 1) // self.structural_formula
            {
                self.is_Answer = structural_form_count;
                 NSString* argu = [self.structural_dic objectForKey:Chemical_class];
                 [self.structural_formula setBackgroundImage:[UIImage imageNamed:argu] forState:UIControlStateNormal];
                
                [self Update_Content_Switch_With_Constraints:0 And:saveNum];
                NSString* argu2 = [self.chemical_class_Array objectAtIndex:self.content_switch];
                
                NSString* xarg = [self.chemical_class_Dic objectForKey:argu2];
                [self.chemical_class setBackgroundImage:[UIImage imageNamed:xarg] forState:UIControlStateNormal];
                [self.chemical_class setTitle:nil forState:UIControlStateNormal];
               
                
                [self Update_Content_Switch_With_Constraints:self.content_switch And:saveNum];
                 NSString* msg = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]];
                NSString* argu3 = [self.example_dic objectForKey:msg];
                [self.example setBackgroundImage:[UIImage imageNamed:argu3] forState:UIControlStateNormal];
                }
            else if(self.correctness_switch == 2) //example
            {
                self.is_Answer = example_count;
                NSString* argu = [self.example_dic objectForKey:Chemical_class];
                [self.example setBackgroundImage:[UIImage imageNamed:argu] forState:UIControlStateNormal];
                
                [self Update_Content_Switch_With_Constraints:0 And:saveNum];
                NSString* argu2 = [self.chemical_class_Array objectAtIndex:self.content_switch];
                
                NSString* xarg = [self.chemical_class_Dic objectForKey:argu2];
                [self.chemical_class setBackgroundImage:[UIImage imageNamed:xarg] forState:UIControlStateNormal];
                 [self.chemical_class setTitle:nil forState:UIControlStateNormal];
                
                [self Update_Content_Switch_With_Constraints:self.content_switch And:saveNum];
                 NSString* msg = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]];
                NSString* argu3 = [self.structural_dic objectForKey:msg];
                [self.structural_formula setBackgroundImage:[UIImage imageNamed:argu3] forState:UIControlStateNormal];
            }
            break;

        }
        case 2: //The question is the structural_formula
            {
                if(self.correctness_switch == 0)// self.chemical_Class
                {
                    self.is_Answer = chemical_class_count;
                    NSString* argu = [self.chemical_class_Array objectAtIndex:saveNum];
                    
                    NSString* xarg = [self.chemical_class_Dic objectForKey:argu];
                    [self.chemical_class setBackgroundImage:[UIImage imageNamed:xarg] forState:UIControlStateNormal];
                     [self.chemical_class setTitle:nil forState:UIControlStateNormal];
                    
                    [self Update_Content_Switch_With_Constraints:0 And:saveNum];
                     NSString* msg = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]];
                    NSString* argu2 = [self.example_dic objectForKey:msg];
                    [self.example setBackgroundImage:[UIImage imageNamed:argu2] forState:UIControlStateNormal];
                    
                    [self Update_Content_Switch_With_Constraints:self.content_switch And:saveNum];
                     NSString* msg2 = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]];
                    NSString* argu3 = [self.formula_dic objectForKey:msg2];
                    [self.formula setBackgroundImage:[UIImage imageNamed:argu3] forState:UIControlStateNormal];
                }
                else if(self.correctness_switch == 1) //self.formula
                {
                    self.is_Answer = formula_count;
                    [self Update_Content_Switch_With_Constraints:0 And:saveNum];
                    NSString* argu = [self.chemical_class_Array objectAtIndex:self.content_switch];
                    
                    NSString* xarg = [self.chemical_class_Dic objectForKey:argu];
                    [self.chemical_class setBackgroundImage:[UIImage imageNamed:xarg] forState:UIControlStateNormal];
                     [self.chemical_class setTitle:nil forState:UIControlStateNormal];
                  
                    NSString* argu2 = [self.formula_dic objectForKey:Chemical_class];
                    [self.formula setBackgroundImage:[UIImage imageNamed:argu2] forState:UIControlStateNormal];
                    
                    [self Update_Content_Switch_With_Constraints:self.content_switch And:saveNum];
                     NSString* msg = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]];
                    NSString* argu3 = [self.example_dic objectForKey:msg];
                    [self.example setBackgroundImage:[UIImage imageNamed:argu3] forState:UIControlStateNormal];
                }
                else if(self.correctness_switch == 2) //example
                {
                    self.is_Answer = example_count;
                    NSString* argu = [self.example_dic objectForKey:Chemical_class];
                    [self.example setBackgroundImage:[UIImage imageNamed:argu] forState:UIControlStateNormal];
                    
                    [self Update_Content_Switch_With_Constraints:0 And:saveNum];
                    NSString* argu2 = [self.chemical_class_Array objectAtIndex:self.content_switch];
                    
                    NSString* xarg = [self.chemical_class_Dic objectForKey:argu2];
                    [self.chemical_class setBackgroundImage:[UIImage imageNamed:xarg] forState:UIControlStateNormal];
                     [self.chemical_class setTitle:nil forState:UIControlStateNormal];
                    
                    [self Update_Content_Switch_With_Constraints:self.content_switch And:saveNum];
                     NSString* msg = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]];
                    NSString* argu3 = [self.formula_dic objectForKey:msg];
                    [self.formula setBackgroundImage:[UIImage imageNamed:argu3] forState:UIControlStateNormal];
                }
                break;

            }
        case 3: //The question is example
        {
            if(self.correctness_switch == 0) //self.chemical_Class
            {
                self.is_Answer = chemical_class_count;
                NSString* argu = [self.chemical_class_Array objectAtIndex:saveNum];
                
                NSString* xarg = [self.chemical_class_Dic objectForKey:argu];
                [self.chemical_class setBackgroundImage:[UIImage imageNamed:xarg] forState:UIControlStateNormal];
                 [self.chemical_class setTitle:nil forState:UIControlStateNormal];
                        [self Update_Content_Switch_With_Constraints:0 And:saveNum];
                 NSString* msg = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]];
                NSString* argu2 = [self.formula_dic objectForKey:msg];
                [self.formula setBackgroundImage:[UIImage imageNamed:argu2] forState:UIControlStateNormal];
                
                [self Update_Content_Switch_With_Constraints:self.content_switch And:saveNum];
                 NSString* msg2 = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]];
                NSString* argu3 = [self.structural_dic objectForKey:msg2];
                [self.structural_formula setBackgroundImage:[UIImage imageNamed:argu3] forState:UIControlStateNormal];
            }
            else if(self.correctness_switch == 1) //self.formula
            {
                self.is_Answer = formula_count;
                NSString* argu = [self.formula_dic objectForKey:Chemical_class];
                [self.formula setBackgroundImage:[UIImage imageNamed:argu] forState:UIControlStateNormal];
                
                [self Update_Content_Switch_With_Constraints:0 And:saveNum];
                NSString* argu2 = [self.chemical_class_Array objectAtIndex:self.content_switch];
                
                NSString* xarg = [self.chemical_class_Dic objectForKey:argu2];
                [self.chemical_class setBackgroundImage:[UIImage imageNamed:xarg] forState:UIControlStateNormal];
                 [self.chemical_class setTitle:nil forState:UIControlStateNormal];
                
                [self Update_Content_Switch_With_Constraints:self.content_switch And:saveNum];
                 NSString* msg = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]];
                NSString* argu3 = [self.structural_dic objectForKey:msg];
                [self.structural_formula setBackgroundImage:[UIImage imageNamed:argu3] forState:UIControlStateNormal];
            }
            else if(self.correctness_switch == 2) //self.structural_formula
            {
                self.is_Answer = structural_form_count;
                NSString* argu = [self.structural_dic objectForKey:Chemical_class];
                 [self.structural_formula setBackgroundImage:[UIImage imageNamed:argu] forState:UIControlStateNormal];
                
                [self Update_Content_Switch_With_Constraints:0 And:saveNum];
                NSString* argu2 = [self.chemical_class_Array objectAtIndex:self.content_switch];
                
                NSString* xarg = [self.chemical_class_Dic objectForKey:argu2];
                [self.chemical_class setBackgroundImage:[UIImage imageNamed:xarg] forState:UIControlStateNormal];
                 [self.chemical_class setTitle:nil forState:UIControlStateNormal];
                
                [self Update_Content_Switch_With_Constraints:self.content_switch And:saveNum];
                 NSString* msg = [NSString stringWithString:[self.chemical_class_Array objectAtIndex:self.content_switch]];
                NSString* argu3 = [self.formula_dic objectForKey:msg];
                [self.formula setBackgroundImage:[UIImage imageNamed:argu3] forState:UIControlStateNormal];
            }
            break;
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"Out of Memory !");
}


@end
