//
//  AboutPage.m
//  Titration
//
//  Created by Shuran Xu on 2015-08-06.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import "AboutPage.h"

@interface AboutPage ()

@end

@implementation AboutPage

@synthesize delegate = _delegate;
@synthesize info_selection;
@synthesize instr_text;
@synthesize about_text;
@synthesize back;
@synthesize author_text;

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    self.delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.info_selection = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects: @"Intro",@"Instruction", nil]];
    self.info_selection.frame = CGRectMake(_delegate.WIDTH*0.05,_delegate.WIDTH*0.1, _delegate.WIDTH*0.9,_delegate.WIDTH*0.1);
    self.info_selection.layer.cornerRadius = 8;
    self.info_selection.selectedSegmentIndex = 0;
    [self.info_selection setBackgroundColor:[UIColor whiteColor]];
    [self.info_selection addTarget:self action:@selector(segment_clicked:) forControlEvents:UIControlEventValueChanged];
    NSDictionary* dic;
    dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20], NSFontAttributeName, nil];
    [self.info_selection setTitleTextAttributes:dic forState:UIControlStateNormal];
    [self.view addSubview:self.info_selection];
    
    
    self.back = [self Create_Button_WithFream: CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*1.35, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.08)AndTitle:@"Return to Menu" AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor whiteColor]];
    [self.back addTarget:self action:@selector(Go_Back:) forControlEvents:UIControlEventTouchUpInside];
    self.back.layer.cornerRadius = 5;
    self.back.layer.borderColor = [UIColor whiteColor].CGColor;
    self.back.layer.borderWidth = self.delegate.WIDTH*0.005;
    self.back.layer.masksToBounds = YES;
    [self.view addSubview:self.back];

    self.about_text = [[UITextView alloc]initWithFrame:CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.25, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.7)];
    self.about_text.text = [NSString stringWithFormat:@"This app uses the Henderson- Hasselbach equation and concepts in Acid-Base equilibria to do a simulation of a titration to determine concentration.  You will be titrating of a strong acid (HCl) with a strong base (0.1M NaOH), or a weak acid (HCOOH) with strong base (1.0 M NaOH). The concentration of the acid will be unknown to you to simulate a lab experiment, but the volume will be fixed at 50mL. The pH indicator is phenolphthalein.  This is a good way to do a dry run through a real titration experiment, before trying it at school!"];
    self.about_text.hidden = NO;
    self.about_text.textColor = [UIColor blackColor];
    self.about_text.backgroundColor = [UIColor whiteColor];
    self.about_text.layer.cornerRadius = 8;
    self.about_text.textAlignment = NSTextAlignmentLeft;
    self.about_text.font = [UIFont systemFontOfSize:15];
    self.about_text.editable = NO;
    self.about_text.layer.borderColor = [UIColor blackColor].CGColor;
    self.about_text.layer.borderWidth = self.delegate.WIDTH*0.005;
    [self.view addSubview:self.about_text];
    
    
    self.author_text = [[UITextView alloc]initWithFrame:CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*1.0, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.3)];
    self.author_text.text = [NSString stringWithFormat:@" Developed By\n Shuran Xu, Impact Centre \n University of Toronto\n Copyright(c) 2015 Chrysalis Innovations Corp.\n All rights reserved.\n Acknowledgement: James Li, Iris Qiu\n"];
    self.author_text.hidden = NO;
    self.author_text.textColor = [UIColor blackColor];
    self.author_text.backgroundColor = [UIColor whiteColor];
    self.author_text.layer.cornerRadius = 8;
    self.author_text.textAlignment = NSTextAlignmentCenter;
    self.author_text.font = [UIFont systemFontOfSize:15];
    self.author_text.editable = NO;
    self.author_text.layer.borderColor = [UIColor whiteColor].CGColor;
    self.author_text.layer.borderWidth = self.delegate.WIDTH*0.005;
    [self.view addSubview:self.author_text];

    
    self.instr_text = [[UITextView alloc]initWithFrame:CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.25, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.7)];
    self.instr_text.text = [NSString stringWithFormat:@" 1. On the home screen, choose HCl or HCOOH to start the strong acid or strong base respectively. \n 2. You will be given NaOH in the burette at the appropriate concentration. Please select what volume of droplet you would like to add to the acid in the beaker (0.2, 0.5, 1.0, 2.0 or 5.0 mL) \n 3. Press Tap to add NaOH to the beaker.\n 4. The volume of NaOH added and pH of current solution are indicated on screen. The pH indicator bar on the right shows the raising of the pH.\n 5. Press Tap faster to add more NaOH (this simulates leaving the stopcock open for longer.)\n6. Tip: If using HCl,  note that the acid will be neutralized very quickly. (strong acids dont make good buffers). Please use smaller concentrations, or else the pH will rise very quickly and you will miss the equivalence point.\n 7. Tip: If using HCOOH, you can use a higher droplet volumes first,  then lower it.\n 8. For either acid, watch the fluctuation on the pH bar to regulate your droplet volume.\n 9. The acid will turn pink overtime, you need to keep adding NaOH until it turns fully pink (then the simulation will stop).\n 10. After the simulation stops, you are given the chance to see the titration curve. Y-axis is pH, and x-axis is volume of added NaOH.\n 11. Follow along on paper and try to locate the equivalence point by checking the center of the vertical line, and calculate the concentration of the unknown acid.\n 12. Or, the answer will be provided if you press ‘Show Answer’."];
    
    self.instr_text.hidden = YES;
    self.instr_text.textColor = [UIColor blackColor];
    self.instr_text.backgroundColor = [UIColor whiteColor];
    self.instr_text.layer.cornerRadius = 8;
    self.instr_text.textAlignment = NSTextAlignmentLeft;
    self.instr_text.font = [UIFont systemFontOfSize:12];
    self.instr_text.editable = NO;
    self.instr_text.layer.borderColor = [UIColor blackColor].CGColor;
    self.instr_text.layer.borderWidth = self.delegate.WIDTH*0.01;
    [self.view addSubview:self.instr_text];
    
    if(self.view.frame.size.height == 480)
    {
        self.author_text.frame = CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.95, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.3);
         self.info_selection.frame = CGRectMake(_delegate.WIDTH*0.05,_delegate.WIDTH*0.05, _delegate.WIDTH*0.9,_delegate.WIDTH*0.1);
        self.about_text.frame = CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.2, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.7);
        self.instr_text.frame = CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.2, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.7);
        self.back.frame = CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*1.3, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.1);
    }
    if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        self.info_selection.frame = CGRectMake(_delegate.WIDTH*0.05,_delegate.WIDTH*0.05, _delegate.WIDTH*0.9,_delegate.WIDTH*0.1);
        self.about_text.frame = CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.2, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.6);
        self.instr_text.frame = CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.2, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.6);
         self.author_text.frame = CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.83, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.2);
        self.back.frame = CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*1.1, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.08);
        self.instr_text.font = [UIFont systemFontOfSize:25];
        self.about_text.font = [UIFont systemFontOfSize:25];
        NSDictionary* dic;
        dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:30], NSFontAttributeName, nil];
        [self.info_selection setTitleTextAttributes:dic forState:UIControlStateNormal];
        [self.back.titleLabel setFont:[UIFont systemFontOfSize:30]];
        self.author_text.font = [UIFont systemFontOfSize:30];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)Go_Back:(id)sender
{
    [self Tab_Sound_Effect];
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(void)Tab_Sound_Effect
{
    NSString* path = [[NSBundle mainBundle]pathForResource:@"tabs" ofType:@"wav"];
    if(path)
    {
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL URLWithString:path], &soundID);
        AudioServicesPlaySystemSound(soundID);
    }
}

-(void)segment_clicked:(id)sender
{
    [self Tab_Sound_Effect];
    if(self.info_selection.selectedSegmentIndex == 0)
    {
        self.about_text.hidden = NO;
        self.instr_text.hidden = YES;
        [self Fade_Animation_For:self.about_text];
    }
    else
    {
        self.about_text.hidden = YES;
        self.instr_text.hidden = NO;
        [self Fade_Animation_For:self.instr_text];
    }
}

-(void)Fade_Animation_For:(UITextView*)textView
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.type = kCATransitionFade;
    [textView.layer addAnimation:transition forKey:@"FadeAnimation"];
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
        [button.titleLabel setFont:[UIFont systemFontOfSize:font]];
    if(color != nil)
        [button setTitleColor:[UIColor colorWithCIColor:[[CIColor alloc]initWithColor:color]] forState:UIControlStateNormal];
    if(color2 !=nil)
        [button setBackgroundColor:[UIColor colorWithCIColor:[[CIColor alloc]initWithColor:color2]]];
    button.layer.opacity = 0.9;
    //By default, the button is not hidden:
    button.hidden = NO;
    return button;
}

@end
