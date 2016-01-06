//
//  Sign2.m
//  One-minute APP
//
//  Created by Shuran Xu on 2015-06-03.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import "Sign2.h"

@interface Sign2 ()

@end

@implementation Sign2

@synthesize name = _name;
@synthesize mylabel = _mylabel;
@synthesize name_data = _name_data;
@synthesize alert = _alert;
@synthesize saved = _saved;
@synthesize alert2 = _alert2;
@synthesize stored_name = _stored_name;
@synthesize icon = _icon;
@synthesize HEIGHT1 = _HEIGHT1;
@synthesize HEIGHT2 = _HEIGHT2;
@synthesize WIDTH1 = _WIDTH1;
@synthesize WIDTH2 = _WIDTH2;
@synthesize GAP_X1 = _GAP_X1;
@synthesize GAP_Y1 = _GAP_Y1;
@synthesize GAP_X2 = _GAP_X2;
@synthesize GAP_Y2 = _GAP_Y2;



- (instancetype)initWithNibName:(NSString *)nibName
                         bundle:(NSBundle *)nibBundle
{
    self = [super initWithNibName:nibName bundle:nibBundle];
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.WIDTH1 = delegate.WIDTH*0.6;//for textField
    self.WIDTH2 = delegate.WIDTH*0.2; //for name label
    self.HEIGHT1 = delegate.HEIGHT/15;
    self.GAP_X2 = delegate.WIDTH*0.05;
    self.GAP_Y2 = delegate.HEIGHT*0.5;
    self.GAP_X1 = self.GAP_X2 + self.WIDTH2;
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage* background = [UIImage imageNamed:@"Sign_Page.JPG"];
    self.view.backgroundColor = self.view.backgroundColor = [UIColor colorWithPatternImage:[self ChangeimageWithImage:background]];
     AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.mylabel = [[UILabel alloc]initWithFrame:CGRectMake(self.GAP_X2, delegate.WIDTH*0.3, self.WIDTH2,self.HEIGHT1)];
    self.mylabel.text = @"Name";
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.mylabel setFont:[UIFont systemFontOfSize:30]];
    }
    [self.view addSubview:self.mylabel];
    
    self.GAP_Y1 = self.GAP_Y2;
    self.name = [[UITextField alloc]initWithFrame:CGRectMake(delegate.WIDTH*0.2,delegate.WIDTH*0.3,delegate.WIDTH*0.63,delegate.WIDTH*0.1)];
    self.name.placeholder = @"Please input your name.";
    self.name.font = [UIFont systemFontOfSize:15];
    self.name.delegate = self;
    self.name.borderStyle = UITextBorderStyleRoundedRect;
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.name setFont:[UIFont systemFontOfSize:30]];
    }
    [self.view addSubview:self.name];
    
    // Do any additional setup after loading the view from its nib.
    self.name_data = [[NSMutableArray alloc]init];
    self.alert = [[UIAlertView alloc]initWithTitle:@"Awesome" message:@"Your name is saved." delegate:self cancelButtonTitle:@"Go back" otherButtonTitles: nil];
    self.saved = false;
    self.alert2 = [[UIAlertView alloc]initWithTitle:@"Your name is not saved" message:nil
                                           delegate:self cancelButtonTitle:@"Go back" otherButtonTitles:@"Re-write name", nil];

    self.save = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.save.backgroundColor = [UIColor whiteColor];
    self.save.layer.cornerRadius = 5;
    [self.save setTitle:@"Save" forState:UIControlStateNormal];
    [self.save setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.save.layer.opacity = 0.7;
    [self.save addTarget:self action:@selector(Save_Clicked:) forControlEvents:UIControlEventTouchUpInside];
    self.save.frame = CGRectMake((self.GAP_X1+self.WIDTH1)*0.85, delegate.HEIGHT*0.65, self.WIDTH2,self.HEIGHT1);
    [self.save.titleLabel setFont:[UIFont fontWithName:@"Avenir" size:18]];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.save.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    self.save.layer.borderWidth = delegate.WIDTH*0.005;
    self.save.layer.masksToBounds = YES;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGFloat r = (CGFloat) 0/255;
    CGFloat g = (CGFloat) 0/255;
    CGFloat b = (CGFloat) 0/255;
    CGFloat a = (CGFloat) 1.0;
    CGFloat components[4] = {r,g,b,a};
    CGColorRef color = CGColorCreate(colorSpaceRef,components);
    self.save.layer.borderColor = color;
    [self.view addSubview:self.save];
    
    self.cancel = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.cancel.layer.cornerRadius = 5;
    [self.cancel setTitle:@"Cancel" forState:UIControlStateNormal];
    self.cancel.backgroundColor = [UIColor whiteColor];
    [self.cancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.cancel.layer.cornerRadius = 5;
    self.cancel.layer.opacity = 0.7;
    [self.cancel addTarget:self action:@selector(Cancel_Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.cancel.titleLabel setFont:[UIFont fontWithName:@"Avenir" size:18]];
    self.cancel.frame = CGRectMake(self.GAP_X2, delegate.HEIGHT*0.65, self.WIDTH2,self.HEIGHT1);
    self.cancel.layer.borderWidth = delegate.WIDTH*0.005;
    self.cancel.layer.masksToBounds = YES;
     self.cancel.layer.borderColor = color;
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.cancel.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    [self.view addSubview:self.cancel];
    
    self.icon = [self Create_Button_WithFream:CGRectMake(delegate.WIDTH*0.88,delegate.WIDTH*0.3,delegate.WIDTH*0.1,delegate.WIDTH*0.1) AndTitle:nil AndBackgroundImage:nil OrBackgroundColor:[UIColor orangeColor] Andfont:18 AndTitleColor:[UIColor blackColor]];
    [self.icon setTitle:@"x" forState:UIControlStateNormal];
    self.icon.backgroundColor = [UIColor clearColor];
    [self.icon addTarget:self action:@selector(icon_clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.icon.titleLabel setFont:[UIFont fontWithName:@"ModernPictograms" size:40]];
    self.icon.layer.borderWidth = 0;
    [self.view addSubview:self.icon];
    
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)icon_clicked:(id)sender
{
    if(self.saved)
    {
        [self.name_data removeLastObject];//Delete comma
        [self.name_data removeLastObject];//Delete name
        self.saved = false;
    }
    self.name.text = nil;
    
}

-(void)Cancel_Clicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



-(void)Save_Clicked:(id)sender
{
    if([self.name isFirstResponder])
        [self.name resignFirstResponder];
    NSString* record = [NSString stringWithString:self.name.text];
    self.saved = true;
    [self.name_data addObject:record];
    
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    /*+ (UIApplication *)sharedApplication
     Description:
     Returns the singleton app instance.*/
    
    if(delegate.store_name1)
    {
        [self Read_Data_From_Local_File];
        [self Data_Transmit_to_Local_File];
        delegate.name_input1 = true;
        
    }
    if (delegate.store_name2)
    {
        [self Read_Data_From_Local_File2];
        [self Data_Transmit_to_Local_File2];
        delegate.name_input2 = true;
        
    }
    if(delegate.check_h)//means the user plays the hard one
    {
        delegate.test = true;//test is designed as a signal to show an alert view to pop the view controller.
        delegate.check_h = false;//reset, necessary, eitherwise the alert view will show up once the user enters the game!
        delegate.name_input1 = true;
    }
    else if(delegate.check_e)//means the user plays the simple one
    {
        delegate.test2 = true;
        delegate.check_e = false;//reset
        delegate.name_input2 = true;
    }
    [self.alert show];
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString* choosen=[alertView buttonTitleAtIndex:buttonIndex];
    if([choosen isEqualToString:@"Go back"])
    {
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}


-(void)Read_Data_From_Local_File
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);//Creates a list of directory search paths.
    NSString* documentsDirPath = [paths objectAtIndex:0];//Obtain the path for Documents directory.
    NSString* DirPath = [documentsDirPath stringByAppendingPathComponent:@"Names"];//Create an new path under "Document" directory.
    NSString* FilePath = [DirPath stringByAppendingPathComponent:@"name.txt"];//Create a path for the text file for the saving data under "Document" directory.
    NSError* error;
    //Read data from the local file:
    NSString* nameInfoString = [NSString stringWithContentsOfFile:FilePath encoding:NSUTF8StringEncoding error:&error];
    if(nameInfoString != NULL)
    {
        //(2) Divide nameInfoString into an array using commas:
        NSArray* nameInfoStringArray = [nameInfoString componentsSeparatedByString:@","];
        
        //Create and intialize self.stored_data:
        self.stored_name = [NSMutableArray arrayWithArray:nameInfoStringArray];
        [self.stored_name removeObjectAtIndex:[self.stored_name count]-1];
    }
    else
        self.stored_name = [[NSMutableArray alloc]init];
    
}


-(void)Read_Data_From_Local_File2
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);//Creates a list of directory search paths.
    NSString* documentsDirPath = [paths objectAtIndex:0];//Obtain the path for Documents directory.
    NSString* DirPath = [documentsDirPath stringByAppendingPathComponent:@"Names2"];//Create an new path under "Document" directory.
    NSString* FilePath = [DirPath stringByAppendingPathComponent:@"name2.txt"];//Create a path for the text file for the saving data under "Document" directory.
    NSError* error;
    //Read data from the local file:
    NSString* nameInfoString = [NSString stringWithContentsOfFile:FilePath encoding:NSUTF8StringEncoding error:&error];
    if(nameInfoString != NULL)
    {
        //(2) Divide nameInfoString into an array using commas:
        NSArray* nameInfoStringArray = [nameInfoString componentsSeparatedByString:@","];
        
        //Create and intialize self.stored_data:
        self.stored_name = [NSMutableArray arrayWithArray:nameInfoStringArray];
        [self.stored_name removeObjectAtIndex:[self.stored_name count]-1];
    }
    else
        self.stored_name = [[NSMutableArray alloc]init];
    
}



-(void)Data_Transmit_to_Local_File
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);//Creates a list of directory search paths.
    NSString* documentsDirPath = [paths objectAtIndex:0];//Obtain the path for Documents directory.
    NSString* DirPath = [documentsDirPath stringByAppendingPathComponent:@"Names"];//Create an new path under "Document" directory.
    NSString* FilePath = [DirPath stringByAppendingPathComponent:@"name.txt"];//Create a path for the text file for the saving data under "Document" directory.
    
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
            return;
        }
    }
    
    // Transfer elements of self.name_data into NSString type data:
    NSMutableString* nameInfoString = [[NSMutableString alloc] init];
    [self.stored_name addObject:[self.name_data lastObject]];
    
    for (NSString* name in self.stored_name)
    {
        [nameInfoString appendFormat:@"%@", name];
        [nameInfoString appendFormat:@","];
    }
    
    //Encode productInfoString, and save it in our new file:
    NSData* nameData = [nameInfoString dataUsingEncoding:NSUTF8StringEncoding];//Returns an NSData object containing a representation of the receiver encoded using a given encoding.
    
    if(![fileManager createFileAtPath:FilePath contents:nameData attributes:nil])
    {
        printf("Fail to create file to store data");
        return;
    }
    
}

-(void)Data_Transmit_to_Local_File2
{
    NSString* filePath = [self Find_Name2_Path];
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    // Transfer elements of self.name_data into NSString type data:
    NSMutableString* nameInfoString = [[NSMutableString alloc] init];
    [self.stored_name addObject:[self.name_data lastObject]];
    for (NSString* name in self.stored_name)
    {
        [nameInfoString appendFormat:@"%@", name];
        [nameInfoString appendFormat:@","];
    }
    
    //Encode productInfoString, and save it in our new file:
    NSData* nameData = [nameInfoString dataUsingEncoding:NSUTF8StringEncoding];//Returns an NSData object containing a representation of the receiver encoded using a given encoding.
    
    if(![fileManager createFileAtPath:filePath contents:nameData attributes:nil])
    {
        printf("Fail to create file to store data");
        return;
    }
}


-(NSString*) Find_Name2_Path
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);//Creates a list of directory search paths.
    NSString* documentsDirPath = [paths objectAtIndex:0];//Obtain the path for Documents directory.
    NSString* DirPath = [documentsDirPath stringByAppendingPathComponent:@"Names2"];//Create an new path under "Document" directory.
    NSString* FilePath = [DirPath stringByAppendingPathComponent:@"name2.txt"];//Create a path for the text file for the saving data under "Document" directory.
    
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
     [self.name resignFirstResponder];
      return YES;
    
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if([self.name isFirstResponder])
        [self.name resignFirstResponder];
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
    //By default, the button is not hidden:
    button.hidden = NO;
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    button.layer.borderWidth = delegate.WIDTH*0.005;
    button.layer.masksToBounds = YES;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGFloat r = (CGFloat) 0/255;
    CGFloat g = (CGFloat) 0/255;
    CGFloat b = (CGFloat) 0/255;
    CGFloat a = (CGFloat) 1.0;
    CGFloat components[4] = {r,g,b,a};
    CGColorRef border_color = CGColorCreate(colorSpaceRef,components);
    button.layer.borderColor = border_color;
    [self.view addSubview:button];
    return button;
    
}


@end
