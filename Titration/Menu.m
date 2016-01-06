//
//  Menu.m
//  Titration
//
//  Created by Shuran Xu on 2015-07-29.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import "Menu.h"

@interface Menu ()

@end

@implementation Menu
@synthesize nextView = _nextView;
@synthesize header = _header;
@synthesize container = _container;
@synthesize PH_Indicator = _PH_Indicator;
@synthesize solu1 = _solu1;
@synthesize solu2 = _solu2;
@synthesize dropper = _dropper;
@synthesize about_page = _about_page;
@synthesize next_Page;

- (instancetype)initWithNibName:(NSString *)nibName
                         bundle:(NSBundle *)nibBundle
{
    self = [super initWithNibName:nibName bundle:nibBundle];
    
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self Basic_Setup];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)Basic_Setup
{
    self.view.backgroundColor = [UIColor grayColor];
    self.delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.dropper = [self Create_Button_WithFream:CGRectMake(self.delegate.WIDTH*0.225, self.delegate.WIDTH*0.1, self.delegate.WIDTH*0.3, self.delegate.WIDTH*0.8) AndTitle:nil AndBackgroundImage:@"burette.png"OrBackgroundColor:nil Andfont:0 AndTitleColor:nil];
    [self.view addSubview:self.dropper];
    self.dropper.enabled = NO;
    
    self.header = [self Create_Button_WithFream:CGRectMake(self.delegate.WIDTH*0.77, self.delegate.WIDTH*0.2, self.delegate.WIDTH*0.07, self.delegate.WIDTH*0.07) AndTitle:nil AndBackgroundImage:@"1.png" OrBackgroundColor:nil Andfont:0 AndTitleColor:nil];
    self.header.enabled = NO;
    
    UIImage* back_ground_image = [self imageWithImage:[UIImage imageNamed:@"PastedGraphic.png"] scaledToSize:CGSizeMake(self.delegate.WIDTH*0.15, self.delegate.WIDTH*1.15)];
    
    self.PH_Indicator = [self Create_Button_WithFream:CGRectMake(self.delegate.WIDTH*0.8, self.delegate.WIDTH*0.1, self.delegate.WIDTH*0.15, self.delegate.WIDTH*1.13) AndTitle:nil AndBackgroundImage:nil OrBackgroundColor:nil Andfont:0 AndTitleColor:nil];
    [self.PH_Indicator setBackgroundImage:back_ground_image forState:UIControlStateNormal];
    self.PH_Indicator.enabled = NO;
    [self.view addSubview:self.PH_Indicator];
    [self.view addSubview:self.header];
    
    self.container = [self Create_Button_WithFream:CGRectMake(self.delegate.WIDTH*0.15, self.delegate.WIDTH*0.8, self.delegate.WIDTH*0.45, self.delegate.WIDTH*0.45) AndTitle:nil AndBackgroundImage:@"container.png" OrBackgroundColor:nil Andfont:0 AndTitleColor:nil];
    [self.view addSubview:self.container];
    self.container.enabled = NO;
    self.container.layer.cornerRadius = 10;
    
    self.solu1 = [self Create_Button_WithFream:CGRectMake(self.delegate.WIDTH*0.2, self.delegate.WIDTH*1.3, self.delegate.WIDTH*0.6, self.delegate.WIDTH*0.08) AndTitle:@"Titrate with HCl" AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor whiteColor]];
    self.solu1.layer.cornerRadius = 5;
    self.solu1.layer.borderColor = [UIColor whiteColor].CGColor;
    self.solu1.layer.borderWidth = self.delegate.WIDTH*0.005;
    self.solu1.layer.masksToBounds = YES;

    [self.solu1 addTarget:self action:@selector(Start_Game:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.solu1];
    
    self.solu2 = [self Create_Button_WithFream:CGRectMake(self.delegate.WIDTH*0.2, self.delegate.WIDTH*1.4, self.delegate.WIDTH*0.6, self.delegate.WIDTH*0.08) AndTitle:@"Titrate with HCOOH" AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor whiteColor]];
    [self.solu2 addTarget:self action:@selector(Start_Game:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.solu2];
    self.solu2.layer.cornerRadius = 5;
    self.solu2.layer.borderColor = [UIColor whiteColor].CGColor;
    self.solu2.layer.borderWidth = self.delegate.WIDTH*0.005;
    self.solu2.layer.masksToBounds = YES;
    self.nextView = [[ViewController alloc]initWithNibName:nil bundle:nil];
    
    self.about_page = [self Create_Button_WithFream: CGRectMake(self.delegate.WIDTH*0.2, self.delegate.WIDTH*1.50, self.delegate.WIDTH*0.6, self.delegate.WIDTH*0.08) AndTitle:@"About" AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor whiteColor]];
    [self.about_page addTarget:self action:@selector(Open_About_Page) forControlEvents:UIControlEventTouchUpInside];
     self.about_page.layer.cornerRadius = 5;
    self.about_page.layer.borderColor = [UIColor whiteColor].CGColor;
     self.about_page.layer.borderWidth = self.delegate.WIDTH*0.005;
     self.about_page.layer.masksToBounds = YES;
     [self.view addSubview:self.about_page];
    
    self.next_Page = [[AboutPage alloc]initWithNibName:nil bundle:nil];
    
    if(self.view.frame.size.height == 480)
    {
        self.PH_Indicator.frame = CGRectMake(self.delegate.WIDTH*0.8, self.delegate.WIDTH*0.1, self.delegate.WIDTH*0.15, self.delegate.WIDTH*1.0);
        self.dropper.frame =  CGRectMake(self.delegate.WIDTH*0.225, self.delegate.WIDTH*0.1, self.delegate.WIDTH*0.3, self.delegate.WIDTH*0.6);
        self.container.frame = CGRectMake(self.delegate.WIDTH*0.15, self.delegate.WIDTH*0.65, self.delegate.WIDTH*0.45, self.delegate.WIDTH*0.4);
        self.solu1.frame = CGRectMake(self.delegate.WIDTH*0.2, self.delegate.WIDTH*1.1, self.delegate.WIDTH*0.6, self.delegate.WIDTH*0.08);
        self.solu2.frame = CGRectMake(self.delegate.WIDTH*0.2, self.delegate.WIDTH*1.2, self.delegate.WIDTH*0.6, self.delegate.WIDTH*0.08);
        self.about_page.frame = CGRectMake(self.delegate.WIDTH*0.2, self.delegate.WIDTH*1.3, self.delegate.WIDTH*0.6, self.delegate.WIDTH*0.08);
    }
    
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        self.PH_Indicator.frame = CGRectMake(self.delegate.WIDTH*0.8, self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.15, self.delegate.WIDTH*0.9);
        self.dropper.frame =  CGRectMake(self.delegate.WIDTH*0.225, self.delegate.WIDTH*0.1, self.delegate.WIDTH*0.3, self.delegate.WIDTH*0.6);
        self.container.frame = CGRectMake(self.delegate.WIDTH*0.15, self.delegate.WIDTH*0.6, self.delegate.WIDTH*0.4, self.delegate.WIDTH*0.3);
        self.solu1.frame = CGRectMake(self.delegate.WIDTH*0.2, self.delegate.WIDTH*1.0, self.delegate.WIDTH*0.6, self.delegate.WIDTH*0.08);
        self.solu2.frame = CGRectMake(self.delegate.WIDTH*0.2, self.delegate.WIDTH*1.1, self.delegate.WIDTH*0.6, self.delegate.WIDTH*0.08);
        self.about_page.frame = CGRectMake(self.delegate.WIDTH*0.2, self.delegate.WIDTH*1.2, self.delegate.WIDTH*0.6, self.delegate.WIDTH*0.08);
        self.solu1.titleLabel.font = [UIFont systemFontOfSize:35];
         self.solu2.titleLabel.font = [UIFont systemFontOfSize:35];
         self.about_page.titleLabel.font = [UIFont systemFontOfSize:35];
    }
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

-(void)Open_About_Page
{
    [self Tab_Sound_Effect];
    [self presentViewController:self.next_Page animated:YES completion:nil];
}

-(void)Start_Game:(id)sender
{
    [self Tab_Sound_Effect];
    UIButton* button = (UIButton*)sender;
    if(button == self.solu1)
        self.delegate.solu_select = 0; //HCL
    else
        self.delegate.solu_select = 1;
    
    [self presentViewController:self.nextView animated:YES completion:nil];
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

- (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext( newSize );//Creates a bitmap-based graphics context and makes it the current context.
    
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];//Draws the entire image in the specified rectangle, scaling it as needed to fit.
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}



@end
