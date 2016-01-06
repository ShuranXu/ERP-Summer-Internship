//
//  View5.m
//  Ch05_TabBarController
//
//  Created by Shuran Xu on 2015-05-18.
//
//

#import "View5.h"

@interface View5 ()

@end

@implementation View5
@synthesize back_button = _back_button;
@synthesize switches = _switches;
@synthesize framework = _framework;
@synthesize calculator = _calculator;
@synthesize info_view = _info_view;
@synthesize main_view = _main_view;
@synthesize presenting_page = _presenting_page;

- (instancetype)initWithNibName:(NSString *)nibName
                         bundle:(NSBundle *)nibBundle
{
    self = [super initWithNibName:nibName bundle:nibBundle];
    self.switches = false;
    self.judge1 = false;
    self.judge2 = false;
    self.judge3 = false;
    self.main_view = nil;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.framework = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.framework.frame = CGRectMake(delegate.WIDTH*0.11, delegate.WIDTH*0.2, delegate.WIDTH*0.8, delegate.WIDTH*1.5);
    self.framework.backgroundColor = [UIColor lightGrayColor];
    self.framework.layer.cornerRadius = 10;
    [self.view addSubview:self.framework];
    
    UIImageView* image_view = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"intro_trans.png"]];
    image_view.frame = CGRectMake(delegate.WIDTH*0.13, delegate.WIDTH*0.25, delegate.WIDTH*0.75, delegate.WIDTH*1.4);
    if([[UIScreen mainScreen]bounds].size.height == 480)
    {
        image_view.frame = CGRectMake(delegate.WIDTH*0.13, delegate.WIDTH*0.15, delegate.WIDTH*0.75, delegate.WIDTH*1.3);
        self.framework.frame = CGRectMake(delegate.WIDTH*0.11, delegate.WIDTH*0.15, delegate.WIDTH*0.8, delegate.WIDTH*1.3);
    }
    [self.view addSubview:image_view];
    
    //Setup button:
    self.back_button = [[UIButton alloc]initWithFrame:CGRectMake(delegate.WIDTH*0.85, delegate.WIDTH*0.07, delegate.WIDTH*0.06,delegate.WIDTH*0.06)];
    [self.back_button.layer setCornerRadius:15.0];
    [self.back_button addTarget:self action:@selector(back_button_touched:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
    [self.back_button setImage:[UIImage imageNamed:@"back.png"]forState:UIControlStateNormal];
    [self.view addSubview:self.back_button];
    
    if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
         self.back_button.frame = CGRectMake(delegate.WIDTH*0.85, delegate.WIDTH*0.03, delegate.WIDTH*0.05,delegate.WIDTH*0.05);
         self.framework.frame = CGRectMake(delegate.WIDTH*0.11, delegate.WIDTH*0.09, delegate.WIDTH*0.8, delegate.WIDTH*1.2);
          image_view.frame = CGRectMake(delegate.WIDTH*0.13, delegate.WIDTH*0.09, delegate.WIDTH*0.75, delegate.WIDTH*1.2);
    }
    
}

-(void)back_button_touched:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//该方法提供了使用view controller当做辅助view功能的方法--->不用present用addsubview!!!

/*
-(void)testing:(id)sender
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(self.tester == nil)
    {
        self.tester = [[Testing alloc]initWithNibName:nil bundle:nil];
        self.tester.view.frame = CGRectMake(delegate.WIDTH*0.1, delegate.WIDTH*0.5, delegate.WIDTH*0.5, delegate.WIDTH*0.5);
    }
    //[self presentViewController:tester animated:YES completion:nil];
    if(!self.ts)
    {
        self.ts = true;
        [self.view addSubview:self.tester.view];
    }
    else
    {
        self.ts = false;
        [_tester.view removeFromSuperview];
    }
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//****  In iOS 6 and later, clearing references to views and other objects in your view controller is unnecessary.

@end

