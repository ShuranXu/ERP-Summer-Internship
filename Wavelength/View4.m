//
//  View4.m
//  Ch05_TabBarController
//
//  Created by Shuran Xu on 2015-05-15.
//
//

#import "View4.h"

@interface View4 ()

@end

@implementation View4

@synthesize about_view = _about_view;
@synthesize about = _about;
@synthesize front_title = _front_title;
@synthesize details = _details;
@synthesize webView = _webView;
@synthesize myTimer = _myTimer;
@synthesize addi_content = _addi_content;
@synthesize hint = _hint;
@synthesize content1 = _content1;
@synthesize storeData = _storeData;
@synthesize hasData = _hasData;
@synthesize act = _act;
@synthesize ad_banner = _ad_banner;
@synthesize selectBar = _selectBar;

- (instancetype)initWithNibName:(NSString *)nibName
                         bundle:(NSBundle *)nibBundle
{
    self = [super initWithNibName:nibName bundle:nibBundle];
    self.storeData = [NSMutableArray array];//Creates and returns an empty array.
    self.hasData = false;
    self.act = nil;
    self.addi_content = nil;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    [self System_Version];
    
     AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.selectBar = [[UISegmentedControl alloc]initWithItems:[[NSArray alloc]initWithObjects:@"Share",@"Clear", nil]];
    self.selectBar.frame = CGRectMake(delegate.WIDTH*0.094,delegate.WIDTH*1.29,delegate.WIDTH*0.84375,delegate.WIDTH*0.08);
    self.selectBar.layer.cornerRadius = 5;
    self.selectBar.selectedSegmentIndex = -1;
    [self.selectBar setBackgroundColor:[UIColor whiteColor]];
    [self.selectBar addTarget:self action:@selector(segment_clicked:) forControlEvents:UIControlEventValueChanged];
    NSDictionary* dic3 = nil;
    if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        dic3 = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,  [UIFont systemFontOfSize:35],NSFontAttributeName ,nil];
    }
    else
    {
        dic3 = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,  [UIFont systemFontOfSize:18],NSFontAttributeName,nil];
    }
    [self.selectBar setTitleTextAttributes:dic3 forState:UIControlStateNormal];
    
    [self.view addSubview:self.selectBar];

    
    self.about = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.about.frame = CGRectMake(delegate.WIDTH*0.52, delegate.WIDTH*1.39, delegate.WIDTH*0.41, delegate.WIDTH*0.12);
    [self.about setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    [self.about setTitle:@"ABOUT" forState:UIControlStateNormal];
    [self.about.layer setCornerRadius:5]; //圆角设置
    self.about.titleLabel.font = [UIFont systemFontOfSize:20];
    self.about.backgroundColor = [UIColor orangeColor];
    [self.about addTarget:self action:@selector(about_button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.about];
    
    self.front_title = [[UIButton alloc] initWithFrame:CGRectMake(delegate.WIDTH*0.04, delegate.WIDTH*0.06, delegate.WIDTH*0.9372, delegate.WIDTH*0.2)];
    [self.front_title setTitle:@"Planck-Einstein Relation" forState:UIControlStateNormal];
    [self.front_title setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    self.front_title.titleLabel.font = [UIFont systemFontOfSize:25];
    self.front_title.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.front_title];
 
    self.content1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"relation.png"]];
    self.content1.frame = CGRectMake(delegate.WIDTH*0.0625, delegate.WIDTH*0.17, delegate.WIDTH*0.9, delegate.WIDTH*0.3);
    [self.view addSubview:self.content1];
    
    self.content2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"relation2.png"]];
    self.content2.frame = CGRectMake(delegate.WIDTH*0.0625, delegate.WIDTH*0.45, delegate.WIDTH*0.52, delegate.WIDTH*0.3);
    [self.view addSubview:self.content2];

    NSLog(@"%@",[self Find_File_Path]);
    
/*Where:
    E = energy [Joules or electronVolts]
    λ = wavelength [m]
    v = frequency [Hz] = c / λ*/

    
    //Details:
    
    self.details = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.details.frame = CGRectMake(delegate.WIDTH*0.1, delegate.WIDTH*1.39, delegate.WIDTH*0.4, delegate.WIDTH*0.12);
    [self.details setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    [self.details setTitle:@"DETAILS" forState:UIControlStateNormal];
    [self.details.layer setCornerRadius:5.0]; //圆角设置
    self.details.titleLabel.font = [UIFont systemFontOfSize:20];
    self.details.backgroundColor = [UIColor redColor];
    [self.details addTarget:self action:@selector(details_clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.details];
    
      //addi_content:
    self.addi_content = [[UITextView alloc]initWithFrame:CGRectMake(delegate.WIDTH*0.094, delegate.WIDTH*0.734, delegate.WIDTH*0.84375, delegate.WIDTH*0.53)];
    self.addi_content.font = [UIFont systemFontOfSize:12];
    self.addi_content.textColor = [UIColor blackColor];
    [self.addi_content.layer setCornerRadius:5];
    self.addi_content.backgroundColor = [UIColor whiteColor];
    self.addi_content.textAlignment = NSTextAlignmentLeft;
    
    
   
    [self Read_Data_From_Local_File];
    self.addi_content.delegate = self;
    [self.view addSubview:self.addi_content];

    //hint:
    self.hint = [[UITextField alloc]initWithFrame:CGRectMake(delegate.WIDTH*0.094, delegate.WIDTH, delegate.WIDTH*0.84375, delegate.WIDTH*0.094)];
    self.hint.enabled = NO;
    self.hint.hidden = NO;
    if(!self.hasData)
    {
        self.hint.placeholder = @"Notebook: Feel free to take notes here";
    }
    else
    {
        self.hint.placeholder = nil;
    }
    self.hint.font = [UIFont systemFontOfSize:15];
    self.hint.textColor = [UIColor whiteColor];
    self.hint.textAlignment = NSTextAlignmentCenter;
    self.hint.text = nil;
    if([[UIScreen mainScreen]bounds].size.height == 480)
    {
         self.hint.frame = CGRectMake(delegate.WIDTH*0.094, delegate.WIDTH*0.88, delegate.WIDTH*0.84375, delegate.WIDTH*0.08);
        self.addi_content.frame = CGRectMake(delegate.WIDTH*0.094, delegate.WIDTH*0.734, delegate.WIDTH*0.84375, delegate.WIDTH*0.4);

         self.about.frame = CGRectMake(delegate.WIDTH*0.52, delegate.WIDTH*1.24, delegate.WIDTH*0.41, delegate.WIDTH*0.1);
        
         self.details.frame = CGRectMake(delegate.WIDTH*0.1, delegate.WIDTH*1.24, delegate.WIDTH*0.4, delegate.WIDTH*0.1);
        
        self.selectBar.frame = CGRectMake(delegate.WIDTH*0.094,delegate.WIDTH*1.14,delegate.WIDTH*0.84375,delegate.WIDTH*0.08);

    }
    [self.view addSubview:self.hint];
    
    
    if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        self.front_title.titleLabel.font = [UIFont systemFontOfSize:40];
        self.about.titleLabel.font = [UIFont systemFontOfSize:35];
        self.front_title.titleLabel.font = [UIFont systemFontOfSize:35];
        self.details.titleLabel.font = [UIFont systemFontOfSize:35];
         self.hint.font = [UIFont systemFontOfSize:30];
         self.front_title.frame = CGRectMake(delegate.WIDTH*0.0625, delegate.WIDTH*0.02, delegate.WIDTH*0.9372, delegate.WIDTH*0.2);
         self.content1.frame = CGRectMake(delegate.WIDTH*0.0625, delegate.WIDTH*0.1, delegate.WIDTH*0.9, delegate.WIDTH*0.3);
        self.details.frame = CGRectMake(delegate.WIDTH*0.5625, delegate.WIDTH*0.45, delegate.WIDTH*0.375, delegate.WIDTH*0.2);
         self.content2.frame = CGRectMake(delegate.WIDTH*0.0625, delegate.WIDTH*0.43, delegate.WIDTH*0.52, delegate.WIDTH*0.2);
        self.addi_content.frame = CGRectMake(delegate.WIDTH*0.094, delegate.WIDTH*0.65, delegate.WIDTH*0.84375, delegate.WIDTH*0.4);
        self.hint.frame = CGRectMake(delegate.WIDTH*0.094, delegate.WIDTH*0.85, delegate.WIDTH*0.84375, delegate.WIDTH*0.094);
         self.about.frame = CGRectMake(delegate.WIDTH*0.52, delegate.WIDTH*1.16, delegate.WIDTH*0.41, delegate.WIDTH*0.08);
        self.details.frame = CGRectMake(delegate.WIDTH*0.1, delegate.WIDTH*1.16, delegate.WIDTH*0.4, delegate.WIDTH*0.08);
         self.selectBar.frame = CGRectMake(delegate.WIDTH*0.094,delegate.WIDTH*1.06,delegate.WIDTH*0.84375,delegate.WIDTH*0.08);
        self.about.layer.cornerRadius = 10;
        self.details.layer.cornerRadius = 10;
    }
    
   /* CGPoint ad_origin = CGPointMake(0.0, [[UIScreen mainScreen]bounds].size.height - delegate.WIDTH*0.3); // shows ad at bottom.
    CGSize ad_size=CGSizeMake(delegate.WIDTH,delegate.WIDTH*0.15);
    GADAdSize custom_gAd_size = GADAdSizeFromCGSize(ad_size);
    _ad_banner = [[GADBannerView alloc] initWithAdSize:custom_gAd_size origin:ad_origin];
    _ad_banner.adUnitID = @"ca-app-pub-2734087962752348/4895253913";
    _ad_banner.rootViewController = self;
    [self.view addSubview:_ad_banner];
    [_ad_banner loadRequest:[GADRequest request]];*/
    
    [self Modification_Based_on_System_Version];
}

-(void)Modification_Based_on_System_Version
{
     AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if([[self System_Version] isEqualToString:@"7.1"])
    {
        if([[UIScreen mainScreen]bounds].size.height == 480)
        {
            self.addi_content.frame = CGRectMake(delegate.WIDTH*0.094, delegate.WIDTH*0.734, delegate.WIDTH*0.84375, delegate.WIDTH*0.4);
            self.selectBar.frame = CGRectMake(delegate.WIDTH*0.094,delegate.WIDTH*1.146,delegate.WIDTH*0.84375,delegate.WIDTH*0.07);
        }
    }
}

-(NSString*)System_Version
{
   return [[UIDevice currentDevice]systemVersion];
}

-(void)Sound_Effect
{
    NSString* path = [[NSBundle mainBundle]pathForResource:@"OR" ofType:@"wav"];
    if(path)
    {
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL URLWithString:path], &soundID);
        AudioServicesPlaySystemSound(soundID);
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
        //(2) Divide nameInfoString into an array using commas:
        NSArray* nameInfoStringArray = [nameInfoString componentsSeparatedByString:@","];
        
        //Create and intialize self.stored_data:
        self.storeData = [NSMutableArray arrayWithArray:nameInfoStringArray];
        while ([[self.storeData lastObject] isEqualToString:@""]||[[self.storeData lastObject] isEqualToString:@","]||[[self.storeData lastObject] isEqualToString:@" \n "])
            [self.storeData removeObjectAtIndex:[self.storeData count]-1];
        NSMutableString* temp = [NSMutableString string];
        for(id ele in self.storeData)
            [temp appendString:ele];
       if([temp length]>0)
       {
           if([temp characterAtIndex:[temp length]-1] == ','||[temp characterAtIndex:[temp length]-1] == ' '||[temp characterAtIndex:[temp length]-1] == '\n'||[temp characterAtIndex:[temp length]-1] == ' \n'||[temp characterAtIndex:[temp length]-1] == '\n ')
                    [temp deleteCharactersInRange:NSMakeRange([temp length]-1, 1)];
           self.addi_content.text = (NSString*)temp;
       }
        if([self.storeData count] != 0)
        self.hasData = true;
        else
            self.hasData = false;
    }
    else
    {
        self.storeData = [NSMutableArray array];
        self.addi_content.text = @"";
        self.hasData = false;
    }
}

-(void)segment_clicked:(id)sender
{
    if([self.selectBar selectedSegmentIndex] == 0)
    {
        [self Share];
    }
    else if([self.selectBar selectedSegmentIndex] == 1)
    {
        self.addi_content.text = nil;
         self.hint.placeholder = @"Notebook: Feel free to take notes here";
        self.hint.hidden = NO;
        self.storeData = [NSMutableArray array];
        [self Update_current_data];
    }
    self.selectBar.selectedSegmentIndex = -1;
}


-(void)Update_current_data
{
    //Update data into the local file:
    NSFileManager* manager = [NSFileManager defaultManager];
    NSError* error;
    NSString* FilePath = [self Find_File_Path];
    NSLog(@"%@",FilePath);
    [manager removeItemAtPath:FilePath error:&error];
    NSMutableString* new_nameInfoString = [[NSMutableString alloc] init];
    if([[self.storeData lastObject] isEqualToString:@""])
        [self.storeData removeObjectAtIndex:[self.storeData count]-1];

    for (NSString* name in self.storeData)
    {
        [new_nameInfoString appendFormat:@"%@", name];
        [new_nameInfoString appendFormat:@","];
    }
   
    //Encode productInfoString, and save it in our new file:
    NSData* nameData = [new_nameInfoString dataUsingEncoding:NSUTF8StringEncoding];
    if(![manager createFileAtPath:FilePath contents:nameData attributes:nil])
    {
        printf("Fail to create file to store data");
        return;
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


-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text //Asks the delegate whether the specified text should be replaced in the text view.
{
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    [self.hint resignFirstResponder];

    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    self.hint.hidden = YES;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self Read_Data_From_Local_File];
    if(self.addi_content)
    {
        if([self.addi_content.text isEqualToString:@""])
        {
            self.hint.hidden = NO;
            self.hint.placeholder = @"Notebook: Feel free to take notes here";
        }
        else
        {
            self.hint.hidden = YES;
            self.hint.placeholder = @"";
        }
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    self.storeData = nil;
    self.storeData = [NSMutableArray array];
    [self.storeData addObject:textView.text];
    [self Update_current_data];
    if([textView.text isEqualToString:[NSString stringWithFormat:@""]])
    {
        self.hint.placeholder = @"Notebook: Feel free to take notes here";
        self.hint.hidden = NO;
    }
}

-(void)details_clicked:(id)sender
{
    [self Sound_Effect];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www-inst.eecs.berkeley.edu/~cs191/sp05/lectures/lecture7.pdf"]];
}


-(void)Share
{
    if(!self.act)
    {
        NSArray* data = [NSArray arrayWithArray:self.storeData];
        self.act = [[UIActivityViewController alloc]initWithActivityItems:data applicationActivities:nil];
    }
    // Change Rect to position Popover
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        UIPopoverController *popup = [[UIPopoverController alloc] initWithContentViewController:self.act];
        [popup presentPopoverFromRect:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/4, 0, 0)inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
    else
        [self presentViewController:self.act animated:YES completion:nil];
}

-(void) about_button_clicked:(id)sender
{
    [self Sound_Effect];
    self.about_view = [[View5 alloc]initWithNibName:nil bundle:nil];
    [self presentViewController:self.about_view animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"It's about to crash!");
}

@end
