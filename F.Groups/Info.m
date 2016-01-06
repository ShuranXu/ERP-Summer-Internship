//
//  Info.m
//  One-minute APP
//
//  Created by Shuran Xu on 2015-05-25.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import "Info.h"

@interface Info ()

@end

@implementation Info

@synthesize info1 = _info1;
@synthesize info1_speak = _info1_speak;
@synthesize quit = _quit;
@synthesize icon = _icon;
@synthesize play1 = _play1;
@synthesize start1 = _start1;
@synthesize count1 = _count1;
@synthesize picker = _picker;
@synthesize score_Array = _score_Array;
@synthesize show = _show;
@synthesize text2 = _text2;
@synthesize reference = _reference;
@synthesize icon2 = _icon2;
@synthesize moreApps = _moreApps;
@synthesize speaker = _speaker;
@synthesize icon3 = _icon3;

- (instancetype)initWithNibName:(NSString *)nibName
                         bundle:(NSBundle *)nibBundle
{
    self = [super initWithNibName:nibName bundle:nibBundle];
    if(self)
    {
        self.start1 = true;
        self.count1 = 0;
        
}
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.score_Array = [NSArray arrayWithObjects:@"A",@"B",@"C", nil];
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];

    self.icon = [self Create_Button_WithFream:CGRectMake(delegate.WIDTH*0.1, delegate.HEIGHT*0.9,delegate.WIDTH*0.1, delegate.WIDTH*0.1) AndTitle:nil AndBackgroundImage:@"sound.ps" OrBackgroundColor:nil Andfont:0 AndTitleColor:nil];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        self.icon.frame = CGRectMake(delegate.WIDTH*0.11, delegate.HEIGHT*0.91, delegate.WIDTH*0.06, delegate.WIDTH*0.06);
    }
    [self.view addSubview:self.icon];

    
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGFloat r = (CGFloat) 192/255;
    CGFloat g = (CGFloat) 192/255;
    CGFloat b = (CGFloat) 192/255;
    CGFloat a = (CGFloat) 1.0;
    CGFloat components[4] = {r,g,b,a};
    CGColorRef border_color = CGColorCreate(colorSpaceRef,components);
    
    self.quit = [UIButton buttonWithType:UIButtonTypeSystem];
    self.quit.frame = CGRectMake(delegate.WIDTH*0.7, delegate.HEIGHT*0.9,delegate.WIDTH*0.2, delegate.HEIGHT*0.07);
    [self.quit setTitle:@"Back" forState:UIControlStateNormal];
    self.quit.backgroundColor = [UIColor whiteColor];
    [self.quit.titleLabel setFont:[UIFont fontWithName:@"Avenir" size:18]];
    [self.quit setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     self.quit.layer.opacity = 0.8;
    self.quit.layer.cornerRadius = 6;
    self.quit.layer.borderWidth = delegate.WIDTH*0.005;
    self.quit.layer.masksToBounds = YES;
    self.quit.layer.borderColor = border_color;
    [self.quit addTarget:self action:@selector(quit_clicked:) forControlEvents:UIControlEventTouchUpInside];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.quit.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    [self.view addSubview:self.quit];
    
    self.speaker = [self Create_Button_WithFream:CGRectMake(delegate.WIDTH*0.2, delegate.HEIGHT*0.9,delegate.WIDTH*0.45, delegate.HEIGHT*0.07) AndTitle:@"Speaker" AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor blackColor]];
    self.speaker.layer.borderWidth = delegate.WIDTH*0.005;
    self.reference.layer.masksToBounds = YES;
    self.speaker.layer.borderColor = border_color;
    [self.speaker addTarget:self action:@selector(speaker_clicked:) forControlEvents:UIControlEventTouchUpInside];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.speaker.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    [self.view addSubview:self.speaker];

    
    self.reference = [UIButton buttonWithType:UIButtonTypeSystem];
    self.reference.frame = CGRectMake(delegate.WIDTH*0.2, delegate.HEIGHT*0.8,delegate.WIDTH*0.45, delegate.HEIGHT*0.08);
    [self.reference setTitle:@"Online Reference" forState:UIControlStateNormal];
    self.reference.backgroundColor = [UIColor clearColor];
    [self.reference.titleLabel setFont:[UIFont fontWithName:@"Avenir" size:18]];
    [self.reference setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.reference.layer.opacity = 0.8;
    self.reference.layer.cornerRadius = 6;
    self.reference.layer.borderWidth = delegate.WIDTH*0.005;
    self.reference.layer.masksToBounds = YES;
    self.reference.layer.borderColor = border_color;
    [self.reference addTarget:self action:@selector(reference_clicked:) forControlEvents:UIControlEventTouchUpInside];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.reference.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    [self.view addSubview:self.reference];
    
    
     self.play1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.play1.frame = CGRectMake(delegate.WIDTH*0.1, delegate.HEIGHT*0.18,delegate.WIDTH*0.8, delegate.WIDTH*0.6);
    [self.play1 setBackgroundImage: [UIImage imageNamed:@"develop.png"]forState:UIControlStateNormal];
    [self.view addSubview:self.play1];
     self.play1.layer.cornerRadius = 6;
    self.play1.enabled = NO;
    
    NSString* text = @"To play this game: Press ‘Start Game’ to play, and select Easy or Hard mode to begin the game.You have 1 minute to select as many correct answers as possible, a functional group will appear at the top, with a choice of 3 answers. Select the matching functional group by either tapping the A,B,C buttons on the left,  or the images themselves on the right. If the user chooses the correct answer, he/she will get 2 points, otherwise he/she will lose 1 point.To skip the current question, click ‘PASS’ button.To exit the the game, click ‘Exit’ button.";
    
    
    self.info1 = [[AVSpeechSynthesizer alloc]init];
    self.info1.delegate = self;
    self.info1_speak = [[AVSpeechUtterance alloc]initWithString:text];
    self.info1_speak.rate = 0.1;
    self.info1_speak.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
    self.info1_speak.volume = 5;
    self.info1_speak.preUtteranceDelay = 0;
    self.info1_speak.postUtteranceDelay = 0;
    
    
    self.picker=[[UIPickerView alloc] initWithFrame:CGRectMake(delegate.WIDTH*0.7,delegate.HEIGHT*0.58, delegate.WIDTH*0.25,delegate.HEIGHT*0.1)];
    self.picker.showsSelectionIndicator=YES;
    self.picker.dataSource=self;
    self.picker.delegate=self;
      if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
          self.picker.frame = CGRectMake(delegate.WIDTH*0.7, delegate.HEIGHT*0.62, delegate.WIDTH*0.2, delegate.WIDTH*0.6);
      }
    [self.view addSubview:self.picker];
    
    self.show = [UIButton buttonWithType:UIButtonTypeSystem];
    self.show.frame = CGRectMake(delegate.WIDTH*0.2, delegate.HEIGHT*0.71, delegate.WIDTH*0.45,delegate.WIDTH*0.1);
    self.show.layer.cornerRadius = 6;
    [self.show setTitle:@"Score Level" forState:UIControlStateNormal];
    self.show.backgroundColor = [UIColor whiteColor];
    [self.show.titleLabel setFont:[UIFont fontWithName:@"Avenir" size:17]];
    [self.show setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.show.layer.borderWidth = delegate.WIDTH*0.005;
    self.show.layer.masksToBounds = YES;
    self.show.layer.borderColor = border_color;
    self.show.enabled = NO;
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.show.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    [self.view addSubview:self.show];
    
    self.icon2 = [self Create_Button_WithFream:CGRectMake(delegate.WIDTH*0.1, delegate.HEIGHT*0.82, delegate.WIDTH*0.1,delegate.HEIGHT*0.05) AndTitle:nil AndBackgroundImage:nil OrBackgroundColor:[UIColor orangeColor] Andfont:18 AndTitleColor:[UIColor blackColor]];
    [self.icon2 setTitle:@"S" forState:UIControlStateNormal];
    self.icon2.backgroundColor = [UIColor clearColor];
    [self.icon2.titleLabel setFont:[UIFont fontWithName:@"Entypo" size:40]];
    [self.view addSubview:self.icon2];
    
    self.icon3 = [self Create_Button_WithFream:CGRectMake(delegate.WIDTH*0.1, delegate.HEIGHT*0.71, delegate.WIDTH*0.1,delegate.HEIGHT*0.05) AndTitle:nil AndBackgroundImage:nil OrBackgroundColor:[UIColor orangeColor] Andfont:18 AndTitleColor:[UIColor blackColor]];
    [self.icon3 setTitle:@"B" forState:UIControlStateNormal];
    self.icon3.backgroundColor = [UIColor clearColor];
    [self.icon3.titleLabel setFont:[UIFont fontWithName:@"Entypo" size:40]];
    [self.view addSubview:self.icon3];
    
    
    self.moreApps = [self Create_Button_WithFream:CGRectMake(delegate.WIDTH*0.1, delegate.WIDTH*0.08, delegate.WIDTH*0.8,delegate.WIDTH*0.1) AndTitle:@"Get More Apps" AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:22 AndTitleColor:[UIColor blackColor]];
    [self.moreApps addTarget:self action:@selector(moreApps_Clicked:) forControlEvents:UIControlEventTouchUpInside];
    self.moreApps.layer.borderWidth = delegate.WIDTH*0.005;
    self.moreApps.layer.masksToBounds = YES;
    self.moreApps.layer.borderColor = border_color;
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.moreApps.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    [self.view addSubview:self.moreApps];
}

-(void)reference_clicked:(id)sender
{
    NSURL* url = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Functional_group"];//创建URL
    [[UIApplication sharedApplication]openURL:url];

}


-(void)moreApps_Clicked:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewArtist?id=885902457"]];//Opens the resource at the specified URL.
}


- (UIImage*)ChangeimageWithImage:(UIImage*)image
{
    CGRect newRect = CGRectMake(100, 65, 100, 100);
    CGSize newSize = newRect.size;
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];//Draws the entire image in the specified rectangle, scaling it as needed to fit.
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 3;
}


-( NSString*) pickerView: (UIPickerView*) pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.score_Array objectAtIndex:row];//取出该行的内容。
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    NSString* level = [self.score_Array objectAtIndex:row];
    if([level isEqualToString:[NSString stringWithFormat:@"A"]])
        [self.show setTitle:@"Score: 30 - infinity" forState:UIControlStateNormal];
    else if([level isEqualToString:[NSString stringWithFormat:@"B"]])
        [self.show setTitle:@"Score: 20 - 30" forState:UIControlStateNormal];
    else if([level isEqualToString:[NSString stringWithFormat:@"C"]])
        [self.show setTitle:@"Score: 10 - 20" forState:UIControlStateNormal];
}


- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer
 didFinishSpeechUtterance:(AVSpeechUtterance *)utterance
{
    if(self.info1 == synthesizer && self.info1_speak == utterance)
    {
        self.count1 = 0;
        self.start1 = true;
    }
}

-(void)speaker_clicked:(id)sender
{
        if(self.start1&&self.count1 == 0)
        {
            [self.info1 speakUtterance:self.info1_speak];
                self.count1++;
                self.start1 = false;
        }
        else if(!self.start1)
        {
            if([self.info1 pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate])
            self.start1 = true;
        }
        else if(self.start1)
        {
            if(self.info1.paused)
            if([self.info1 continueSpeaking])
            self.start1 = false;
        }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}


-(void)quit_clicked:(id)sender
{
    if(self.info1.speaking)
    {
        self.start1 = false;
        [self.info1 pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
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
    [self.view addSubview:button];
    return button;    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
