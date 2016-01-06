//
//  View3.m
//  Ch05_TabBarController
//
//  Created by Shuran Xu on 2015-05-15.
//
//

#import "View3.h"

@interface View3 ()

@end

@implementation View3

#define Ad_ID @"ca-app-pub-2734087962752348/6170387117"
#define Planckconstant_eV  4.135667E-15
#define EnergyToWaveLengthCoefficient 1.24
#define C 2.998E8
#define Planckconstant_J 6.62606957E-34

@synthesize slider1 = _slider1;
@synthesize slider2 = _slider2;
@synthesize slider3 = _slider3;
@synthesize button1 = _button1;
@synthesize button2 = _button2;
@synthesize button3 = _button3;
@synthesize button4 = _button4;
@synthesize label1 = _label1;
@synthesize label2 = _label2;
@synthesize label3 = _label3;
@synthesize label4 = _label4;
@synthesize energy = _energy;
@synthesize waveLength = _waveLength;
@synthesize frequency = _frequency;
@synthesize slider_height = _slider_height;
@synthesize slider_width = _slider_width;
@synthesize slider_X_Position = _slider_X_Position;
@synthesize barHeight = _barHeight;
@synthesize barWidth = _barWidth;
@synthesize labelHeight = _labelHeight;
@synthesize labelWidth = _labelWidth;
@synthesize Copy_values = Copy_values;
@synthesize saved_data = _saved_data;
@synthesize is_read = _is_read;
@synthesize state = _state;
@synthesize ad_banner = _ad_banner;
@synthesize result_string = _result_string;
@synthesize frequency_out = _frequency_out;
@synthesize alert;
@synthesize slider_touched;

- (instancetype)initWithNibName:(NSString *)nibName
                         bundle:(NSBundle *)nibBundle
{
    self = [super initWithNibName:nibName bundle:nibBundle];
    if(self)
    {
        AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        self.slider_X_Position = delegate.WIDTH*0.4;
        self.slider_height = delegate.WIDTH*0.1;
        self.slider_width = delegate.WIDTH*0.5;
        self.energy = 0.0;
        self.waveLength = 0.0;
        self.frequency = 0.0;
        self.slider_touched = false;
        self.alert = nil;
        self.barWidth = delegate.WIDTH*0.8;
        self.barHeight = delegate.WIDTH*0.1;
        self.labelWidth = delegate.WIDTH*0.3;
        self.labelHeight = delegate.WIDTH*0.1;
        self.saved_data = [NSMutableString string];
        self.is_read = false;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.slider1 = [[UISlider alloc]initWithFrame:CGRectMake(self.slider_X_Position,delegate.WIDTH*0.08 , self.slider_width, self.slider_height)];

    //如果要在拖动中触发，需要设置滑块的 continuos 属性：
    self.slider1.continuous = YES ;
    self.slider1.maximumValue = 10;
    self.slider1.minimumValue = 1.0;
    [self.slider1 addTarget:self action:@selector(slider_moved:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.slider1];
    
    
    self.slider2 = [[UISlider alloc]initWithFrame:CGRectMake(self.slider_X_Position,delegate.WIDTH*0.46 , self.slider_width, self.slider_height)];
    self.slider2.continuous = YES ;
    self.slider2.maximumValue = 3.0E15;
    self.slider2.minimumValue = 1.0;
    [self.slider2 addTarget:self action:@selector(slider_moved:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.slider2];
    
    self.slider3 = [[UISlider alloc]initWithFrame:CGRectMake(self.slider_X_Position,delegate.WIDTH*0.81 , self.slider_width, self.slider_height)];
    self.slider3.continuous = YES ;
    self.slider3.minimumValue = 1;
    self.slider3.maximumValue = 800;
    [self.slider3 addTarget:self action:@selector(slider_moved:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.slider3];
    
    
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(delegate.WIDTH*0.08, delegate.WIDTH*0.08, self.labelWidth, delegate.WIDTH*0.1)];//CGRectMake(16, 20, 100, 30)];
    self.label1.text = @"Energy";
    self.label1.textAlignment = NSTextAlignmentCenter;
    self.label1.adjustsFontSizeToFitWidth = YES;
    self.label1.textColor = [UIColor whiteColor];
    self.label1.font = [UIFont systemFontOfSize:17];
    self.label1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.label1];
    
    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(delegate.WIDTH*0.08, delegate.WIDTH*0.46, self.labelWidth, self.labelHeight)];//CGRectMake(20, 150, 100, 30)];
    self.label2.text = @"Frequency";
    self.label2.textAlignment = NSTextAlignmentCenter;
    self.label2.adjustsFontSizeToFitWidth = YES;
    self.label2.textColor = [UIColor whiteColor];
    self.label2.font = [UIFont systemFontOfSize:17];
    self.label2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.label2];

    
    self.label3 = [[UILabel alloc] initWithFrame:CGRectMake(delegate.WIDTH*0.08, delegate.WIDTH*0.81, self.labelWidth, self.labelHeight)];
    self.label3.text = @"Wavelength";
    self.label3.textAlignment = NSTextAlignmentCenter;
    self.label3.adjustsFontSizeToFitWidth = YES;
    self.label3.textColor = [UIColor whiteColor];
    self.label3.font = [UIFont systemFontOfSize:17];
    self.label3.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.label3];

    
    self.label4 = [[UILabel alloc] initWithFrame:CGRectMake(delegate.WIDTH*0.075, delegate.WIDTH*1.156, self.labelWidth, self.labelHeight)];
    self.label4.textAlignment = NSTextAlignmentCenter;
    self.label4.adjustsFontSizeToFitWidth = YES;
    self.label4.textColor = [UIColor whiteColor];
    self.label4.font = [UIFont systemFontOfSize:17];
    self.label4.backgroundColor = [UIColor clearColor];
    //设置标题名称，默认下先设为visible状态:
    self.label4.text = @"Visible";
    [self.view addSubview:self.label4];
  
    //Energy button:
    self.button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button1.frame = CGRectMake(delegate.WIDTH*0.1,delegate.WIDTH*0.23,self.barWidth,delegate.WIDTH*0.1);//CGRectMake(15, 70, 290, 30);
    //Update button1's title:
    [self.button1 setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    [self.button1.layer setCornerRadius:7.0]; //圆角设置
    self.button1.titleLabel.font = [UIFont systemFontOfSize:20];
    self.button1.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.button1];

    //Frequency button:
    self.button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button2.frame =CGRectMake(delegate.WIDTH*0.1,delegate.WIDTH*0.625,self.barWidth,self.barHeight);
    //Update button2's title:
    [self.button2 setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    [self.button2.layer setCornerRadius:7.0]; //圆角设置
    self.button2.titleLabel.font = [UIFont systemFontOfSize:20];
    self.button2.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.button2];
    

    //Wave length:
    self.button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button3.frame = CGRectMake(delegate.WIDTH*0.1,delegate.WIDTH*0.97,self.barWidth,self.barHeight);
    //Update button3's title:
    [self.button3 setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    [self.button3.layer setCornerRadius:7.0]; //圆角设置
    self.button3.titleLabel.font = [UIFont systemFontOfSize:20];
    self.button3.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.button3];

    
    //Setup button for ultraviolet one:
    self.button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button4.frame = CGRectMake(delegate.WIDTH*0.35,delegate.WIDTH*1.156,delegate.WIDTH*0.56,self.barHeight);
    //设计边框宽度:
    [self.button4.layer setBorderWidth:5];
    //设计边框颜色, 默认设为visible case
   // [self.button4.layer setBorderColor: *(CGColorRef*)[UIColor clearColor]];
    //设计背景颜色,默认设为visible case
    [self.button4 setBackgroundColor:[UIColor greenColor]];
    [self.button4 setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    [self.button4.layer setCornerRadius:7.0]; //圆角设置
    [self.view addSubview:self.button4];
    
    self.Copy_values = [[UIButton alloc]initWithFrame:CGRectMake(delegate.WIDTH*0.1, delegate.WIDTH*1.3, delegate.WIDTH*0.81, self.barHeight)];
    [self.Copy_values setTitle:@"SAVE" forState:UIControlStateNormal];
    [self.Copy_values setBackgroundColor:[UIColor redColor]];
    [self.Copy_values.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [self.Copy_values setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    [self.Copy_values.layer setCornerRadius:5.0]; //圆角设置
    [self.Copy_values addTarget:self action:@selector(Copy_clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.Copy_values];
    
    if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad|[[UIScreen mainScreen]bounds].size.height == 480)
    {
        self.Copy_values.frame = CGRectMake(delegate.WIDTH*0.08, delegate.WIDTH*1.2, self.barWidth, self.barHeight);
        if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
        {
            self.label1.font = [UIFont systemFontOfSize:35];
            self.label2.font = [UIFont systemFontOfSize:35];
            self.label3.font = [UIFont systemFontOfSize:35];
            self.label4.font = [UIFont systemFontOfSize:35];
            self.button1.titleLabel.font = [UIFont systemFontOfSize:35];
            self.button2.titleLabel.font = [UIFont systemFontOfSize:35];
            self.button3.titleLabel.font = [UIFont systemFontOfSize:35];
            self.button4.titleLabel.font = [UIFont systemFontOfSize:35];
            
            self.Copy_values.titleLabel.font = [UIFont systemFontOfSize:35];
             self.Copy_values.frame = CGRectMake(delegate.WIDTH*0.08, delegate.WIDTH*1.17, delegate.WIDTH*0.84, self.barHeight*0.8);
            self.Copy_values.layer.cornerRadius = 12;
        }
        self.label2.frame = CGRectMake(delegate.WIDTH*0.08, delegate.WIDTH*0.4, self.labelWidth, delegate.WIDTH*0.1);
         self.slider2.frame = CGRectMake(self.slider_X_Position,delegate.WIDTH*0.4 , self.slider_width, self.slider_height);
         self.button2.frame =CGRectMake(delegate.WIDTH*0.1,delegate.WIDTH*0.55,self.barWidth,delegate.WIDTH*0.1);
          self.label3.frame = CGRectMake(delegate.WIDTH*0.08, delegate.WIDTH*0.75, self.labelWidth, self.labelHeight);
         self.button3.frame = CGRectMake(delegate.WIDTH*0.1,delegate.WIDTH*0.9,self.barWidth,self.barHeight);
         self.slider3.frame = CGRectMake(self.slider_X_Position,delegate.WIDTH*0.75 , self.slider_width, self.slider_height);
         self.button4.frame = CGRectMake(delegate.WIDTH*0.35,delegate.WIDTH*1.05,self.barWidth*0.7,self.barHeight);
         self.label4.frame = CGRectMake(delegate.WIDTH*0.075, delegate.WIDTH*1.05, self.labelWidth, self.labelHeight);
    }
}

-(void)Copy_clicked:(id)sender
{
    [self Sound_Effect3];
    if(self.slider_touched)
        self.alert = [[UIAlertView alloc]initWithTitle:@"Data saved to Note Tab." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    else
        self.alert = [[UIAlertView alloc]initWithTitle:@"Please move slider bars first." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(self.slider_touched)
    {
          self.alert.title = @"Data saved to Note Tab.";
     AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(delegate.sentence)
    {
        delegate.sentence = nil;
        delegate.sentence = [NSMutableString string];
    }
    
    if(![self.button1.titleLabel.text isEqualToString:@""] &&![self.button2.titleLabel.text isEqualToString:@""]&&![self.button3.titleLabel.text isEqualToString:@""])
    {
        NSString* temp1 = [NSString stringWithFormat:@"Energy = "];
        NSString* temp2 = [NSString stringWithFormat:@"Frequency = "];
        NSString* temp3 = [NSString stringWithFormat:@"Wavelength = "];
        NSString* temp4 = [NSString stringWithFormat:@"Photon is in "];
        
       
        float convert_result = 1.0E7/self.waveLength;
        [self Simplify_converted_value_with:convert_result];
        
        NSString* medim = [self Energy_Simplification];
        [delegate.sentence appendFormat:@" "];
        [delegate.sentence appendString:temp1];
        [delegate.sentence appendString:self.button1.titleLabel.text];
        [delegate.sentence appendString:medim];
        [delegate.sentence appendFormat:@"\n "];
        [delegate.sentence appendString:temp2];
        [delegate.sentence appendString:self.button2.titleLabel.text];
        [delegate.sentence appendFormat:@" ="];
        [delegate.sentence appendString:self.result_string];
        [delegate.sentence appendFormat:@" cm⁻¹"];
        [delegate.sentence appendFormat:@"\n "];
        [delegate.sentence appendString:temp3];
        [delegate.sentence appendString:self.button3.titleLabel.text];
        [delegate.sentence appendFormat:@"\n "];
        [delegate.sentence appendString:temp4];
        [delegate.sentence appendString:self.state];
        [delegate.sentence appendFormat:@" range."];
        [delegate.sentence appendFormat:@"\n "];
        [delegate.sentence appendFormat:@"\n"];
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
    else
    {
        self.alert.title = @"Please move slider bars first.";

    }
}


-(NSString*)Energy_Simplification
{
    int counter = 0;
    float result = 0.0;
    float converted_energy =  ([self.button1.titleLabel.text floatValue]/1.6)*1.0E19;
    NSMutableString* return_value = [NSMutableString string];
    if(self.energy > 0)
    {
        result = converted_energy;
        while(result>10)
        {
            counter++;
            result = result/10;
        }
    }
        [return_value appendFormat:@" = %.2f",result];
        [return_value appendFormat:@"x10E%d J",counter];
        return (NSString*)return_value;
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
        [result_string appendFormat:@"xE%d",counter];
        self.result_string = [NSMutableString stringWithString:(NSString*)result_string];
        return;
    }
    else if (counter != 0)
    {
        while (convertor<1)
        {
            counter++;
            convertor = convertor*10;
        }
        [result_string appendFormat:@"%.2f",convertor];
        [result_string appendFormat:@"xE%d",counter];
        self.result_string = [NSMutableString stringWithString:(NSString*)result_string];
        return;
    }
    
}
/* Notice:
 
 E = h (ν) = h (c/ λ )
 
 Where:
 E = energy [Joules or electronVolts]
 λ = wavelength [m]
 v = frequency [Hz] = c / λ
 
 h= Planck’s constant = 6.62606957E-34 [Joule-sec] = 4.135667E-15 [eV-sec]
 c= 2.998x108 [m/s]  (speed of light)
 
 */


//1eV=e×1=1.6×10−19J

/*#define Planckconstant_eV  4.135667E-15
 #define EnergyToWaveLengthCoefficient 1.24
 #define C 2.998E8
 #define Planckconstant_J 6.62606957E-34*/

/* E(eV)=1.24/λ(μm)*/

-(void) slider_moved:(id)sender
{
    self.slider_touched = true;
    UISlider* identity = (UISlider*)sender;
    //Identify the responding slider & updating the coresponding boolen variable:
   //Energy Bar
    if(identity == self.slider1)
    {
        
        //更新滑动调节器的value:
        self.energy = self.slider1.value; //unit is eV
         float revised_result = roundf(self.energy*100)/100;
        [self.slider1 setValue:revised_result animated:YES];

        //Update wavelength bar:
        float result2 = EnergyToWaveLengthCoefficient/self.energy; //unit is um.
        float revised_result2 = roundf(result2*100)/100;
         self.waveLength = result2; //the unit is um.
        revised_result2 = revised_result2*1000;
        [self.slider3 setValue:revised_result2 animated:YES];
        
        //Update frequency bar:
        float temp = self.energy/Planckconstant_eV;
        float revised_result3 = roundf(temp*100)/100;//round to integral value, regardless of rounding direction
        [self.slider2 setValue:revised_result3 animated:YES];
        self.frequency = temp; //the unit is Hz.

        
       
    }
    else if(identity == self.slider2) //Frequency Bar
    {
        self.frequency = self.slider2.value; //the unit is Hz
        [self.slider2 setValue:self.frequency animated:YES];
        
        self.energy = self.frequency * Planckconstant_eV;// eV
        [self.slider1 setValue:self.energy animated:YES];
        
        float result2 = EnergyToWaveLengthCoefficient/self.energy;
        self.waveLength = result2; //the unit it um.
        result2 = result2*1000; //result2 unit is nm.
        [self.slider3 setValue:result2 animated:YES];
        
    }
    else
    {
        //default unit for wavelength is nm!
        
        self.waveLength = self.slider3.value; //the unit is nm.
        [self.slider3 setValue:self.waveLength animated:YES];
        
        float temp = self.waveLength/1000; //temp unit is um.
        
        self.energy = EnergyToWaveLengthCoefficient/temp; //the unit is eV.
        [self.slider1 setValue:self.energy animated:YES];
        
        self.frequency = self.energy/Planckconstant_eV; //Hz
        [self.slider2 setValue:self.frequency animated:YES];
    }
    
    //Update button's titles:

    [self convert_frequency];
      //Update energy button:
    [self Energy_Convertor];
      //Update wavelength button:
    [self convert_waveLength];
    //Finally we update the color of the wavelength bar:
    [self update_waveLengthBar];
    
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
            [energy_out appendFormat:@"E-%d ",counter];
             [energy_out appendFormat:@"eV"];
        }
        else
        {
            if(result<=10)
            {
                [energy_out appendFormat:@"%.2f ",result];
                [energy_out appendFormat:@"eV"];
            }
            else
            {
                while(result>10)
                {
                    counter++;
                    result = result/10;
                }
                [energy_out appendFormat:@"%.2f",result];
                [energy_out appendFormat:@"E%d ",counter];
                [energy_out appendFormat:@"eV"];
            }
        }
    }
    [self.button1 setTitle:(NSString*)energy_out forState:UIControlStateNormal];
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


-(void)convert_frequency
{
    int counter2 = 0;
    self.frequency_out = nil;
    self.frequency_out = [[NSMutableString alloc]init];
    float result = self.frequency;
    
    if(result >= 10)
    {
        while (result>=10)
        {
            counter2++;
            result = result/10;
        }
        [self.frequency_out appendString:[NSString stringWithFormat:@"%.2f",result]];
        [self.frequency_out appendFormat:@"E%d ",counter2];
        [self.frequency_out appendFormat:@"Hz"];
    }
    else
    {
        [self.frequency_out appendString:[NSString stringWithFormat:@"%.2f",result]];
        [self.frequency_out appendFormat:@"Hz"];
    }
    [self.button2 setTitle:(NSString*)_frequency_out forState:UIControlStateNormal];
}

-(void)convert_waveLength
{
    [self.button3 setTitle:[NSString stringWithFormat:@"%.2f nm",self.waveLength] forState:UIControlStateNormal];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


-(void) update_waveLengthBar
{
    float R = 0.0;
    float G = 0.0;
    float B = 0.0;
    int check_wave = 0;

    
        if (self.waveLength >= 380 && self.waveLength < 440)
        {
            R = -(self.waveLength - 440) / (440- 350);
            G = 0.0;
            B = 1.0;
        }
        else if (self.waveLength >= 440 && self.waveLength < 490)
        {
            R = 0.0;
            G = (self.waveLength - 440.) / (490. - 440.);
            B = 1.0;
        }
        else if(self.waveLength >= 490 && self.waveLength < 510)
        {
            R = 0.0;
            G = 1.0;
            B = -(self.waveLength - 510.) / (510. - 490.);
        }
        else if(self.waveLength >= 510 && self.waveLength < 580)
        {
            R = (self.waveLength- 510.) / (580. - 510.);
            G = 1.0;
            B = 0.0;
        }
        else if(self.waveLength >= 580 && self.waveLength < 645)
        {
            R = 1.0;
            G = -(self.waveLength - 645.) / (645. - 580.);
            B = 0.0;
        }
        else if(self.waveLength >= 645 && self.waveLength <= 780)
        {
            R = 1.0;
            G = 0.0;
            B = 0.0;
        }
        else //Invisible
        {
            R = 0.0;
            G = 0.0;
            B = 0.0;
            
            //here we check the corresponding waveforms:
            if(self.waveLength >= 10 && self.waveLength < 100)
                check_wave = 1;
            else if (self.waveLength>=1000 && self.waveLength < 1.0E6)
                check_wave = 2; //Infrared
            else if(self.waveLength >= 0.01 && self.waveLength < 10)
                check_wave = 3; //X rays
            else if(self.waveLength < 0.01)
                check_wave = 4;//Gamma rays
            else if(self.waveLength >= 1.0E6 && self.waveLength < 1.0E8)
                check_wave = 5; //Microwaves
            else if(self.waveLength > 1.0E8)
                check_wave = 6; //Radio waves
            else if(self.waveLength<1000 && self.waveLength>780)
                check_wave = 2;
                
        }
    
    if(R == 0.0 && G == 0.0 && B == 0.0)//Invisible
    {
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
        CGFloat r = (CGFloat) R/255;
        CGFloat g = (CGFloat) G/255;
        CGFloat b = (CGFloat) B/255;
        CGFloat a = (CGFloat) 0.5;
        CGFloat components[4] = {r,g,b,a};
        CGColorRef color = CGColorCreate(colorSpaceRef,components);
        self.button4.layer.borderColor = color;
         self.button4.layer.masksToBounds = YES;
        [self.button4.layer setBorderColor: color];
        [self.button4 setBackgroundColor:[UIColor clearColor]];
         //Update label4's title
        if(check_wave == 1)
        {
            self.label4.text = @"Ultraviolet";
            if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
                self.label4.font = [UIFont systemFontOfSize:35];
            else
                self.label4.font = [UIFont systemFontOfSize:15];
        }
        else if(check_wave == 2)
            self.label4.text = @"Infrared";
        else if(check_wave == 3)
            self.label4.text = @"X rays";
        else if(check_wave == 4)
        {
             self.label4.text = @"Gamma ray";
            if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
                self.label4.font = [UIFont systemFontOfSize:35];
            else
                self.label4.font = [UIFont systemFontOfSize:15];
        }
        else if (check_wave == 5)
             self.label4.text = @"Microwaves";
        else if(check_wave == 6)
            self.label4.text = @"Radio waves";
        else if (check_wave == 7)
            
        
        check_wave = 0; //reset
    }
     else //Visible
     {
         [self.button4 setBackgroundColor:[UIColor colorWithRed:R green:G blue:B alpha:1]];
         //Update label4's title:
         self.label4.text = @"Visible";
         if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
             self.label4.font = [UIFont systemFontOfSize:35];
         else
            self.label4.font = [UIFont systemFontOfSize:17];
     }
    
    self.state = [NSString stringWithString:self.label4.text];
    
    return;
    
}

@end
