//
//  View22.m
//  Ch05_TabBarController
//
//  Created by Shuran Xu on 2015-06-02.
//
//

#import "View22.h"

@interface View22 ()

@end

@implementation View22


#define Planckconstant_eV  4.135667E-15
#define EnergyToWaveLengthCoefficient 1.24
#define C 2.998E8
#define Planckconstant_J 6.62606957E-34

@synthesize input = _input;
@synthesize input2 = _input2;
@synthesize output = _output;
@synthesize energy = _energy;
@synthesize waveLength = _waveLength;
@synthesize segment = _segment;
@synthesize frequency = _frequency;
@synthesize switches2 = _switches2;
@synthesize offset = _offset;
@synthesize backward = _backward;
@synthesize button_CLR = _button_CLR;
@synthesize button_E = _button_E;
@synthesize button_point = _button_point;
@synthesize input_store = _input_store;
@synthesize choose = _choose;
@synthesize clear_all = _clear_all;
@synthesize label1 = _label1;
@synthesize label2 = _label2;
@synthesize label3 = _label3;
@synthesize saving = _saving;
@synthesize saved_data = _saved_data;
@synthesize checking = _checking;
@synthesize is_read = _is_read;
@synthesize ad_banner = _ad_banner;
@synthesize segment2 = _segment2;
@synthesize switch3 = _switch3;
@synthesize segment3 = _segment3;
@synthesize frequency_out = _frequency_out;
@synthesize result_string = _result_string;
@synthesize clicked = _clicked;
@synthesize button_3 = _button_3;

- (instancetype)initWithNibName:(NSString *)nibName
                         bundle:(NSBundle *)nibBundle
{
    self = [super initWithNibName:nibName bundle:nibBundle];
    self.energy = 0.0;
    self.waveLength = 0.0;
    self.offset = 0;
    self.input_value =0.0;
    self.output_value = 0.0;
    self.frequency = 0.0;
    self.switches2 = 0;
    self.choose = 0;
    self.saving = nil;
    self.input_store = [NSMutableString string];
    self.saved_data = [NSMutableString string];
    self.checking = false;
    self.is_read = false;
    self.clicked = false;
    self.frequency_out = nil;
    self.result_string = nil;
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
/*
    for (NSString* family in [UIFont familyNames]) {
        NSLog(@"%@\n", family);
        for (NSString* name in [UIFont fontNamesForFamilyName:family]) {
            NSLog(@"    %@\n", name);
        }
    }
 */
    
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.view.backgroundColor = [UIColor grayColor];
    self.segment = [[UISegmentedControl alloc]initWithItems:[[NSArray alloc]initWithObjects:@"J",@"eV", nil]];
    
    self.segment.frame = CGRectMake(delegate.WIDTH*0.5,delegate.WIDTH*0.46875, delegate.WIDTH*0.45,delegate.WIDTH*0.09);
    [self.segment.layer setCornerRadius:1.0];
    self.segment.layer.cornerRadius = 8;
    self.segment.selectedSegmentIndex = 0;
    [self.segment setBackgroundColor:[UIColor whiteColor]];
    [self.segment addTarget:self action:@selector(segment_clicked:) forControlEvents:UIControlEventValueChanged];
    
    self.segment2 = [[UISegmentedControl alloc]initWithItems:[[NSArray alloc]initWithObjects:@"Hz",@"cm⁻¹", nil]];
    self.segment2.frame = CGRectMake(delegate.WIDTH*0.5,delegate.WIDTH*0.15625,delegate.WIDTH*0.45,delegate.WIDTH*0.09);
    [self.segment2.layer setCornerRadius:1.0];
    self.segment2.layer.cornerRadius = 8;
    self.segment2.selectedSegmentIndex = 0;
    [self.segment2 setBackgroundColor:[UIColor whiteColor]];
    [self.segment2 addTarget:self action:@selector(segment2_clicked:) forControlEvents:UIControlEventValueChanged];
    NSDictionary* dic = nil;
    if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,  [UIFont systemFontOfSize:35],NSFontAttributeName ,nil];
    }
    else
    {
        dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,  [UIFont systemFontOfSize:18],NSFontAttributeName,nil];
    }
    [self.segment2 setTitleTextAttributes:dic forState:UIControlStateNormal];

    [self.view addSubview:self.segment2];
    
    NSDictionary* dic2 = nil;
    if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
         dic2 = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,  [UIFont systemFontOfSize:35],NSFontAttributeName ,nil];
    }
    else
    {
         dic2 = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,  [UIFont systemFontOfSize:18],NSFontAttributeName,nil];
    }
    [self.segment setTitleTextAttributes:dic2 forState:UIControlStateNormal];
    [self.view addSubview:self.segment];
    
    
    self.segment3 = [[UISegmentedControl alloc]initWithItems:[[NSArray alloc]initWithObjects:@"m",@"nm", nil]];
    self.segment3.frame = CGRectMake(delegate.WIDTH*0.5,delegate.WIDTH*0.3125,delegate.WIDTH*0.45,delegate.WIDTH*0.094);
    self.segment3.layer.cornerRadius = 8;
    self.segment3.selectedSegmentIndex = 1;
    [self.segment3 setBackgroundColor:[UIColor whiteColor]];
    [self.segment3 addTarget:self action:@selector(segment3_clicked:) forControlEvents:UIControlEventValueChanged];
    NSDictionary* dic3 = nil;
    if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        dic3 = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,  [UIFont systemFontOfSize:35],NSFontAttributeName ,nil];
    }
    else
    {
        dic3 = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,  [UIFont systemFontOfSize:18],NSFontAttributeName,nil];
    }
    [self.segment3 setTitleTextAttributes:dic3 forState:UIControlStateNormal];
    
    [self.view addSubview:self.segment3];

    
    //CGRectMake(20, 50, 120, 30)
    self.input = [[UITextView alloc]initWithFrame:CGRectMake(delegate.WIDTH*0.0625,delegate.WIDTH*0.15625, delegate.WIDTH*0.375,delegate.WIDTH*0.094)];
    self.input.font = [UIFont systemFontOfSize:13];
    self.input.textColor = [UIColor blackColor];
    self.input.layer.cornerRadius = 6;
    self.input.backgroundColor = [UIColor whiteColor];
    self.input.delegate = self;
    self.input.textAlignment = NSTextAlignmentCenter;
    self.input.text = nil;
    
    self.input.inputView =[[UIView alloc]initWithFrame:CGRectZero];//The custom input view to display when the text view becomes the first responder.
    
   // self.input.editable = NO;
    [self.view addSubview:self.input];
    
    self.label1 = [[UILabel alloc]initWithFrame:CGRectMake(delegate.WIDTH*0.12,delegate.WIDTH*0.15625, delegate.WIDTH*0.375,delegate.WIDTH*0.094)];
    self.label1.text = @"Frequency";
    self.label1.textColor = [UIColor lightGrayColor];
    [self.view addSubview:self.label1];
    
    //CGRectMake(20, 100, 120, 30)
    self.input2 = [[UITextView alloc]initWithFrame:CGRectMake(delegate.WIDTH*0.0625,delegate.WIDTH*0.3125, delegate.WIDTH*0.375,delegate.WIDTH*0.094)];
       self.input2.font = [UIFont systemFontOfSize:13];
    self.input2.textColor = [UIColor blackColor];
    self.input2.backgroundColor = [UIColor whiteColor];
    self.input2.delegate = self;
    self.input2.textAlignment = NSTextAlignmentCenter;
    self.input2.text = nil;
    self.input2.inputView =[[UIView alloc]initWithFrame:CGRectZero];
    self.input2.layer.cornerRadius = 6;
    [self.view addSubview:self.input2];
    
    self.label2 = [[UILabel alloc]initWithFrame:CGRectMake(delegate.WIDTH*0.12,delegate.WIDTH*0.3125, delegate.WIDTH*0.375,delegate.WIDTH*0.094)];
    self.label2.text = @"Wavelength";
    self.label2.textColor = [UIColor lightGrayColor];
    [self.view addSubview:self.label2];
    
    //CGRectMake(20, 150, 120, 30)
    self.output = [[UITextView alloc]initWithFrame:CGRectMake(delegate.WIDTH*0.0625,delegate.WIDTH*0.46875, delegate.WIDTH*0.375,delegate.WIDTH*0.094)];
    self.output.font = [UIFont systemFontOfSize:13];
    self.output.textColor = [UIColor blackColor];
    self.output.backgroundColor = [UIColor whiteColor];
    self.output.delegate = self;
    self.output.textAlignment = NSTextAlignmentCenter;
    self.output.text = nil;
    self.output.inputView =[[UIView alloc]initWithFrame:CGRectZero];
    self.output.layer.cornerRadius = 6;
    [self.view addSubview:self.output];
    
    self.label3 = [[UILabel alloc]initWithFrame:CGRectMake(delegate.WIDTH*0.15,delegate.WIDTH*0.46875, delegate.WIDTH*0.375,delegate.WIDTH*0.094)];
    self.label3.text = @"Energy";
    self.label3.textColor = [UIColor lightGrayColor];
    [self.view addSubview:self.label3];
    
     for(int i = 0; i<10; i++)
    {
        UIButton* button  = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        if(i<=9 && i>=6)
        {
            int offset = i-7;
            if(i == 6)
                offset = 3;
            button.frame = CGRectMake(delegate.WIDTH*0.05+offset*delegate.WIDTH*0.23, delegate.WIDTH*0.6875, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
            [button.titleLabel setFont:[UIFont systemFontOfSize:25]];
             [self Set_Number_Button_With:i Button:button];
            
            if([[UIScreen mainScreen]bounds].size.height == 480)
            {
                 button.frame = CGRectMake(delegate.WIDTH*0.05+offset*delegate.WIDTH*0.23, delegate.WIDTH*0.63, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
            }
            else if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
            {
                button.frame = CGRectMake(delegate.WIDTH*0.05+offset*delegate.WIDTH*0.23, delegate.WIDTH*0.55, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
                [button.titleLabel setFont:[UIFont systemFontOfSize:40]];

            }
            if(i == 6)
            {
                [button addTarget:self action:@selector(CLR_clicked:) forControlEvents:UIControlEventTouchUpInside];
                if(![[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
                    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
                [button setTitle:@"CLR" forState:UIControlStateNormal];
            }
            [button setBackgroundColor:[UIColor blackColor]];
             button.layer.cornerRadius = 5;
            if(i != 6)
            [button addTarget:self action:@selector(number_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
                
        }
        else if (i<=5 && i>=2)
        {
            i++;
            if(i == 4)
                self.offset = 0;
            else if (i == 5)
                self.offset = 1;
            else if (i == 6)
                self.offset = 2;
            else if (i == 3)
                self.offset = 3;
        
            button.frame = CGRectMake(delegate.WIDTH*0.05+self.offset*delegate.WIDTH*0.23, delegate.WIDTH*0.859375, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
            [self.view addSubview:button];
            [button.titleLabel setFont:[UIFont systemFontOfSize:25]];
            if([[UIScreen mainScreen]bounds].size.height == 480)
            {
                button.frame = CGRectMake(delegate.WIDTH*0.05+self.offset*delegate.WIDTH*0.23, delegate.WIDTH*0.76, delegate.WIDTH*0.22, delegate.WIDTH*0.12);

            }
            else if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
            {
                 button.frame = CGRectMake(delegate.WIDTH*0.05+self.offset*delegate.WIDTH*0.23, delegate.WIDTH*0.68, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
                 [button.titleLabel setFont:[UIFont systemFontOfSize:40]];
            }
            if(i == 3)
            {
                [button addTarget:self action:@selector(back_clicked:) forControlEvents:UIControlEventTouchUpInside];
                
                if([[self System_Version] isEqualToString:@"7.1"])
                {
                    [button setTitle:@"<-" forState:UIControlStateNormal];
                    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                    [button setBackgroundColor:[UIColor blackColor]];
                    
                }
                else
                {
                    [button.titleLabel setFont:[UIFont fontWithName:@"SymbolSigns-Basisset" size:25]];
                    [button setTitle:@"L" forState:UIControlStateNormal];
                    [button setBackgroundColor:[UIColor blackColor]];
                    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                }
                
                if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
                    [button.titleLabel setFont:[UIFont systemFontOfSize:40]];
                
                button.layer.cornerRadius = 5;
                i = i -1;
                continue;
            }
            else
            {
                 [self Set_Number_Button_With:i Button:button];
                [button setBackgroundColor:[UIColor blackColor]];
                 button.layer.cornerRadius = 5;
                [button addTarget:self action:@selector(number_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
                if(![[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
                    [button.titleLabel setFont:[UIFont systemFontOfSize:25]];
            }
            i= i -1;
        }
        else if(i<2)
        {
            i++;
            if(i == 1)
                self.offset = 0;
            else if( i == 2)
                 self.offset = 1;
            else
            self.offset = 2;
            
             button.frame = CGRectMake(delegate.WIDTH*0.05+self.offset*delegate.WIDTH*0.23, delegate.WIDTH*1.04, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
            [self Set_Number_Button_With:i Button:button];
            [button.titleLabel setFont:[UIFont systemFontOfSize:25]];

            if([[UIScreen mainScreen]bounds].size.height == 480)
            {
                  button.frame = CGRectMake(delegate.WIDTH*0.05+self.offset*delegate.WIDTH*0.23, delegate.WIDTH*0.89, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
            }
            else if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
            {
                 button.frame = CGRectMake(delegate.WIDTH*0.05+self.offset*delegate.WIDTH*0.23, delegate.WIDTH*0.81, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
                [button.titleLabel setFont:[UIFont systemFontOfSize:40]];

            }
            [button setBackgroundColor:[UIColor blackColor]];
             button.layer.cornerRadius = 5;
            [button addTarget:self action:@selector(number_button_clicked:) forControlEvents:UIControlEventTouchUpInside];

            i--;

        }
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.view addSubview:button];
    }
    
    self.button_3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.offset = 2;
    [_button_3 setTitle:@"3" forState:UIControlStateNormal];
    [_button_3.titleLabel setFont:[UIFont systemFontOfSize:25]];
    self.button_3.frame = CGRectMake(delegate.WIDTH*0.05+self.offset*delegate.WIDTH*0.23, delegate.WIDTH*1.04, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
    if([[UIScreen mainScreen]bounds].size.height == 480)
    {
        self.button_3.frame = CGRectMake(delegate.WIDTH*0.05+self.offset*delegate.WIDTH*0.23, delegate.WIDTH*0.89, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
    }
     else if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
     {
        self.button_3.frame = CGRectMake(delegate.WIDTH*0.05+self.offset*delegate.WIDTH*0.23, delegate.WIDTH*0.81, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
         [self.button_3.titleLabel setFont:[UIFont systemFontOfSize:40]];
         
     }
    [self.button_3 setBackgroundColor:[UIColor blackColor]];
    self.button_3.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.button_3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.button_3 addTarget:self action:@selector(number_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    self.button_3.layer.cornerRadius = 5;
    [self.view addSubview:self.button_3];
    
    self.offset = 0;
    UIButton* zero_button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    zero_button.frame = CGRectMake(delegate.WIDTH*0.05+self.offset*delegate.WIDTH*0.23, delegate.WIDTH*1.203125, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
     [zero_button.titleLabel setFont:[UIFont systemFontOfSize:25]];
    if([[UIScreen mainScreen]bounds].size.height == 480)
    {
         zero_button.frame = CGRectMake(delegate.WIDTH*0.05+self.offset*delegate.WIDTH*0.23, delegate.WIDTH*1.02, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
    }
    else if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        zero_button.frame = CGRectMake(delegate.WIDTH*0.05+self.offset*delegate.WIDTH*0.23, delegate.WIDTH*0.94, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
        [zero_button.titleLabel setFont:[UIFont systemFontOfSize:40]];
    }
    [zero_button.layer setCornerRadius:5];
    [zero_button setTitle:@"0" forState:UIControlStateNormal];
    [zero_button addTarget:self action:@selector(number_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    zero_button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [zero_button setBackgroundColor:[UIColor blackColor]];
    [zero_button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:zero_button];


    //For point button:
    self.offset = 1;
    self.button_point = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button_point.frame = CGRectMake(delegate.WIDTH*0.05+self.offset*delegate.WIDTH*0.23, delegate.WIDTH*1.203125, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
     [self.button_point.titleLabel setFont:[UIFont systemFontOfSize:30]];
    if([[UIScreen mainScreen]bounds].size.height == 480)
    {
      self.button_point.frame = CGRectMake(delegate.WIDTH*0.05+self.offset*delegate.WIDTH*0.23, delegate.WIDTH*1.02, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
    }
    else if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
         self.button_point.frame = CGRectMake(delegate.WIDTH*0.05+self.offset*delegate.WIDTH*0.23, delegate.WIDTH*0.94, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
         [self.button_point.titleLabel setFont:[UIFont systemFontOfSize:40]];
    }
    [self.button_point.layer setCornerRadius:5];
    [self.button_point addTarget:self action:@selector(number_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    self.button_point.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.button_point setBackgroundColor:[UIColor blackColor]];
    [self.button_point setTitle:@"." forState:UIControlStateNormal];
    [self.button_point setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:self.button_point];
    
    //For button E:
     self.offset = 3;
    self.button_E = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button_E.frame = CGRectMake(delegate.WIDTH*0.05+self.offset*delegate.WIDTH*0.23, delegate.WIDTH*1.04, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
     [self.button_E.titleLabel setFont:[UIFont systemFontOfSize:25]];
    if([[UIScreen mainScreen]bounds].size.height == 480)
    {
        self.button_E.frame = CGRectMake(delegate.WIDTH*0.05+self.offset*delegate.WIDTH*0.23, delegate.WIDTH*0.89, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
    }
    else if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
         self.button_E.frame = CGRectMake(delegate.WIDTH*0.05+self.offset*delegate.WIDTH*0.23, delegate.WIDTH*0.81, delegate.WIDTH*0.22, delegate.WIDTH*0.12);
         [self.button_E.titleLabel setFont:[UIFont systemFontOfSize:40]];
    }
    [self.button_E.layer setCornerRadius:5];
    [self.button_E setTitle:@"E" forState:UIControlStateNormal];
    [self.button_E setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.button_E setBackgroundColor:[UIColor blackColor]];
    self.button_E.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.button_E addTarget:self action:@selector(number_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button_E];
    
    //For equal button:
    self.equal_button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.equal_button.frame =CGRectMake(delegate.WIDTH*0.515, delegate.WIDTH*1.203125, delegate.WIDTH*0.44, delegate.WIDTH*0.12);
    self.offset = 2;
     [self.equal_button.titleLabel setFont:[UIFont systemFontOfSize:20]];
    if([[UIScreen mainScreen]bounds].size.height == 480)
    {
        self.equal_button.frame =CGRectMake(delegate.WIDTH*0.05+self.offset*delegate.WIDTH*0.23, delegate.WIDTH*1.02, delegate.WIDTH*0.45, delegate.WIDTH*0.12);
    }
    else if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
         self.equal_button.frame =CGRectMake(delegate.WIDTH*0.515, delegate.WIDTH*0.94, delegate.WIDTH*0.44, delegate.WIDTH*0.12);
         [self.equal_button.titleLabel setFont:[UIFont systemFontOfSize:40]];
    }
    [self.equal_button.layer setCornerRadius:5];

    [self.equal_button addTarget:self action:@selector(equal_clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.equal_button setTitle:@"Calculate" forState:UIControlStateNormal];
    [self.equal_button setBackgroundColor:[UIColor blackColor]];
    [self.equal_button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:self.equal_button];
    
    //Setup clear_all button:
    self.clear_all = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.clear_all.frame =CGRectMake(delegate.WIDTH*0.51, delegate.WIDTH*1.36, delegate.WIDTH*0.45, delegate.WIDTH*0.12);
    [self.clear_all.layer setCornerRadius:5];
    [self.clear_all addTarget:self action:@selector(clear_all_clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.clear_all setTitle:@"CLEAR ALL" forState:UIControlStateNormal];
    self.clear_all.backgroundColor = [UIColor orangeColor];
    [self.clear_all.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [self.clear_all setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.clear_all];
    
    self.saving = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.saving.frame =CGRectMake(delegate.WIDTH*0.05, delegate.WIDTH*1.36, delegate.WIDTH*0.45, delegate.WIDTH*0.12);
    [self.saving.layer setCornerRadius:5];
    [self.saving addTarget:self action:@selector(saving_clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.saving setTitle:@"SAVE" forState:UIControlStateNormal];
    self.saving.backgroundColor = [UIColor redColor];
    [self.saving.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [self.saving setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.saving];
    
    
 /*   CGPoint ad_origin = CGPointMake(0.0, [[UIScreen mainScreen]bounds].size.height - delegate.WIDTH*0.3); // shows ad at bottom.
    CGSize ad_size=CGSizeMake(delegate.WIDTH,delegate.WIDTH*0.15);
    GADAdSize custom_gAd_size = GADAdSizeFromCGSize(ad_size);
    _ad_banner = [[GADBannerView alloc] initWithAdSize:custom_gAd_size origin:ad_origin];
    _ad_banner.adUnitID = @"ca-app-pub-2734087962752348/4895253913";
    _ad_banner.rootViewController = self;
    [self.view addSubview:_ad_banner];
    [_ad_banner loadRequest:[GADRequest request]]; */
    
    if([[UIScreen mainScreen]bounds].size.height == 480)
    {
        self.input.frame =  CGRectMake(delegate.WIDTH*0.0625,delegate.WIDTH*0.14, delegate.WIDTH*0.375,delegate.WIDTH*0.094);
        
        self.input2.frame = CGRectMake(delegate.WIDTH*0.0625,delegate.WIDTH*0.3, delegate.WIDTH*0.375,delegate.WIDTH*0.094);
        self.label1.frame = CGRectMake(delegate.WIDTH*0.12,delegate.WIDTH*0.14, delegate.WIDTH*0.375,delegate.WIDTH*0.094);
        
         self.label2.frame = CGRectMake(delegate.WIDTH*0.12,delegate.WIDTH*0.3, delegate.WIDTH*0.375,delegate.WIDTH*0.094);
        
        self.label3.frame = CGRectMake(delegate.WIDTH*0.15,delegate.WIDTH*0.44, delegate.WIDTH*0.375,delegate.WIDTH*0.094);
        
         self.output.frame = CGRectMake(delegate.WIDTH*0.0625,delegate.WIDTH*0.45, delegate.WIDTH*0.375,delegate.WIDTH*0.094);
        
        self.backward.frame =CGRectMake(delegate.WIDTH*0.094, delegate.WIDTH*1.06, delegate.WIDTH*0.109375, delegate.WIDTH*0.109375);
        
         self.button_CLR.frame =CGRectMake(delegate.WIDTH*0.3125, delegate.WIDTH*1.06, delegate.WIDTH*0.109375, delegate.WIDTH*0.109375);
        self.clear_all.frame =CGRectMake(delegate.WIDTH*0.5, delegate.WIDTH*1.2, delegate.WIDTH*0.4, delegate.WIDTH*0.09);
        
         self.saving.frame =CGRectMake(delegate.WIDTH*0.09, delegate.WIDTH*1.2, delegate.WIDTH*0.4, delegate.WIDTH*0.09);
        
    }
    
   else if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        self.label1.font = [UIFont systemFontOfSize:35];
        self.label2.font = [UIFont systemFontOfSize:35];
        self.label3.font = [UIFont systemFontOfSize:35];
        self.input.frame =  CGRectMake(delegate.WIDTH*0.0625,delegate.WIDTH*0.1, delegate.WIDTH*0.375,delegate.WIDTH*0.09);
        self.input2.frame = CGRectMake(delegate.WIDTH*0.0625,delegate.WIDTH*0.25, delegate.WIDTH*0.375,delegate.WIDTH*0.09);
        self.label1.frame = CGRectMake(delegate.WIDTH*0.12,delegate.WIDTH*0.1, delegate.WIDTH*0.375,delegate.WIDTH*0.09);
        self.label2.frame = CGRectMake(delegate.WIDTH*0.12,delegate.WIDTH*0.25, delegate.WIDTH*0.375,delegate.WIDTH*0.09);
        self.label3.frame = CGRectMake(delegate.WIDTH*0.15,delegate.WIDTH*0.4, delegate.WIDTH*0.375,delegate.WIDTH*0.09);
        self.output.frame = CGRectMake(delegate.WIDTH*0.0625,delegate.WIDTH*0.4, delegate.WIDTH*0.375,delegate.WIDTH*0.09);
        
        self.clear_all.frame =CGRectMake(delegate.WIDTH*0.51, delegate.WIDTH*1.1, delegate.WIDTH*0.45, delegate.WIDTH*0.12);
        self.saving.frame =CGRectMake(delegate.WIDTH*0.05, delegate.WIDTH*1.1, delegate.WIDTH*0.44, delegate.WIDTH*0.12);
        [self.clear_all.titleLabel setFont:[UIFont systemFontOfSize:35]];
        [self.saving.titleLabel setFont:[UIFont systemFontOfSize:35]];
        
        self.clear_all.layer.cornerRadius = 10;
        [self.equal_button.titleLabel setFont:[UIFont systemFontOfSize:35]];
        self.equal_button.layer.cornerRadius = 10;
        self.input.layer.cornerRadius = 10;
        self.input2.layer.cornerRadius = 10;
        self.output.layer.cornerRadius = 10;
        self.segment.layer.cornerRadius = 10;
        self.saving.layer.cornerRadius = 10;
    
    
    
     self.segment.frame = CGRectMake(delegate.WIDTH*0.5,delegate.WIDTH*0.1, delegate.WIDTH*0.45,delegate.WIDTH*0.09);
    self.segment2.frame = CGRectMake(delegate.WIDTH*0.5,delegate.WIDTH*0.25,delegate.WIDTH*0.45,delegate.WIDTH*0.09);
    self.segment3.frame = CGRectMake(delegate.WIDTH*0.5,delegate.WIDTH*0.4,delegate.WIDTH*0.45,delegate.WIDTH*0.094);
    
    }
}

-(void)Set_Number_Button_With:(int)index Button:(UIButton*)button
{
    switch (index) {
        case 0:
            [button setTitle:@"0" forState:UIControlStateNormal];
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            break;
        case 1:
            [button setTitle:@"1" forState:UIControlStateNormal];
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            break;
        case 2:
            [button setTitle:@"2" forState:UIControlStateNormal];
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            break;
        case 3:
            [button setTitle:@"3" forState:UIControlStateNormal];
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            break;
        case 4:
            [button setTitle:@"4" forState:UIControlStateNormal];
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            break;
        case 5:
            [button setTitle:@"5" forState:UIControlStateNormal];
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            break;
        case 6:
            [button setTitle:@"6" forState:UIControlStateNormal];
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            break;
        case 7:
            [button setTitle:@"7" forState:UIControlStateNormal];
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            break;
        case 8:
            [button setTitle:@"8" forState:UIControlStateNormal];
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            break;
        case 9:
            [button setTitle:@"9" forState:UIControlStateNormal];
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            break;
    }
}


-(void)clear_all_clicked:(id)sender
{
     [self Sound_Effect3];
    self.choose = 0;
    self.switches2 = 0;
    [self.input_store deleteCharactersInRange:NSMakeRange(0, [self.input_store length])];
    if(self.input_store == nil)
        self.input_store = [[NSMutableString alloc]init];
    self.frequency = 0.0;
    self.energy = 0.0;
    self.waveLength = 0.0;
    self.input.text = nil;
    self.input2.text = nil;
    self.output.text = nil;
    self.label1.hidden = NO;
    self.label2.hidden = NO;
    self.label3.hidden = NO;
    [self Disable_All_First_Responder];
}

-(void)saving_clicked:(id)sender
{
    [self Sound_Effect3];
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Data saved to Note Tab." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

-(NSString*)System_Version
{
    return [[UIDevice currentDevice]systemVersion];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(delegate.sentence)
    {
        delegate.sentence = nil;
        delegate.sentence = [NSMutableString string];
    }
    
    if(![self.input.text isEqualToString:@""] &&![self.input2.text isEqualToString:@""]&&![self.output.text isEqualToString:@""])
    {
        NSString* temp1 = [NSString stringWithFormat:@"Energy:"];
        NSString* temp2 = [NSString stringWithFormat:@"Frequency:"];
        NSString* temp3 = [NSString stringWithFormat:@"Wavelength:"];
        
        NSString* unit1;
        if(self.checking)
            unit1 = [NSString stringWithFormat:@" eV"];
        else
            unit1 = [NSString stringWithFormat:@" J"];
        
        NSString* unit2 = [NSString stringWithFormat:@"Hz"];
        NSString* unit3 = [NSString stringWithFormat:@"nm"];
        NSString* temp4 = [NSString stringWithFormat:@"Photon is in "];
        
       if(!self.clicked)
       {
           float convert_result = 1.0E7/self.waveLength; //the wavelength is in unit nm.
           [self Simplify_converted_value_with:convert_result];
       }

        [delegate.sentence appendString:temp1];
        [delegate.sentence appendString:self.output.text];
        [delegate.sentence appendString:unit1];
        [delegate.sentence appendFormat:@"\n "];
        [delegate.sentence appendString:temp2];
        [delegate.sentence appendString:self.input.text];
        [delegate.sentence appendString:unit2];
        [delegate.sentence appendFormat:@" ="];
        [delegate.sentence appendString:self.result_string];
        [delegate.sentence appendFormat:@" cm⁻¹"];
        [delegate.sentence appendFormat:@"\n "];
        [delegate.sentence appendString:temp3];
        [delegate.sentence appendString:self.input2.text];
        [delegate.sentence appendString:unit3];
        [delegate.sentence appendFormat:@"\n "];
        [delegate.sentence appendString:temp4];
        [delegate.sentence appendString:[self Determine_WaveLength]];
        [delegate.sentence appendFormat:@"\n "];
        [delegate.sentence appendFormat:@"\n "];
        
        if(!self.is_read)
        {
            [self Read_Data_From_Local_File];
            [self Data_Transmit_to_Local_File];
            self.is_read = true;
        }
        else
        [self Data_Transmit_to_Local_File];
    }
}


-(void)Sound_Effect
{
    NSString* path = [[NSBundle mainBundle]pathForResource:@"C" ofType:@"wav"];
    if(path)
    {
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL URLWithString:path], &soundID);
        AudioServicesPlaySystemSound(soundID);
    }
}

-(void)Sound_Effect2
{
    NSString* path = [[NSBundle mainBundle]pathForResource:@"units" ofType:@"wav"];
    if(path)
    {
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL URLWithString:path],&soundID);
        AudioServicesPlaySystemSound(soundID);
    }
}

-(void)Sound_Effect3
{
    NSString* path = [[NSBundle mainBundle]pathForResource:@"OR" ofType:@"wav"];
    if(path)
    {
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL URLWithString:path], &soundID);
        AudioServicesPlaySystemSound(soundID);
    }
}


-(NSString*) Find_File_Path
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);//Creates a list of directory search paths.
    NSString* documentsDirPath = [paths objectAtIndex:0];//Obtain the path for Documents directory.
    NSString* DirPath = [documentsDirPath stringByAppendingPathComponent:@"Data"];//Create an new path under "Document" directory.
    NSString* FilePath = [DirPath stringByAppendingPathComponent:@"data.txt"];//Create a path for the text file for the saving data under "Document" directory.
    
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
            return NULL;
        }
    }
    return FilePath;
}

-(void)Data_Transmit_to_Local_File
{
    NSString* filePath = [self Find_File_Path];
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    // Transfer elements of self.name_data into NSString type data:
    if([self.saved_data length]>0)
    {
        [self.saved_data appendFormat:@","];
        [self.saved_data appendString:delegate.sentence];
    }
    else
        [self.saved_data appendString:delegate.sentence];
    //Encode productInfoString, and save it in our new file:
    NSData* nameData = [self.saved_data dataUsingEncoding:NSUTF8StringEncoding];//Returns an NSData object containing a representation of the receiver encoded using a given encoding.
    
    if(![fileManager createFileAtPath:filePath contents:nameData attributes:nil])
    {
        printf("Fail to create file to store data");
        return;
    }
}


-(void)Read_Data_From_Local_File
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);//Creates a list of directory search paths.
    NSString* documentsDirPath = [paths objectAtIndex:0];//Obtain the path for Documents directory.
    NSString* DirPath = [documentsDirPath stringByAppendingPathComponent:@"Data"];//Create an new path under "Document" directory.
    NSString* FilePath = [DirPath stringByAppendingPathComponent:@"data.txt"];//Create a path for the text file for the saving data under "Document" directory.
    NSError* error;
    //Read data from the local file:
    NSString* nameInfoString = [NSString stringWithContentsOfFile:FilePath encoding:NSUTF8StringEncoding error:&error];
    if(nameInfoString != NULL)
    {
        [self.saved_data appendString:nameInfoString];
    }
}


-(void)Disable_All_First_Responder
{
    if([self.input isFirstResponder])
        [self.input resignFirstResponder];
    else if([self.input2 isFirstResponder])
        [self.input2 resignFirstResponder];
    else if([self.output isFirstResponder])
        [self.output resignFirstResponder];
}

-(void)Set_Up_Border_Color_For:(UITextView*)textView
{
     AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    textView.layer.borderWidth = delegate.WIDTH*0.01;
    textView.layer.masksToBounds = YES;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGFloat r = (CGFloat) 255/255;
    CGFloat g = (CGFloat) 97/255;
    CGFloat b = (CGFloat) 0/255;
    CGFloat a = (CGFloat) 1.0;
    CGFloat components[4] = {r,g,b,a};
    CGColorRef color = CGColorCreate(colorSpaceRef,components);
    textView.layer.borderColor = color;

}

-(void)Restore_Border_Color_For:(UITextView*)textView
{
    textView.layer.borderWidth = 0;
    
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if(textView == self.input)
    {
        [self Restore_Border_Color_For:self.input];
    }
    else if(textView == self.input2)
    {
        [self Restore_Border_Color_For:self.input2];
    }
    else if(textView == self.output)
    {
       [self Restore_Border_Color_For:self.output];
    }

}
- (void)textViewDidChangeSelection:(UITextView *)textView
{
    
    if(textView == self.input)
    {
        self.choose = 1; //For frequency
        self.label1.hidden = YES;
    }
    else if(textView == self.input2)
    {
        self.choose = 2; //For waveLength
        self.label2.hidden = YES;
        
    }
    else if(textView == self.output)
    {
        self.choose = 3; //For energy
        self.label3.hidden = YES;
    }
}

-(void)number_button_clicked:(id)sender
{
    [self Sound_Effect];
    UIButton* value = (UIButton*)sender;
    [self.input_store appendString:value.titleLabel.text];
    [self Update_the_View];
}

-(void)back_clicked:(id)sender
{
    UIButton* item = (UIButton*)sender;
    [item setTitle:@"<-" forState:UIControlStateNormal];
    [self Sound_Effect];
    if([self.input_store length] != 0 )
    {
        NSRange range = NSMakeRange([self.input_store length]-1, 1);//Creates a new NSRange from the specified values.
        [self.input_store deleteCharactersInRange:range];
        [self Update_the_View];
    }
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if(textView == self.input)
    {
        self.choose = 1; //For frequency
        self.label1.hidden = YES;
        [self Set_Up_Border_Color_For:self.input];
        [self frequency_clicked];
    }
    else if(textView == self.input2)
    {
        self.choose = 2; //For waveLength
        self.label2.hidden = YES;
         [self Set_Up_Border_Color_For:self.input2];
        [self wavelength_clicked];

    }
    else if(textView == self.output)
    {
        self.choose = 3; //For energy
         [self Set_Up_Border_Color_For:self.output];
        self.label3.hidden = YES;
        [self energy_clicked];

    }
}

- (void)textViewDidChange:(UITextView *)textView //Tells the delegate that the text or attributes in the specified text view were changed by the user.
{
    if(textView == self.input)
    {
        self.choose = 1; //For frequency
        self.label1.hidden = YES;
        [self frequency_clicked];
    }
    else if(textView == self.input2)
    {
        self.choose = 2; //For waveLength
        self.label2.hidden = YES;
        [self wavelength_clicked];
        
    }
    else if(textView == self.output)
    {
        self.choose = 3; //For energy
        self.label3.hidden = YES;
        [self energy_clicked];
    }
}


-(void)Update_the_View
{
   
    if(self.choose == 1)
    {
        self.input.text = self.input_store;
        self.label1.hidden = YES;
    }
    else if(self.choose == 2)
    {
        self.input2.text = self.input_store;
        self.label2.hidden = YES;
    }
    else if(self.choose == 3)
    {
        self.output.text = self.input_store;
        self.label3.hidden = YES;
    }
}

-(void)CLR_clicked:(id)sender
{
     [self Sound_Effect];
    [self.input_store deleteCharactersInRange:NSMakeRange(0, [self.input_store length])];
    [self Update_the_View];
    
}

-(void)equal_clicked:(id)sender
{
     [self Sound_Effect];
    if(self.choose == 1)
        [self textViewChanged:self.input];
    else if(self.choose == 2)
        [self textViewChanged:self.input2];
    else if(self.choose == 3)
        [self textViewChanged:self.output];
}


-(void) segment3_clicked:(id)sender
{
    [self Sound_Effect2];
    if(self.segment3.selectedSegmentIndex == 0) //the unit will be m
    {
       if(self.waveLength != 0)
       {
           self.waveLength = self.waveLength/1.0E6;
           [self convert_waveLength];
           self.waveLength = self.waveLength*1.0E6;
           
       }
    }
    else //convert to nm
    {
        if(self.waveLength != 0)
        {
            self.waveLength = self.waveLength*1.0E3;
            [self convert_waveLength];
            self.waveLength = self.waveLength/1.0E3;
            
        }

    }
}


-(void) segment2_clicked:(id)sender
{
   [self Sound_Effect2];
    if(self.segment2.selectedSegmentIndex == 0)
    {
        self.switch3 = false;
        [self frequency_Conversion];
    }
    else
    {
        self.switch3 = true;
        [self frequency_Conversion];
    }

}

-(void)frequency_Conversion
{
    if(self.segment2.selectedSegmentIndex == 1)//to convert to cm-1
    {
        if(self.waveLength != 0) //wavelength is savd as um.
        {
            self.clicked = true;
            float temp = self.waveLength*1.0E3;//temp is in nm.
            float convert_result = 1.0E7/temp;
            [self Simplify_converted_value_with:convert_result];
            
        }
    }
    else //to convert to Hz.
    {
        [self convert_frequency_With_Frequency:self.frequency];
    }
}


-(void)Simplify_converted_value_with:(float)convertor
{
    int counter = 0;
    NSMutableString* result_string = [NSMutableString string];
    if(convertor> 10)
    {
        while (convertor>=10)
        {
            counter++;
            convertor = convertor/10;
        }
        [result_string appendFormat:@"%.2f",convertor];
        [result_string appendFormat:@" E%d",counter];
        self.input.text = (NSString*)result_string;
        self.result_string = [NSMutableString stringWithString:(NSString*)result_string];
        return;
    }
    else if (convertor != 0)
    {
        while (convertor<1)
        {
            counter++;
            convertor = convertor*10;
        }
        [result_string appendFormat:@"%.2f",convertor];
        [result_string appendFormat:@" E%d",counter];
        self.input.text = (NSString*)result_string;
        self.result_string = [NSMutableString stringWithString:(NSString*)result_string];
        return;
    }
    
}

-(void) segment_clicked: (id)sender
{
    [self Sound_Effect2];
    [self Energy_Conversion];
}

//1eV=e×1=1.6×10−19J

-(void)Energy_Conversion
{
   if(self.segment.selectedSegmentIndex == 0)//energy unit should be converted to J
        {
            self.checking = false; //for J
            if(self.energy != 0) //the
            {
                self.energy = self.energy*1.6*1.0E-19;
                [self Energy_Convertor];
                self.energy = self.energy/(1.6*1.0E-19);
                return;
            }
            else
                self.output.text = [NSString stringWithFormat:@""];
                
        }
    else //energy unit should be converted to eV
    {
         self.checking = true; //for eV
        if(self.energy != 0)
        {
            [self Energy_Simplification_For:self.energy];
        }
        else
            self.output.text = [NSString stringWithFormat:@""];
    }
    
}

-(void)Energy_Convertor
{
    int counter = 0;
    float result = self.energy;
    NSMutableString* energy_out = [[NSMutableString alloc]init];
    if(self.energy > 0)
    {
        if(self.energy<1)
        {
            while(result<1)
            {
                counter++;
                result = result*10;
            }
            [energy_out appendFormat:@"%.2f",result];
            [energy_out appendFormat:@" E-%d",counter];
        }
        else
        {
            while(result>10)
            {
                counter++;
                result = result/10;
            }
            [energy_out appendFormat:@"%.2f",result];
            [energy_out appendFormat:@" E%d",counter];
        }
    }
    self.output.text = (NSString*)energy_out;
}

-(void)Energy_Simplification_For:(float)energy
{
    int counter = 0;
    float result = energy;
    NSMutableString* energy_out = [[NSMutableString alloc]init];
    if(energy != 0)
    {
        if(energy<10&&energy>1)
        {
            self.output.text = [NSString stringWithFormat:@"%.2f",energy];
            return;
        }
        else if(energy<1)
        {
            while(result<1)
            {
            counter++;
            result = result*10;
            }
            [energy_out appendFormat:@"%.2f",result];
            [energy_out appendFormat:@" E-%d",counter];
        }
        else
        {
            if (energy<1000)
            {
                self.output.text = [NSString stringWithFormat:@"%.2f",energy];
                return;
            }
            else
            {
                while(result>10)
                {
                    counter++;
                    result = result/10;
                }
                [energy_out appendFormat:@"%.2f",result];
                [energy_out appendFormat:@" E%d",counter];
                self.output.text = (NSString*)energy_out;
                return;
            }
        }
    }
    else
        [energy_out appendString:[NSString stringWithFormat:@"%d",0]];
    self.output.text = (NSString*)energy_out;
}


-(void)frequency_clicked
{
    self.switches2 = 1;
}

-(void) wavelength_clicked
{
    self.switches2 = 2;
}

-(void) energy_clicked
{
    self.switches2 = 3;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* E = h (ν) = h (c/ λ )
 
 Where:
 E = energy [Joules or electronVolts]
 λ = wavelength [m]
 v = frequency [Hz] = c / λ
 
 With constants:
 h= Planck’s constant = 6.62606957E-34 [Joule-sec] = 4.135667E-15 [eV-sec]
 c= 2.998x108 [m/s]  (speed of light)
 */

/* E(eV)=1.24/λ(μm)*/

/* #define Planckconstant_eV  4.135667E-15
 #define EnergyToWaveLengthCoefficient 1.24
 #define C 2.998E8
 #define Planckconstant_J 6.62606957E-34
*/

- (void)textViewChanged:(UITextView *)textField
{
    if(textField.text != nil)
    {
            if(self.switches2 == 1) //use frequency to compute
            {
                float store = 0.0;
                float store2 = 0.0;
                self.frequency = [textField.text floatValue];
                 if(self.segment2.selectedSegmentIndex == 1) //the unit is cm-1
                 {
                     self.waveLength = 1.0E7/self.frequency; //here the wavelength is in unit nm.
                     store2 = self.waveLength/1000; //store the wavelength with unit um.
                     float temp = self.waveLength/1.0E9;
                     self.frequency = C/temp;//the unit is Hz.
                     
                     if(self.segment3.selectedSegmentIndex == 0)
                     {
                         self.waveLength = self.waveLength/1.0E9;//convert it into m.
                     }
                     [self convert_waveLength];
                     self.waveLength = store2;//retrieve the unit to be um.
                     
                 }
                 else
                 {
                     store2 = 0.0;
                     self.waveLength = C/self.frequency; //the unit is m.
                     store2 = self.waveLength*1.0E6; //store the wavelength with unit um.
                      if(self.segment3.selectedSegmentIndex == 1)
                      {
                          self.waveLength = self.waveLength*1.0E9;//convert it into nm.
                      }
                      [self convert_waveLength];
                 }
                
                if(self.segment3.selectedSegmentIndex == 0)//m
                {
                    self.waveLength = self.waveLength/1.0E9;
                }
                
                      if(self.segment.selectedSegmentIndex == 0)
                      {
                          self.energy = Planckconstant_J*self.frequency;
                      }
                     else
                     {
                         self.energy = Planckconstant_eV*self.frequency;
                         store = self.energy;
                     }
                
                [self Energy_Convertor];
                
                if(store == 0)
                {
                    self.energy = (self.energy/1.6)*1.0E19;
                }
                self.waveLength = store2;
                
                
                /* Enegy unit: eV
                    WaveLength unit:um.
                  Frequency unit : Hz */
            }
            else if(self.switches2 == 2) //wavelength
            {
                float store = 0.0;
                 self.waveLength = [textField.text floatValue];
                if(self.segment3.selectedSegmentIndex == 0)
                    self.waveLength = self.waveLength*1.0E6; //convert wavelength to um unit.
                else
                    self.waveLength = self.waveLength/1.0E3; //convert wavelength to um unit.
                
                float wavelengt_m = self.waveLength/1.0E6; //convert to nm.
                self.frequency = C/wavelengt_m;  //unit is Hz
                 if(self.segment2.selectedSegmentIndex == 1) //cm-1
                 {
                     float temp = self.waveLength*1.0E3;//the unit is nm.
                     float result = 1.0E7/temp;
                     [self convert_frequency_With_Frequency:result];
                 }
                else
                    [self convert_frequency_With_Frequency:self.frequency];
                
                self.energy = EnergyToWaveLengthCoefficient/self.waveLength; //unit is eV.
                store = self.energy;
                if(self.segment.selectedSegmentIndex == 0)//if the unit is J
                {
                    self.energy = self.energy*1.6*1.0E-19;
                    
                }
                [self Energy_Convertor];
                self.label1.hidden = YES;
                self.energy = store;
                
                /* Enegy unit: eV
                 WaveLength unit: um.
                 Frequency unit : Hz */
                
                
            }
            else if(self.switches2 == 3) //energy
            {
                self.energy = [textField.text floatValue];
                 if(self.segment.selectedSegmentIndex == 0) //unit is J, we need to convert to eV
                 {
                     self.energy = (self.energy/1.6)*1.0E19;
                 }
                
                self.frequency = self.energy/Planckconstant_eV; //the unit is Hz
                  self.waveLength =C/self.frequency;//the unt is m
                
                 if(self.segment2.selectedSegmentIndex == 0)//check the frequency unit is Hz
                    [self convert_frequency_With_Frequency:self.frequency];
                else
                {
                    float temp = self.waveLength*1.0E9;//the unit is nm.
                    float result = 1.0E7/temp;
                    [self convert_frequency_With_Frequency:result];
                }
                if(self.segment3.selectedSegmentIndex == 0)
                {
                   [self convert_waveLength];
                    self.waveLength = self.waveLength*1.0E6;
                }
                else
                   {
                       self.waveLength = self.waveLength*1.0E9;
                       [self convert_waveLength];
                       self.waveLength = self.waveLength/1.0E3; //keep the wavelength unit to be um.
                   }
                
                self.label3.hidden = YES;
            }
        /* Enegy unit: eV
         WaveLength unit: um.
         Frequency unit : Hz */

        }

    [self Disable_All_First_Responder];
}


-(void)convert_frequency_With_Frequency:(float)frequency
{
    int counter2 = 0;
    self.frequency_out = nil;
    self.frequency_out = [[NSMutableString alloc]init];
    float result = frequency;
    
    if(result >= 10)
    {
        while (result>=10)
        {
            counter2++;
           result = result/10;
        }
        [self.frequency_out appendString:[NSString stringWithFormat:@"%.2f",result]];
        [self.frequency_out appendFormat:@" E%d ",counter2];
    }
    else
        [self.frequency_out appendString:[NSString stringWithFormat:@"%.2f",result]];
    self.input.text = self.frequency_out;
}

-(void)convert_waveLength
{
    
    NSMutableString* wavelength_out = [[NSMutableString alloc]init];
    int counter = 0;
    float result = self.waveLength;
    int counter2 = 0;
    if(self.waveLength >= 10)
    {
        while (result>=10)
        {
            counter2++;
            result = result/10;
        }
        [wavelength_out appendString:[NSString stringWithFormat:@"%.2f",result]];
        [wavelength_out appendFormat:@" E%d ",counter2];

    }
    else if(self.waveLength != 0)
    {
        result = result*1.0E9;
            while(result<1)
            {
                counter++;
                result = result*10;
            }
            while(result>10)
            {
                counter=counter-1;
                result = result/10;
            }
            [wavelength_out appendString:[NSString stringWithFormat:@"%.2f",result]];
            [wavelength_out appendFormat:@" E-%d ",counter+9];
    }
    else if(self.waveLength == 0)
        [wavelength_out appendFormat:@"%.2f",self.waveLength];
    self.input2.text = wavelength_out;
     self.label2.hidden = YES;
    
}

-(NSString*)Determine_WaveLength
{
    int check_wave = 0;
    //here we check the corresponding waveforms:
    if(self.waveLength >= 10 && self.waveLength < 100)
        check_wave = 1;
    else if (self.waveLength>=1000 && self.waveLength < 1.0E6)
        check_wave = 2;
    else if(self.waveLength >= 0.01 && self.waveLength < 10)
        check_wave = 3; //X rays
    else if(self.waveLength < 0.01)
        check_wave = 4;//Gamma rays
    else if(self.waveLength >= 1.0E6 && self.waveLength < 1.0E8)
        check_wave = 5; //Microwaves
    else if(self.waveLength > 1.0E8)
        check_wave = 6; //Radio waves
    
    if(check_wave == 1)
        return [NSString stringWithFormat: @"Ultraviolet range."];
    else if(check_wave == 2)
        return [NSString stringWithFormat: @"Infrared range."];
    else if(check_wave == 3)
       return [NSString stringWithFormat: @"X rays range."];
    else if(check_wave == 4)
       return [NSString stringWithFormat: @"Gamma ray range."];
    else if (check_wave == 5)
        return [NSString stringWithFormat:@"Microwaves range."];
    else if(check_wave == 6)
        return [NSString stringWithFormat:@"Radio waves range."];
    else
        return [NSString stringWithFormat:@"Visible range."];
    
}

@end
