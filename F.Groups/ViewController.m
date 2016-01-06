//
//  ViewController.m
//  One-minute APP
//
//  Created by Shuran Xu on 2015-05-21.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize sign = _sign;
@synthesize start = _start;
@synthesize Info = _Info;
@synthesize game_View = _game_View;
@synthesize info_page = _info_page;
@synthesize sign_page = _sign_page;
@synthesize game = _game;
@synthesize lead = _lead;
@synthesize leaderboard = _leaderboard;
@synthesize icon4 = _icon4;
@synthesize icon2 = _icon2;
@synthesize icon1 = _icon1;
@synthesize icon3 = _icon3;
@synthesize GAP_X1 = _GAP_X1;
@synthesize GAP_X2 = _GAP_X2;
@synthesize GAP_Y1 = _GAP_Y1;
@synthesize GAP_Y2 = _GAP_Y2;
@synthesize HEIGHT1 = _HEIGHT1;
@synthesize HEIGHT2 = _HEIGHT2;
@synthesize WIDTH1 = _WIDTH1;
@synthesize WIDTH2 = _WIDTH2;
@synthesize music_set = _music_set;


- (instancetype)initWithNibName:(NSString *)nibName
                         bundle:(NSBundle *)nibBundle
{
    self = [super initWithNibName:nibName bundle:nibBundle];
    {
        AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        
        ///delegate.FACTOR
        
        self.WIDTH1 = delegate.WIDTH*0.8;
        self.HEIGHT1 = delegate.HEIGHT/16;
        
        self.WIDTH2 = delegate.WIDTH*0.2;
        self.HEIGHT2 = self.HEIGHT1;
        
        self.GAP_Y1 = 3*(self.HEIGHT1);
        self.GAP_Y2 = 3*(self.HEIGHT2);
        
        self.GAP_X1 = (delegate.WIDTH - self.WIDTH1)/2;
        self.GAP_X2 = (delegate.WIDTH - self.WIDTH1)/3;
    }
        return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
  
    UIImage* background = [UIImage imageNamed:@"MAIN.png"];
    self.view.backgroundColor = self.view.backgroundColor = [UIColor colorWithPatternImage:[self ChangeimageWithImage:background]];

    // Do any additional setup after loading the view, typically from a nib.
    
    //CGRectMake(self.GAP_X1, self.GAP_Y1, self.WIDTH1, self.HEIGHT1)
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.sign = [self Create_Button_WithFream:CGRectMake(self.GAP_X1, (delegate.HEIGHT/4)*1.2, self.WIDTH1, self.HEIGHT1) AndTitle:@"Sign Up" AndBackgroundImage:nil OrBackgroundColor:[UIColor orangeColor] Andfont:18 AndTitleColor:[UIColor whiteColor]];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.sign.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    [self.view addSubview:self.sign];
    [self.sign addTarget:self action:@selector(sign_clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.icon1 = [self Create_Button_WithFream:CGRectMake(self.GAP_X2, (delegate.HEIGHT/4)*1.2, self.WIDTH2, self.HEIGHT2) AndTitle:nil AndBackgroundImage:nil OrBackgroundColor:[UIColor orangeColor] Andfont:18 AndTitleColor:[UIColor whiteColor]];
    [self.icon1 setTitle:@"e" forState:UIControlStateNormal];
    self.icon1.backgroundColor = [UIColor clearColor];
    [self.icon1.titleLabel setFont:[UIFont fontWithName:@"ModernPictograms" size:40]];
    [self.view addSubview:self.icon1];
    
    self.start = [self Create_Button_WithFream:CGRectMake(self.GAP_X1, self.GAP_Y1*2.5, self.WIDTH1, self.HEIGHT1) AndTitle:[NSString stringWithFormat:@"Start Game"] AndBackgroundImage:nil OrBackgroundColor:[UIColor redColor] Andfont:20 AndTitleColor:[UIColor whiteColor]];
    self.start.layer.opacity = 0.7;
    [self.start addTarget:self action:@selector(start_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.start.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    [self.view addSubview:self.start];
    
    
    self.icon2 = [self Create_Button_WithFream:CGRectMake(self.GAP_X2, self.GAP_Y1*2.5, self.WIDTH2, self.HEIGHT2) AndTitle:nil AndBackgroundImage:nil OrBackgroundColor:[UIColor orangeColor] Andfont:20 AndTitleColor:[UIColor whiteColor]];
    [self.icon2 setTitle:@"P" forState:UIControlStateNormal];
    self.icon2.backgroundColor = [UIColor clearColor];
    [self.icon2.titleLabel setFont:[UIFont fontWithName:@"ModernPictograms" size:40]];
    
    [self.view addSubview:self.icon2];

    
    self.Info = [self Create_Button_WithFream:CGRectMake(self.GAP_X1, self.GAP_Y1*3.25, self.WIDTH1, self.HEIGHT1) AndTitle:[NSString stringWithFormat:@"More Info"] AndBackgroundImage:nil OrBackgroundColor:[UIColor greenColor] Andfont:20 AndTitleColor:[UIColor whiteColor]];
    [self.Info addTarget:self action:@selector(Info_clicked:) forControlEvents:UIControlEventTouchUpInside ];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.Info.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }

    [self.view addSubview:self.Info];
    
    self.icon3 = [self Create_Button_WithFream:CGRectMake(self.GAP_X2, self.GAP_Y2*3.25, self.WIDTH2, self.HEIGHT2)  AndTitle:nil AndBackgroundImage:nil OrBackgroundColor:[UIColor orangeColor] Andfont:18 AndTitleColor:[UIColor whiteColor]];
    [self.icon3 setTitle:@"b" forState:UIControlStateNormal];
    self.icon3.backgroundColor = [UIColor clearColor];
    [self.icon3.titleLabel setFont:[UIFont fontWithName:@"Entypo" size:40]];
    [self.view addSubview:self.icon3];

    
    self.lead = [self Create_Button_WithFream:CGRectMake(self.GAP_X1, self.GAP_Y1*4.2, self.WIDTH1, self.HEIGHT1) AndTitle:@"Leader Board" AndBackgroundImage:nil OrBackgroundColor:[UIColor lightGrayColor] Andfont:18 AndTitleColor:[UIColor whiteColor]];
    self.lead.layer.opacity = 0.95;
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.lead.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    [self.view addSubview:self.lead];
    [self.lead addTarget:self action:@selector(leader_board_clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.icon4 = [self Create_Button_WithFream:CGRectMake(self.GAP_X2, self.GAP_Y2*4.2, self.WIDTH2, self.HEIGHT2)  AndTitle:nil AndBackgroundImage:nil OrBackgroundColor:[UIColor orangeColor] Andfont:18 AndTitleColor:[UIColor whiteColor]];
    [self.icon4 setTitle:@"B" forState:UIControlStateNormal];
    self.icon4.backgroundColor = [UIColor clearColor];
    [self.icon4.titleLabel setFont:[UIFont fontWithName:@"Entypo" size:40]];
    [self.view addSubview:self.icon4];
    
    self.music_set = [self Create_Button_WithFream:CGRectMake(delegate.WIDTH*0.12, delegate.WIDTH*0.18, delegate.WIDTH*0.1, delegate.WIDTH*0.1) AndTitle:@"H" AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor blackColor]];
    [self.music_set.titleLabel setFont:[UIFont fontWithName:@"Entypo" size:40]];
    [self.music_set addTarget:self action:@selector(music_set_change:) forControlEvents:UIControlEventTouchUpInside];
    
    self.music_set.layer.borderWidth = delegate.WIDTH*0.005;
    self.music_set.layer.masksToBounds = YES;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGFloat r = (CGFloat) 0/255;
    CGFloat g = (CGFloat) 0/255;
    CGFloat b = (CGFloat) 0/255;
    CGFloat a = (CGFloat) 1.0;
    CGFloat components[4] = {r,g,b,a};
    CGColorRef color = CGColorCreate(colorSpaceRef,components);
    self.music_set.layer.borderColor = color;

    
    [self.view addSubview:self.music_set];
    
    self.game_View = [[View1 alloc]initWithNibName:nil bundle:nil];
    self.info_page = [[Info alloc]initWithNibName:nil bundle:nil];
    self.sign_page = [[Sign2 alloc]initWithNibName:nil bundle:nil];
    self.game = [[Game_Page alloc]initWithNibName:nil bundle:nil];
    self.leaderboard = [[Store_Page alloc]initWithNibName:nil bundle:nil];
}

-(void)Touch_Sound
{
    //Find the path:
    NSString* path=[[NSBundle mainBundle]pathForResource:@"button" ofType:@"wav"];
    if(path != NULL)
    {
        SystemSoundID soundID;//A system sound object, identified with a sound file you want to play.
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:path]), &soundID);//Creates a system sound object.
        AudioServicesPlaySystemSound(soundID);
    }
}

-(void)music_set_change:(id)sender
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(delegate.music_set)
    {
        delegate.music_set = false;
        [self.music_set setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
        CGFloat r = (CGFloat) 192/255;
        CGFloat g = (CGFloat) 192/255;
        CGFloat b = (CGFloat) 192/255;
        CGFloat a = (CGFloat) 1.0;
        CGFloat components[4] = {r,g,b,a};
        CGColorRef color = CGColorCreate(colorSpaceRef,components);
        self.music_set.layer.borderColor = color;
    }
    else
    {
        delegate.music_set = true;
        [self.music_set setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
        CGFloat r = (CGFloat) 0/255;
        CGFloat g = (CGFloat) 0/255;
        CGFloat b = (CGFloat) 0/255;
        CGFloat a = (CGFloat) 1.0;
        CGFloat components[4] = {r,g,b,a};
        CGColorRef color = CGColorCreate(colorSpaceRef,components);
        self.music_set.layer.borderColor = color;
    }
    
}

- (UIImage*)ChangeimageWithImage:(UIImage*)image
{
    CGRect newRect =[[UIScreen mainScreen] bounds];
    CGSize newSize = newRect.size;
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];//Draws the entire image in the specified rectangle, scaling it as needed to fit.
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext( newSize );
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];

    [image drawInRect:CGRectMake(0,0,newSize.width*(delegate.FACTOR),newSize.height*(delegate.FACTOR))];//Draws the entire image in the specified rectangle, scaling it as needed to fit.
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


-(void) leader_board_clicked:(id)sender
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(delegate.music_set)
    [self Touch_Sound];
    [self presentViewController:self.leaderboard animated:YES completion:nil];
}

-(void) sign_clicked:(id)sender
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(delegate.music_set)
    [self Touch_Sound];
    [self presentViewController:self.sign_page animated:YES completion:nil];
}

-(void) start_button_clicked:(id)sender
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(delegate.music_set)
    [self Touch_Sound];
    [self presentViewController:self.game animated:YES completion:nil];
    
}

-(void) Info_clicked:(id)sender
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(delegate.music_set)
    [self Touch_Sound];
    [self presentViewController:self.info_page animated:YES completion:nil];
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
    return button;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
