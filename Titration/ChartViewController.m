//
//  ChartViewController.m
//  Titration
//
//  Created by Shuran Xu on 2015-07-31.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import "ChartViewController.h"

@interface ChartViewController ()

@end

@implementation ChartViewController
@synthesize chart = _chart;
@synthesize num_to_cut = _num_to_cut;
@synthesize vArr;
@synthesize reset_passed;
@synthesize did_check_zero;
@synthesize text;
@synthesize shortAnswer;
@synthesize chart_title;

- (instancetype)initWithNibName:(NSString *)nibName
                         bundle:(NSBundle *)nibBundle
{
    self = [super initWithNibName:nibName bundle:nibBundle];
    if(self)
    {
        self.num_to_cut = 0;
        self.reset_passed = false;
        self.did_check_zero = false;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.chart = [[LineChartView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self Data_Setup];
    [self.view addSubview:self.chart];
    
    self.back = [self Create_Button_WithFream: CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.1, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.08)AndTitle:@"Return to Menu" AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor whiteColor]];
    [self.back addTarget:self action:@selector(Go_Back) forControlEvents:UIControlEventTouchUpInside];
    self.back.layer.borderColor = [UIColor whiteColor].CGColor;
    self.back.layer.borderWidth = self.delegate.WIDTH*0.005;
    self.back.layer.masksToBounds = YES;

    [self.view addSubview:self.back];
    
    self.shortAnswer = [[UILabel alloc]initWithFrame:CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.2, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.5)];
    self.shortAnswer.text = [NSString stringWithFormat:@"Use ICE charts and Henderson-Hasselbach equation to calculate pH.\n\n Or, click to Show Answer."];
    self.shortAnswer.numberOfLines = -1;
    self.shortAnswer.layer.cornerRadius = 5;
    self.shortAnswer.textAlignment = NSTextAlignmentCenter;
    self.shortAnswer.textColor = [UIColor whiteColor];
    self.shortAnswer.font = [UIFont systemFontOfSize:15];
    self.shortAnswer.layer.borderColor = [UIColor whiteColor].CGColor;
    self.shortAnswer.layer.borderWidth = self.delegate.WIDTH*0.01;
    self.shortAnswer.layer.masksToBounds = YES;
    [self.view addSubview:self.shortAnswer];
    
    self.chart_title = [self Create_Button_WithFream:CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.75, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.1) AndTitle:@"pH versus volume NaOH added [mL]" AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:17 AndTitleColor:[UIColor blackColor]];
    [self.view addSubview:self.chart_title];
    
    self.text = [[UITextView alloc]initWithFrame:CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.2, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.5)];
    self.text.text = [NSString stringWithFormat:@"The equivalence point should occur when %.1f mL of NaOH has been added. At this volume, there are %.1f millimoles of NaOH. Since this is a 1:1 reaction, there are %.1f millimoles of acid. Dividing by the original volume of 50.0mL, the unknown concentration of the acid is %.2f M (molars). Check the graph to see if the equivalence point falls at the halfway mark of the jump in pH.",self.delegate.original_solu_conc*50/self.delegate.drop_conc ,self.delegate.original_solu_conc*50,self.delegate.original_solu_conc*50,self.delegate.original_solu_conc];
    
    self.text.textColor = [UIColor blackColor];
    self.text.backgroundColor = [UIColor whiteColor];
    self.text.layer.cornerRadius = 8;
    self.text.textAlignment = NSTextAlignmentLeft;
    self.text.font = [UIFont systemFontOfSize:12];
    self.text.editable = NO;
    self.text.layer.borderColor = [UIColor blackColor].CGColor;
    self.text.layer.borderWidth = self.delegate.WIDTH*0.01;
    [self.view addSubview:self.text];
    self.text.hidden = YES;
    
    if(self.view.frame.size.height == 480)
    {
        self.text.frame =CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.15, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.4);
        self.shortAnswer.frame = CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.15, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.4);
        self.back.frame = CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.08);
        
        self.chart_title.frame = CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.6, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.1);
    }
    if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
         self.back.frame = CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.08);
        
        self.text.frame =CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.15, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.3);
        self.shortAnswer.frame = CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.15, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.3);
         self.chart_title.frame = CGRectMake(self.delegate.WIDTH*0.05, self.delegate.WIDTH*0.46, self.delegate.WIDTH*0.9, self.delegate.WIDTH*0.1);
        [self.chart_title.titleLabel setFont:[UIFont systemFontOfSize:35]];
         self.text.font = [UIFont systemFontOfSize:30];
        [self.shortAnswer setFont:[UIFont systemFontOfSize:35]];
        [self.back.titleLabel setFont:[UIFont systemFontOfSize:35]];
    }
}

-(void)Data_Setup
{
    NSMutableArray *pointArr = [[NSMutableArray alloc]init];
    int limit = (int)[self.delegate.point_array count];
    
    //for point array:
    for(unsigned i = 0;i <limit;i++)
    {
        NSNumber* temp = [NSNumber numberWithDouble:[[self.delegate.point_array objectAtIndex:i] Get_OH_Vol]];
        double temp2 = [temp doubleValue]*1.0E3;
        double temp3 = [self.delegate.point_array[i] Get_PH_value];
        [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(temp2,temp3)]];
    }
    _chart.array = [NSArray arrayWithArray:(NSArray*)pointArr];
}

-(void)ShortAnswer_Clicked
{
    
    self.text.hidden = NO;
    self.shortAnswer.hidden = YES;
    [self Fade_Animation];
    
}

//当有一个或多个手指触摸事件在当前视图或window窗体中响应
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    int x = point.x;
    int y = point.y;
    
    if(x>self.delegate.WIDTH*0.05 && x<self.delegate.WIDTH*0.95 && y> self.delegate.WIDTH*0.2 && y<self.delegate.WIDTH*0.7)
        [self ShortAnswer_Clicked];
    else
        return;
}

-(void)Reset_Everything
{
    vArr = [NSMutableArray array];
    self.num_to_cut = 0;
    self.chart = nil;
}

-(void)Fade_Animation
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.type = kCATransitionFade;
    [self.text.layer addAnimation:transition forKey:@"FadeAnimation"];
}

-(void)Go_Back
{
    [self Reset_Everything];
    self.reset_passed = true;
    self.delegate.go_back = true;
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    if(self.reset_passed)
        [self Data_Setup];
    else
        return;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
 
 {
 int count = 0;
 int zero_counter=0;
 int counter = 0;//this saves the real index of vDes for PH=8.
 
 //横轴及点坐标
 NSMutableArray *hArr = [[NSMutableArray alloc]initWithCapacity:[self.delegate.point_array count]];
 int limit = (int)[self.delegate.point_array count];
 NSLog(@"limit count = %lu",[self.delegate.point_array count]);
 
 if(limit <= 10)
 {
 for( unsigned i = 0; i< limit; i++)
 {
 NSNumber* temp = [NSNumber numberWithDouble:[[self.delegate.point_array objectAtIndex:i] Get_OH_Vol]];
 double temp2 = [temp doubleValue]*1.0E3;
 [hArr addObject:[NSString stringWithFormat:@"%.2f",temp2]];
 }
 }
 else if(limit>20)
 {
 int offset = round((limit/7));
 for(unsigned j = 0; j<limit; j+=offset)
 {
 NSNumber* temp = [NSNumber numberWithDouble:[[self.delegate.point_array objectAtIndex:j] Get_OH_Vol]];
 double temp2 = [temp doubleValue]*1.0E3;
 [hArr addObject:[NSString stringWithFormat:@"%.2f",temp2]];
 }
 }
 else if(limit > 10 && limit<=20)
 {
 int offset = round((limit/6));
 for(unsigned j = 0; j<limit; j+=offset)
 {
 NSNumber* temp = [NSNumber numberWithDouble:[[self.delegate.point_array objectAtIndex:j] Get_OH_Vol]];
 double temp2 = [temp doubleValue]*1.0E3;
 [hArr addObject:[NSString stringWithFormat:@"%.2f",temp2]];
 }
 }
 
 if([self Check_Vertical_Array])
 self.chart.cut_num = self.num_to_cut;
 
 int zero_checker = 0;
 //竖轴
 vArr = [[NSMutableArray alloc]init];
 if(limit<=10)
 {
 for (int i=0; i<limit; i++)
 {
 double temp = [self.delegate.point_array[i] Get_PH_value];
 
 if(!self.did_check_zero)
 {
 zero_checker = [self Check_Zero];
 if(zero_checker == 0)
 [vArr addObject:[NSString stringWithFormat:@"0.00"]];
 }
 if(zero_checker > 0)
 {
 //判断多0的情况
 if(round(temp) == 0 && zero_counter == 0)
 {
 [vArr addObject:[NSString stringWithFormat:@"%.2f",temp]];
 zero_counter++;
 }
 }
 
 //添加8的情况
 if(temp > 8&&count == 0)
 {
 self.chart.saved_index = i;
 [vArr addObject:[NSString stringWithFormat:@"8.00"]];
 [vArr addObject:[NSString stringWithFormat:@"%.2f",temp]];
 count++;
 }
 else
 {
 if(round(temp)!= 0)
 [vArr addObject:[NSString stringWithFormat:@"%.2f",temp]];
 }
 
 }
 [vArr addObject:[NSString stringWithFormat:@"14.00"]];
 }
 else
 {
 double temp = (double)limit/10;
 int offset = ceil(temp);
 [self General_Steps_With_Offset:offset AndLimit:limit And_ZeroCounter:zero_counter AndCounter:counter WithCount:count];
 }
 
 NSLog(@"vArr = %@",vArr);
 NSLog(@"vArr count = %lu",(unsigned long)[vArr count]);
 
 _chart.hDesc = [NSArray arrayWithArray:(NSArray*)hArr];
 _chart.vDesc = [NSArray arrayWithArray:(NSArray*)vArr];
 
 }
 
 ********************************************************************************************************
 
 -(BOOL)Check_Vertical_Array
 {
 int counter = 0;
 int limit= (int)[self.delegate.point_array count];
 for(unsigned i = 0; i<limit;i++)
 {
 double temp = [self.delegate.point_array[i] Get_PH_value];
 if(temp<8)
 counter++;
 }
 if(counter> (int)limit*0.5)
 {
 self.num_to_cut = counter-(int)limit*0.5;
 return true;
 }
 else
 return false;
 }
 
 -(int)Check_Zero
 {
 self.did_check_zero = true;
 unsigned count = 0;
 for(unsigned i =0; i<self.delegate.point_array.count;i++)
 {
 if(round(self.delegate.point_array[i] == 0))
 count++;
 }
 return count;
 }
 
 -(void)General_Steps_With_Offset:(double)offset AndLimit:(int)limit And_ZeroCounter:(int)zero_counter AndCounter:(int)counter WithCount:(int)count
 {
 int zero_checker = 0;
 unsigned j = 0;
 while (j<limit)
 {
 if(self.num_to_cut>0)
 {
 self.num_to_cut = self.num_to_cut - 1;
 j = j+1;
 continue;
 }
 
 double temp = [self.delegate.point_array[j] Get_PH_value];
 
 if(!self.did_check_zero)
 {
 zero_checker = [self Check_Zero];
 if(zero_checker == 0)
 [vArr addObject:[NSString stringWithFormat:@"0.00"]];
 }
 if(zero_checker > 0)
 {
 //判断多0的情况
 if(round(temp) == 0 && zero_counter == 0)
 {
 [vArr addObject:[NSString stringWithFormat:@"%.2f",temp]];
 zero_counter++;
 }
 }
 
 if(temp > 8&&count == 0)
 {
 self.chart.saved_index = counter;
 [vArr addObject:[NSString stringWithFormat:@"8.00"]];
 [vArr addObject:[NSString stringWithFormat:@"%.2f",temp]];
 count++;
 }
 else
 {
 if(round(temp) != 0)
 [vArr addObject:[NSString stringWithFormat:@"%.2f",temp]];
 }
 
 counter++;
 
 j+= offset;
 }
 [vArr addObject:[NSString stringWithFormat:@"14.00"]];
 
 }

 */


@end
