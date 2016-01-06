//
//  Game_Page.m
//  One-minute APP
//
//  Created by Shuran Xu on 2015-05-25.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import "Game_Page.h"

@implementation Game_Page
@synthesize hard = _hard;
@synthesize simple = _simple;
@synthesize view1 = _view1;
@synthesize view2 = _view2;
@synthesize quit = _quit;
@synthesize HEIGHT = _HEIGHT;
@synthesize WIDTH = _WIDTH;
@synthesize GAP_X = _GAP_X;
@synthesize sound_setting = _sound_setting;

- (instancetype)initWithNibName:(NSString *)nibName
                         bundle:(NSBundle *)nibBundle
{
    self = [super initWithNibName:nibName bundle:nibBundle];
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.WIDTH = delegate.WIDTH*0.8;
    self.HEIGHT = delegate.HEIGHT*0.06;
    self.GAP_X = (delegate.WIDTH-self.WIDTH)/2;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = self.view.backgroundColor = [UIColor colorWithPatternImage:[self ChangeimageWithImage:[UIImage imageNamed:@"game.png"]]];
     AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.simple = [self Create_Button_WithFream:CGRectMake(self.GAP_X, delegate.HEIGHT*0.55, self.WIDTH, self.HEIGHT) AndTitle:@"Simple Mode" AndBackgroundImage:nil OrBackgroundColor:[UIColor whiteColor] Andfont:20 AndTitleColor:[UIColor blackColor]];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.simple.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    [self.simple addTarget:self action:@selector(simple_clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.simple];
    
    self.hard = [self Create_Button_WithFream:CGRectMake(self.GAP_X, delegate.HEIGHT*0.65, self.WIDTH, self.HEIGHT) AndTitle:@"Hard Mode" AndBackgroundImage:nil OrBackgroundColor:[UIColor whiteColor] Andfont:20 AndTitleColor:[UIColor blackColor]];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.hard.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    [self.hard addTarget:self action:@selector(hard_clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.hard];
    
    self.sound_setting = [self Create_Button_WithFream:CGRectMake(self.GAP_X, delegate.HEIGHT*0.75, self.WIDTH, self.HEIGHT) AndTitle:@"In-Game Sound: On" AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor blackColor]];
     [self.sound_setting addTarget:self action:@selector(soundSetting_clicked:) forControlEvents:UIControlEventTouchUpInside];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.sound_setting.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    [self.view addSubview:self.sound_setting];
    
    self.quit = [self Create_Button_WithFream:CGRectMake(self.GAP_X, delegate.HEIGHT*0.85, self.WIDTH, self.HEIGHT) AndTitle:@"Back" AndBackgroundImage:nil OrBackgroundColor:[UIColor whiteColor] Andfont:20 AndTitleColor:[UIColor blackColor]];
    [self.quit addTarget:self action:@selector(quit_clicked:) forControlEvents:UIControlEventTouchUpInside];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.quit.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    [self.view addSubview:self.quit];
    
    self.view1 = [[View1 alloc]initWithNibName:nil bundle:nil];
    self.view2 = [[View2 alloc]initWithNibName:nil bundle:nil];
    
    
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

-(void)soundSetting_clicked:(id)sender
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(delegate.sound_off)
    {
        delegate.sound_off = false;
        [self.sound_setting setTitle:@"In-Game Sound: On" forState:UIControlStateNormal];
    }
    else
    {
        delegate.sound_off = true;
        [self.sound_setting setTitle:@"In-Game Sound: Off" forState:UIControlStateNormal];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}


-(void)quit_clicked:(id)sender
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(delegate.music_set)
        [self Touch_Sound];

    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) simple_clicked:(id)sender
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(delegate.music_set)
        [self Touch_Sound];

    [self presentViewController:self.view2 animated:YES completion:nil];
}

-(void) hard_clicked:(id)sender
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(delegate.music_set)
        [self Touch_Sound];

    [self presentViewController:self.view1 animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        [button.titleLabel setFont:[UIFont systemFontOfSize:font]];
        [button.titleLabel setFont:[UIFont fontWithName:@"Avenir" size:font]];
    }
    if(color != nil)
        [button setTitleColor:[UIColor colorWithCIColor:[[CIColor alloc]initWithColor:color]] forState:UIControlStateNormal];
    if(color2 !=nil)
        [button setBackgroundColor:[UIColor colorWithCIColor:[[CIColor alloc]initWithColor:color2]]];
    //By default, the button is not hidden:
    button.hidden = NO;
     button.layer.opacity = 0.8;
    
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    button.layer.borderWidth = delegate.WIDTH*0.005;
    button.layer.masksToBounds = YES;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGFloat r = (CGFloat) 0/255;
    CGFloat g = (CGFloat) 0/255;
    CGFloat b = (CGFloat) 0/255;
    CGFloat a = (CGFloat) 1.0;
    CGFloat components[4] = {r,g,b,a};
    CGColorRef color3 = CGColorCreate(colorSpaceRef,components);
    button.layer.borderColor = color3;
    [self.view addSubview:button];
    return button;
}
@end
