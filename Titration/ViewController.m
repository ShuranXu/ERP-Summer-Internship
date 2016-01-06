//
//  ViewController.m
//  Titration
//
//  Created by Shuran Xu on 2015-07-21.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import "ViewController.h"


#define drop_concentration_HCOOH 1
#define drop_concentration_HCL 0.5
#define Ka_HCL 10.0E+6
#define Ka_HCOOH 177.8E-6
#define PKa_HCL -7.00
#define PKa_HCOOH 3.75
#define initial_vol 50.0E-3
#define from_offset1 60
#define to_offset1 50
#define from_offset2 70
#define to_offset2 60

@interface ViewController ()

@end

@implementation ViewController
@synthesize PH_Indicator = _PH_Indicator;
@synthesize delegate = _delegate;
@synthesize header = _header;
@synthesize container = _container;
@synthesize droper = _droper;
@synthesize start = _start;
@synthesize basicAnimation = _basicAnimation;
@synthesize text = _text;
@synthesize animation = _animation;
@synthesize testerrr = _testerrr;
@synthesize drop_volume_seletion = _drop_volume_seletion;
@synthesize back = _back;
@synthesize points_array = _points_array;
@synthesize intial_solu_conc = _intial_solu_conc;
@synthesize disp_PH = _disp_PH;
@synthesize pink_cover = _pink_cover;
@synthesize alert2 = _alert2;
@synthesize chart = _chart;
@synthesize long_offset = _long_offset;
@synthesize animation2_checker;
@synthesize bb;

- (instancetype)initWithNibName:(NSString *)nibName
                         bundle:(NSBundle *)nibBundle
{
    self = [super initWithNibName:nibName bundle:nibBundle];
    if(self){
        self.animation2_checker = 0;
        self.basicAnimation = nil;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self ViewController_Initialization];
    [self Basic_Setup];
}

-(void)Start_Water_Drop_Animation
{
    CALayer* layer = [self Initialize_Water_Drop];
    [self.drop_array addObject:layer];
    [self Initialize_basic_Animation_For:layer];
}

-(void)Start_Button_Clicked:(id)sender
{
     [self Tab_Sound_Effect];
    [self.start setTitle:@"Pause" forState:UIControlStateNormal];
    [self Start_Water_Drop_Animation];
}

-(CALayer*)Initialize_Water_Drop
{
    CALayer* water_drop=[[CALayer alloc]init];
    water_drop.bounds=CGRectMake(self.delegate.WIDTH*0.35, self.delegate.WIDTH*1.1, self.delegate.WIDTH*0.05,self.delegate.WIDTH*0.05);
    water_drop.position=CGPointMake(self.delegate.WIDTH*0.35, self.delegate.WIDTH*1.1);
    
    if(self.view.frame.size.height == 480)
    {
        water_drop.bounds=CGRectMake(self.delegate.WIDTH*0.35, self.delegate.WIDTH*1.0, self.delegate.WIDTH*0.05,self.delegate.WIDTH*0.05);
        water_drop.position=CGPointMake(self.delegate.WIDTH*0.35, self.delegate.WIDTH*1.0);
        
    }
    if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        
        water_drop.bounds=CGRectMake(self.delegate.WIDTH*0.35, self.delegate.WIDTH*0.7, self.delegate.WIDTH*0.05,self.delegate.WIDTH*0.05);
        water_drop.position=CGPointMake(self.delegate.WIDTH*0.35, self.delegate.WIDTH*0.7);
    }
    water_drop.contents=(id)[UIImage imageNamed:@"drop.png"].CGImage;
    [self.view.layer addSublayer:water_drop];
    return water_drop;
}

-(void)Initialize_basic_Animation_For:(CALayer*)layer
{
    if(self.animation == nil)
    {
        _basicAnimation=[CABasicAnimation animationWithKeyPath:@"position"];
        _basicAnimation.delegate = self;
        _basicAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.delegate.WIDTH*0.36,self.delegate.WIDTH*0.9)];
        _basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        _basicAnimation.toValue=[NSValue valueWithCGPoint:CGPointMake(self.delegate.WIDTH*0.36,self.delegate.WIDTH*1.1)];
        
        if(self.view.frame.size.height == 480)
        {
            _basicAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.delegate.WIDTH*0.36,self.delegate.WIDTH*0.7)];
            _basicAnimation.toValue=[NSValue valueWithCGPoint:CGPointMake(self.delegate.WIDTH*0.36,self.delegate.WIDTH*0.9)];
        }
        
        if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
        {
            _basicAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.delegate.WIDTH*0.36,self.delegate.WIDTH*0.62)];
            _basicAnimation.toValue=[NSValue valueWithCGPoint:CGPointMake(self.delegate.WIDTH*0.36,self.delegate.WIDTH*0.8)];
        }
        _basicAnimation.speed = 2.0;
        _basicAnimation.duration=2.0;
        _basicAnimation.repeatCount=0;
        _basicAnimation.removedOnCompletion= YES;
        
        [self.basicAnimation setValue:@"animation1" forKey:@"id"];//Sets the property of the receiver specified by a given key to a given value.
        [layer addAnimation:_basicAnimation forKey:@"KCBasicAnimation_Translation"];
        
        //Add the specified animation object to the layer’s render tree.The animation 'anim' is to be added to the render tree. This object is copied by the render tree, not referenced. Therefore, subsequent modifications to the object are not propagated into the render tree.
    }
}

-(void)Header_Animation
{
    NSLog(@"current pH value = %.2f",self.PH_value);
    [self Spring_Effect_With_Value:self.PH_value];
}

-(void)Header_Animation2_With:(double)current_PH_value
{
    self.testerrr = true;
    bb=[CABasicAnimation animationWithKeyPath:@"position"];
    bb.delegate = self;
    if(self.animation2_checker == 0)
    {
        self.animation2_checker = 1;
        bb.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.delegate.WIDTH*0.8,self.header.frame.origin.y+ self.long_offset+current_PH_value*2)];
        bb.toValue=[NSValue valueWithCGPoint:CGPointMake(self.delegate.WIDTH*0.8,self.header.frame.origin.y+ current_PH_value+self.long_offset)];
    }
    else
    {
        self.animation2_checker = 2;
        bb.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.delegate.WIDTH*0.8,self.header.frame.origin.y+current_PH_value*2)];
        bb.toValue=[NSValue valueWithCGPoint:CGPointMake(self.delegate.WIDTH*0.8,self.header.frame.origin.y+ current_PH_value)];
    }
    bb.duration=4.0;
    bb.speed = 2;
    bb.repeatCount=0;
    bb.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    bb.removedOnCompletion= YES;
    [self.header.layer addAnimation:bb forKey:nil];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
//Called when the animation completes its active duration or is removed from the object it is attached to.
{
    if(flag) //If YES, the animation reached the end of its active duration without being removed.
    {
        if(self.animation2_checker == 1)
        {
            self.header.frame = CGRectMake(self.delegate.WIDTH*0.77, self.header.frame.origin.y+ self.PH_value+self.long_offset,self.delegate.WIDTH*0.07,self.delegate.WIDTH*0.07);
            self.animation2_checker = 3;
        }
        else if(self.animation2_checker == 2)
        {
            self.header.frame = CGRectMake(self.delegate.WIDTH*0.77, self.header.frame.origin.y+ self.PH_value,self.delegate.WIDTH*0.07,self.delegate.WIDTH*0.07);
            self.animation2_checker = 3;
        }
         [self Water_Sound_Effect];
            if(self.testerrr)
            {
                 [self Fade_Animation];
                 [self Generate_point];
                 self.testerrr = false;
                if(self.pink_cover.layer.opacity<1)
                {
                    self.pink_cover.layer.opacity =  self.pink_cover.layer.opacity + 0.3;
                   
                }
                if(self.header.frame.origin.y >= 0.92*(self.PH_Indicator.frame.origin.y + self.PH_Indicator.frame.size.height)||self.PH_value>13)
                        {
                            //If PH=14 has been reached, we disable all remaining water-drop animations, and pop up a alert view to enable users to choose to see the corresponding chart or not.
                            
                            self.delegate.point_array = [NSArray arrayWithArray:(NSArray*)self.points_array];
                            [self Stop_Header_Animation];
                            [self Clear_droparray];
                            [self Pop_Complete_Message];
                        }
            }
            else
            {
                [self Generate_point];
                [self Header_Animation];
            }
        [self Update_PH_And_Vol_Buttons_Title];
        [self Close_Animation];
        [self.start setTitle:@"Tap" forState:UIControlStateNormal];
    }
    else
        NSLog(@"Ooopss");
}

-(void)Stop_Header_Animation
{
    bb.speed = 0;
    [self.header.layer removeAllAnimations];
}

-(void)Fade_Animation
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.type = kCATransitionFade;
    [self.pink_cover.layer addAnimation:transition forKey:@"FadeAnimation"];
}

-(void)Clear_droparray
{
    if([self.drop_array count] > 0)
    {
        for(unsigned i = 0; i<[self.drop_array count]; i++)
            [[self.drop_array objectAtIndex:i]removeFromSuperlayer];
        [self.drop_array removeAllObjects];
    }
}

-(void)Close_Animation
{
    if([self.drop_array count]>=1)
    {
        [[self.drop_array firstObject] removeFromSuperlayer];
        [self.drop_array removeObjectAtIndex:0];
    }
    else
        return;
}

-(void)Generate_point
{
    self.total_volume = self.total_volume + self.drop_volume;
    self.cumulated_OH_vol+=self.drop_volume;
    if(self.delegate.solu_select == 1)//HCOOH
    {
        self.mol_A = self.mol_A_Ref+self.cumulated_OH_vol*self.delegate.drop_conc;
        self.mol_HA = self.mol_HA_Ref - self.cumulated_OH_vol*self.delegate.drop_conc;
        [self Calculate_Concentration];
        if(self.mol_HA>0)
            self.PH_value = [self PH_Calculation_1_With_Conc:self.conc_A And_Conc:self.conc_HA];
        else if (self.mol_HA<0)
            self.PH_value = [self PH_Calculation_2_With_Conc:self.conc_HA];
        else
            return;
    }
    else if (self.delegate.solu_select == 0)//HCL
    {
        double temp_mol = self.intial_solu_conc *initial_vol-self.delegate.drop_conc*self.cumulated_OH_vol;
        if(temp_mol>0)
        {
            self.PH_value = (-1)*log10(temp_mol/self.total_volume);
        }
        else if(temp_mol<0)
        {
            self.PH_value = 14+log10(fabs(temp_mol/self.total_volume));
        }
        else
            self.PH_value = 7.00;
    }
    
    Table_Point* pt = [[Table_Point alloc]init];
    [pt Set_OH_Vol:self.cumulated_OH_vol];
    [pt Set_PH_value:self.PH_value];
    [self.points_array addObject:pt];
}

-(void)Pop_Complete_Message
{
    if(!self.alert2)
        self.alert2 = [[UIAlertView alloc]initWithTitle:@"Beyond equivalence point, experiment ended." message:@"Click to see the graph of the titration experiment." delegate:self cancelButtonTitle:@"Show Me" otherButtonTitles:nil];
    [self.alert2 show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
        self.chart = [[ChartViewController alloc]initWithNibName:nil bundle:nil];
        [self presentViewController:self.chart animated:YES completion:nil];
}

-(void)segment_clicked:(id)sender
{
    [self Tab_Sound_Effect];
    switch (self.drop_volume_seletion.selectedSegmentIndex) {
        case 0:
            self.drop_volume = 2.00E-04;
            break;
        case 1:
            self.drop_volume = 5.00E-04;
            break;
        case 2:
            self.drop_volume = 1.00E-03;
            break;
        case 3:
            self.drop_volume = 2.00E-03;
            break;
        case 4:
            self.drop_volume = 5.00E-03;
            break;
        default:
             self.drop_volume = 1.00E-03;
    }
}


-(void)Spring_Effect_With_Value:(float)to_value
{
    if(self.PH_value < 8)
    {
        [UIView animateWithDuration:5.0 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveLinear animations:^{ //对于弹簧动画模型，根本不需要自己手动创bounding point,只需设置终点即可!!!
            
            [self Adjust_header_frame_Using:to_value];
        } completion:nil];
    }
   else
        [self Header_Animation2_With:to_value];
}

-(void)Adjust_header_frame_Using:(float)to_value
{
    if (floorf(to_value*1.0E6) == 0)
    {
        self.header.frame =  CGRectMake(self.delegate.WIDTH*0.77, self.header.frame.origin.y+to_value*1.0E7, self.delegate.WIDTH*0.07,self.delegate.WIDTH*0.07);
    }
    else if (floorf(to_value*1.0E5) == 0)
    {
         self.header.frame =  CGRectMake(self.delegate.WIDTH*0.77, self.header.frame.origin.y+to_value*1.0E6, self.delegate.WIDTH*0.07,self.delegate.WIDTH*0.07);
    }
    else if (floorf(to_value*1.0E4) == 0)
    {
        self.header.frame =  CGRectMake(self.delegate.WIDTH*0.77, self.header.frame.origin.y+to_value*1.0E5, self.delegate.WIDTH*0.07,self.delegate.WIDTH*0.07);
    }
    else if (floorf(to_value*1.0E3) == 0)
    {
        self.header.frame =  CGRectMake(self.delegate.WIDTH*0.77, self.header.frame.origin.y+to_value*1.0E4, self.delegate.WIDTH*0.07,self.delegate.WIDTH*0.07);
    }
    else
    {
        if(self.delegate.solu_select == 1)//HCOOH
            self.header.frame =  CGRectMake(self.delegate.WIDTH*0.77, self.header.frame.origin.y+to_value/5, self.delegate.WIDTH*0.07,self.delegate.WIDTH*0.07);
        else if (self.delegate.solu_select == 0)//HCL
              self.header.frame =  CGRectMake(self.delegate.WIDTH*0.77, self.header.frame.origin.y+to_value, self.delegate.WIDTH*0.07,self.delegate.WIDTH*0.07);
    }
}

/**************************************  Essential Setups  ***********************************************/

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)Update_PH_And_Vol_Buttons_Title
{
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        if(self.cumulated_OH_vol > 10)
            [self.count setFont:[UIFont systemFontOfSize:20]];
        else
            [self.count setFont:[UIFont systemFontOfSize:30]];
    }
    else{
            if(self.cumulated_OH_vol > 10)
                [self.count setFont:[UIFont systemFontOfSize:10]];
            else
                [self.count setFont:[UIFont systemFontOfSize:15]];
    }
    [self.count setText:[NSString stringWithFormat:@"Vol: %.1f mL",self.cumulated_OH_vol*1.0E3]];
    [self.disp_PH setText:[NSString stringWithFormat:@"pH: %.2f",self.PH_value]];
}

-(void)ViewController_Initialization
{
    self.delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.drop_array = [NSMutableArray array];
    self.cumulated_OH_vol = 0.0;
    self.intial_solu_conc = 0.0;
    self.animation2_checker = 0;
    self.points_array = [NSMutableArray array];
    self.drop_volume = 1.00E-03;
    self.total_volume = initial_vol;
    self.testerrr = false;
    self.header.frame = CGRectMake(self.delegate.WIDTH*0.77, self.delegate.WIDTH*0.2, self.delegate.WIDTH*0.07, self.delegate.WIDTH*0.07);
    [self.pink_cover.layer setOpacity:0];
    self.drop_volume_seletion.selectedSegmentIndex = 2;
    [self Initial_Solution_Condition_Setup_Calculation];
     [self Update_PH_And_Vol_Buttons_Title];
}

-(void)Basic_Setup
{
    self.view.backgroundColor = [UIColor grayColor];
    
    self.header = [self Create_Button_WithFream:CGRectMake(self.delegate.WIDTH*0.77, self.delegate.WIDTH*0.2, self.delegate.WIDTH*0.07, self.delegate.WIDTH*0.07) AndTitle:nil AndBackgroundImage:@"1.png" OrBackgroundColor:nil Andfont:0 AndTitleColor:nil];
    self.header.enabled = NO;
    
    UIImage* back_ground_image = [self imageWithImage:[UIImage imageNamed:@"PastedGraphic.png"] scaledToSize:CGSizeMake(self.delegate.WIDTH*0.15, self.delegate.WIDTH*1.15)];
    
    self.PH_Indicator = [self Create_Button_WithFream:CGRectMake(self.delegate.WIDTH*0.8, self.delegate.WIDTH*0.1, self.delegate.WIDTH*0.15, self.delegate.WIDTH*1.13) AndTitle:nil AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:0 AndTitleColor:nil];
    [self.PH_Indicator setBackgroundImage:back_ground_image forState:UIControlStateNormal];
    self.PH_Indicator.enabled = NO;
    
      if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad||self.view.frame.size.height == 480)
      self.long_offset = self.PH_Indicator.frame.size.height*0.5;
    else
        self.long_offset = self.PH_Indicator.frame.size.height*0.7;
    
    [self.view addSubview:self.PH_Indicator];
     [self.view addSubview:self.header];
    
    self.droper = [self Create_Button_WithFream:CGRectMake(self.delegate.WIDTH*0.225, self.delegate.WIDTH*0.12, self.delegate.WIDTH*0.3, self.delegate.WIDTH*0.8) AndTitle:nil AndBackgroundImage:@"burette.png"OrBackgroundColor:nil Andfont:0 AndTitleColor:nil];
     self.droper.enabled = NO;
    [self.view addSubview:self.droper];
    
    self.container = [self Create_Button_WithFream:CGRectMake(self.delegate.WIDTH*0.15, self.delegate.WIDTH*0.85, self.delegate.WIDTH*0.45, self.delegate.WIDTH*0.45) AndTitle:nil AndBackgroundImage:@"container.png" OrBackgroundColor:nil Andfont:0 AndTitleColor:nil];
    [self.view addSubview:self.container];
    self.container.layer.cornerRadius = 10;
    self.container.enabled = NO;
    
    self.start = [self Create_Button_WithFream:CGRectMake(self.delegate.WIDTH*0.02, self.delegate.WIDTH*1.51, self.delegate.WIDTH*0.3, self.delegate.WIDTH*0.09) AndTitle:@"Tap" AndBackgroundImage:nil OrBackgroundColor:[UIColor orangeColor] Andfont:20 AndTitleColor:[UIColor whiteColor]];
    [self.start addTarget:self action:@selector(Start_Button_Clicked:) forControlEvents:UIControlEventTouchUpInside];
    self.start.layer.cornerRadius = 5;
    self.start.layer.borderColor = [UIColor whiteColor].CGColor;
    self.start.backgroundColor = [UIColor colorWithRed:(243/255.0) green:(168/255.0) blue:(62/255.0) alpha:1.0f];
    self.start.layer.borderWidth = self.delegate.WIDTH*0.005;
    self.start.layer.masksToBounds = YES;
    [self.view addSubview:self.start];
    
    self.count = [[UILabel alloc]initWithFrame: CGRectMake(self.delegate.WIDTH*0.35, self.delegate.WIDTH*1.51, self.delegate.WIDTH*0.3, self.delegate.WIDTH*0.09)];
    self.count.text = @"Vol: 0 mL";
    self.count.backgroundColor = [UIColor clearColor];
    self.count.font = [UIFont systemFontOfSize:15];
    self.count.textColor = [UIColor whiteColor];
    self.count.enabled = YES;
    self.count.textAlignment = NSTextAlignmentCenter;
    self.count.layer.cornerRadius = 5;
    self.count.layer.borderColor = [UIColor whiteColor].CGColor;
    self.count.layer.borderWidth = self.delegate.WIDTH*0.005;
    self.count.layer.masksToBounds = YES;
    [self.view addSubview:self.count];
    
    self.back = [self Create_Button_WithFream: CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.02, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.08)AndTitle:@"Return to Menu" AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor whiteColor]];
    [self.back addTarget:self action:@selector(Go_Back) forControlEvents:UIControlEventTouchUpInside];
    self.back.layer.borderColor = [UIColor whiteColor].CGColor;
    self.back.layer.borderWidth = self.delegate.WIDTH*0.005;
    self.back.layer.masksToBounds = YES;
    [self.view addSubview:self.back];

    self.disp_PH = [[UILabel alloc]initWithFrame: CGRectMake(self.delegate.WIDTH*0.68, self.delegate.WIDTH*1.51, self.delegate.WIDTH*0.3, self.delegate.WIDTH*0.09)];
    self.disp_PH.text = [NSString stringWithFormat:@"pH: %.2f",self.PH_value];
    self.disp_PH.backgroundColor = [UIColor grayColor];
    self.disp_PH.font = [UIFont systemFontOfSize:15];
    self.disp_PH.textColor = [UIColor whiteColor];
    self.disp_PH.textAlignment = NSTextAlignmentCenter;
    self.disp_PH.enabled = YES;
    self.disp_PH.layer.cornerRadius = 5;
    self.disp_PH.layer.borderColor = [UIColor whiteColor].CGColor;
    self.disp_PH.layer.borderWidth = self.delegate.WIDTH*0.005;
    self.disp_PH.layer.masksToBounds = YES;
    [self.view addSubview:self.disp_PH];
    
    [self Initialize_Water_Drop_Selection];
    [self Initialize_Pink_Cover];
    
    
    if(self.view.frame.size.height == 480)
    {
        self.PH_Indicator.frame = CGRectMake(self.delegate.WIDTH*0.8, self.delegate.WIDTH*0.1, self.delegate.WIDTH*0.15, self.delegate.WIDTH*1.0);
        self.droper.frame =  CGRectMake(self.delegate.WIDTH*0.225, self.delegate.WIDTH*0.12, self.delegate.WIDTH*0.3, self.delegate.WIDTH*0.6);
        self.container.frame = CGRectMake(self.delegate.WIDTH*0.15, self.delegate.WIDTH*0.65, self.delegate.WIDTH*0.45, self.delegate.WIDTH*0.4);
        self.start.frame = CGRectMake(self.delegate.WIDTH*0.02, self.delegate.WIDTH*1.25, self.delegate.WIDTH*0.3, self.delegate.WIDTH*0.08);
        self.count.frame = CGRectMake(self.delegate.WIDTH*0.35, self.delegate.WIDTH*1.25, self.delegate.WIDTH*0.3, self.delegate.WIDTH*0.08);
        self.disp_PH.frame = CGRectMake(self.delegate.WIDTH*0.68, self.delegate.WIDTH*1.25, self.delegate.WIDTH*0.3, self.delegate.WIDTH*0.08);
         self.drop_volume_seletion.frame = CGRectMake(_delegate.WIDTH*0.02,_delegate.WIDTH*1.15, _delegate.WIDTH*0.97,_delegate.WIDTH*0.08);
         self.pink_cover.frame = CGRectMake(self.delegate.WIDTH*0.15, self.delegate.WIDTH*0.87, self.delegate.WIDTH*0.45,self.delegate.WIDTH*0.185);
    }
    
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        self.PH_Indicator.frame = CGRectMake(self.delegate.WIDTH*0.8, self.delegate.WIDTH*0.1, self.delegate.WIDTH*0.15, self.delegate.WIDTH*0.8);
        self.droper.frame =  CGRectMake(self.delegate.WIDTH*0.225, self.delegate.WIDTH*0.12, self.delegate.WIDTH*0.3, self.delegate.WIDTH*0.5);
        self.container.frame = CGRectMake(self.delegate.WIDTH*0.15, self.delegate.WIDTH*0.55, self.delegate.WIDTH*0.4, self.delegate.WIDTH*0.35);
        self.start.frame = CGRectMake(self.delegate.WIDTH*0.02, self.delegate.WIDTH*1.1, self.delegate.WIDTH*0.3, self.delegate.WIDTH*0.08);
        self.count.frame = CGRectMake(self.delegate.WIDTH*0.35, self.delegate.WIDTH*1.1, self.delegate.WIDTH*0.3, self.delegate.WIDTH*0.08);
        self.disp_PH.frame = CGRectMake(self.delegate.WIDTH*0.68, self.delegate.WIDTH*1.1, self.delegate.WIDTH*0.3, self.delegate.WIDTH*0.08);
        self.drop_volume_seletion.frame = CGRectMake(_delegate.WIDTH*0.02,_delegate.WIDTH*1.0, _delegate.WIDTH*0.97,_delegate.WIDTH*0.08);
        self.pink_cover.frame = CGRectMake(self.delegate.WIDTH*0.15, self.delegate.WIDTH*0.73, self.delegate.WIDTH*0.4,self.delegate.WIDTH*0.17);
        
        self.start.titleLabel.font = [UIFont systemFontOfSize:30];
        self.disp_PH.font = [UIFont systemFontOfSize:30];
        self.count.font = [UIFont systemFontOfSize:30];
        [self.back.titleLabel setFont:[UIFont systemFontOfSize:30]];
       NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:30], NSFontAttributeName, nil];
        [self.drop_volume_seletion setTitleTextAttributes:dic forState:UIControlStateNormal];
    }
}

-(void)Initialize_Pink_Cover
{
    self.pink_cover = [[UIButton alloc]initWithFrame:CGRectMake(self.delegate.WIDTH*0.15, self.delegate.WIDTH*1.11, self.delegate.WIDTH*0.45,self.delegate.WIDTH*0.19)];
    [self.pink_cover.layer setOpacity:0];
    [self.pink_cover setBackgroundImage:[UIImage imageNamed:@"pink3.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.pink_cover];
}

-(void)Go_Back
{
    [self Tab_Sound_Effect];
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    if(self.delegate.go_back)
    {
        [self dismissViewControllerAnimated:NO completion:nil];
        self.delegate.go_back = false;
    }
    else{
        if(self.delegate.solu_select == 0)//HCL
            self.delegate.drop_conc = drop_concentration_HCL; //drop_concentration = 1, for HCL case.
        else
            self.delegate.drop_conc = drop_concentration_HCOOH; //HCOOH
        [self ViewController_Initialization];
    }
}

-(void)Water_Sound_Effect
{
    NSString* path = [[NSBundle mainBundle]pathForResource:@"water_drop" ofType:@"wav"];
    if(path)
    {
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL URLWithString:path], &soundID);
        AudioServicesPlaySystemSound(soundID);
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

-(double)Calulate_Mols
{
    if(self.delegate.solu_select == 0)//HCL
        return drop_concentration_HCL*self.drop_volume; //drop_concentration = 1, for HCL case.
    else
        return drop_concentration_HCOOH*self.drop_volume; //HCOOH
}

-(void) Calculate_Concentration
{
    self.conc_A = self.mol_A/self.total_volume;
    self.conc_HA = self.mol_HA/self.total_volume;
}

-(void)Initial_Solution_Condition_Setup_Calculation
{
    self.total_volume = initial_vol;
    if(self.delegate.solu_select == 0)//HCL
        self.intial_solu_conc = ((arc4random()%30)+10)/100.f;
    else
       self.intial_solu_conc = ((arc4random()%30)+10)/100.f;
    
    [self Setup_Initial_A_Conc];
    self.mol_A = self.total_volume*self.conc_A;
    self.mol_HA = self.total_volume*self.conc_HA;
    self.mol_A_Ref = self.mol_A;
    self.mol_HA_Ref = self.mol_HA;
    self.delegate.original_solu_conc = self.intial_solu_conc;
    self.PH_value = [self PH_Calculation_1_With_Conc:self.conc_A And_Conc:self.conc_HA];
    
    NSLog(@"Conc_A = %.3f",self.conc_A);
    NSLog(@"Conc_HA = %.3f",self.conc_HA);
    NSLog(@"PH value = %.3f",self.PH_value);
    NSLog(@"conc = %.3f",self.self.delegate.original_solu_conc);
}

-(void)Setup_Initial_A_Conc
{
    if(self.delegate.solu_select == 1)//HCOOH
    {
        self.conc_A =0.5*(sqrt(pow(Ka_HCOOH,2)+4*self.intial_solu_conc*Ka_HCOOH)-Ka_HCOOH);
        self.conc_HA = self.intial_solu_conc - self.conc_A;
    }
    else if(self.delegate.solu_select == 0)//HCL
    {
        self.conc_A =0.5*(sqrt(pow(Ka_HCL,2)+4*self.intial_solu_conc*Ka_HCL)-Ka_HCL);
        self.conc_HA = self.intial_solu_conc - self.conc_A;
    }
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

-(void)Initialize_Water_Drop_Selection
{
    self.drop_volume_seletion = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects: @"0.2 mL",@"0.5 mL",@"1.0 mL",@"2.0 mL",@"5.0 mL", nil]];
    self.drop_volume_seletion.frame = CGRectMake(_delegate.WIDTH*0.02,_delegate.WIDTH*1.4, _delegate.WIDTH*0.97,_delegate.WIDTH*0.08);
    self.drop_volume_seletion.layer.cornerRadius = 8;
    self.drop_volume_seletion.selectedSegmentIndex = 2;
    [self.drop_volume_seletion setBackgroundColor:[UIColor whiteColor]];
    [self.drop_volume_seletion addTarget:self action:@selector(segment_clicked:) forControlEvents:UIControlEventValueChanged];
    NSDictionary* dic;
    dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:12], NSFontAttributeName, nil];
    [self.drop_volume_seletion setTitleTextAttributes:dic forState:UIControlStateNormal];
    [self.view addSubview:self.drop_volume_seletion];
}

-(double)PH_Calculation_1_With_Conc:(double)conc_A_var And_Conc:(double)conc_HA_var
{
    double result;
    if(self.delegate.solu_select == 0)//HCL
    {
        result = (PKa_HCL + log10(conc_A_var/conc_HA_var));
    }
    else
        result = (PKa_HCOOH + log10(conc_A_var/conc_HA_var));
    if(result<0)
        result = pow(10, result);
    return result;
}

-(double)PH_Calculation_2_With_Conc:(double)conc_HA_var
{
    return (14+log10(fabs(conc_HA_var)));
}


@end
