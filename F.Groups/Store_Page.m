//
//  Store_Page.m
//  One-minute APP
//
//  Created by Shuran Xu on 2015-05-26.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//


/****************************************** 经验: ********************************************************
 
1.gamecentreviewcontroller不能直接加载在当前视图上，这样会直接覆盖当前视图，并且是透明的。还无法调用协议函数返回视图界面。
 注:透明的原因是view controller初始化得太早了!
2.gamecentreviewcontroller虽说本身已包含leaderboard和achievement，但并不成熟，如果只打开该视图，会是空白。
3.即使leaderboard和achievement已被淘汰，但依旧是最保险的使用类。   
4. leaderboard 只能存每个用户的最高分，不能存a list of data for one user.
 *** 5.如果想让得知系统何时从子线程或后台运行结束，就可以用timer一直call selector method来不停询问系统!!!!
 
 ******************************************************************************************************
 */

#import "Store_Page.h"

@interface Store_Page ()

@end

@implementation Store_Page

@synthesize hard = _hard;
@synthesize simple = _simple;
@synthesize view1 = _view1;
@synthesize view2 = _view2;
@synthesize quit = _quit;
@synthesize HEIGHT = _HEIGHT;
@synthesize WIDTH = _WIDTH;
@synthesize GAP_X = _GAP_X;
@synthesize achievementImages = _achievementImages;
@synthesize timer = _timer;

- (instancetype)initWithNibName:(NSString *)nibName
                         bundle:(NSBundle *)nibBundle
{
    self = [super initWithNibName:nibName bundle:nibBundle];
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.WIDTH = delegate.WIDTH*0.8;
    self.HEIGHT = delegate.HEIGHT*0.07;
    self.GAP_X = (delegate.WIDTH-self.WIDTH)/2;
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = self.view.backgroundColor = [UIColor colorWithPatternImage:[self ChangeimageWithImage:[UIImage imageNamed:@"lead.ps"]]];
    
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.simple = [self Create_Button_WithFream:CGRectMake(self.GAP_X, delegate.HEIGHT*0.22, self.WIDTH, self.HEIGHT) AndTitle:@"Simple Game" AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor blackColor]];
    [self.simple addTarget:self action:@selector(simple_clicked:) forControlEvents:UIControlEventTouchUpInside];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.simple.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    self.simple.layer.borderWidth = delegate.WIDTH*0.005;
    self.simple.layer.masksToBounds = YES;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGFloat r = (CGFloat) 0/255;
    CGFloat g = (CGFloat) 0/255;
    CGFloat b = (CGFloat) 0/255;
    CGFloat a = (CGFloat) 1.0;
    CGFloat components[4] = {r,g,b,a};
    CGColorRef color = CGColorCreate(colorSpaceRef,components);
    self.simple.layer.borderColor = color;
    
    [self.view addSubview:self.simple];
    
    self.hard = [self Create_Button_WithFream:CGRectMake(self.GAP_X, delegate.HEIGHT*0.4, self.WIDTH, self.HEIGHT)  AndTitle:@"Hard Game" AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor blackColor]];
    [self.hard addTarget:self action:@selector(hard_clicked:) forControlEvents:UIControlEventTouchUpInside];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.hard.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    self.hard.layer.borderWidth = delegate.WIDTH*0.005;
    self.hard.layer.masksToBounds = YES;
    self.hard.layer.borderColor = color;

    [self.view addSubview:self.hard];
    
    self.view1 = [[LeaderBoard alloc]initWithNibName:nil bundle:nil];
    self.view2 = [[LDB2 alloc]initWithNibName:nil bundle:nil];
    
    self.gamecenter = [self Create_Button_WithFream:CGRectMake(self.GAP_X, delegate.HEIGHT*0.58, self.WIDTH, self.HEIGHT)  AndTitle:@"Game Center" AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor blackColor]];
    [self.gamecenter addTarget:self action:@selector(game_clicked:) forControlEvents:UIControlEventTouchUpInside];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.gamecenter.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    self.gamecenter.layer.borderWidth = delegate.WIDTH*0.005;
    self.gamecenter.layer.masksToBounds = YES;
    self.gamecenter.layer.borderColor = color;
    [self.view addSubview:self.gamecenter];

    
    self.quit = [self Create_Button_WithFream:CGRectMake(self.GAP_X, delegate.HEIGHT*0.76, self.WIDTH, self.HEIGHT)  AndTitle:@"Back" AndBackgroundImage:nil OrBackgroundColor:[UIColor clearColor] Andfont:20 AndTitleColor:[UIColor blackColor]];
    [self.quit addTarget:self action:@selector(quit_clicked:) forControlEvents:UIControlEventTouchUpInside];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self.quit.titleLabel setFont:[UIFont systemFontOfSize:30]];
    }
    self.quit.layer.borderWidth = delegate.WIDTH*0.005;
    self.quit.layer.masksToBounds = YES;
    self.quit.layer.borderColor = color;
    [self.view addSubview:self.quit];
    
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



-(void)achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


/* 
 IMPORTANT:
 
 As soon as your game moves to the background, the value of the local player object’s authenticated property becomes and remains invalid until your game moves back to the foreground. You cannot read the value to determine if the player is still authenticated until Game Kit reauthenticates the player and calls your authentication handler. Your game must act as though there is not an authenticated player until your completion handler is called. Once your handler is called, value stored in the authenticated property is valid again.
 
 - (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait//基于默认模式调用主线程中接收器的方法.
 
 wait:
 一个布尔值，指定是否阻塞当前线程直到指定选择器在主线程中执行完毕。选择YES会阻塞这个线程；选择NO，本方法会立刻返回。
 
 - (void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay; //这个方法是单线程的，也就是说只有当前调用此方法的函数执行完毕后，selector方法才会被调用。
 
 */

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


-(void)game_clicked:(id)sender
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(delegate.music_set)
        [self Touch_Sound];
    if(!delegate.opened)
    {
        delegate.opened = true;
       if([GameCenterManager isGameCenterAvailable])
        {
            self.game_manager= [[GameCenterManager alloc] init];
            [self.game_manager authenticateLocalUser];
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(Asking) userInfo:nil repeats:YES];
            
        }
    }
    else
        [self show_gcView];
}

-(void)Asking
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(delegate.finished)
    {
        [self.timer invalidate];
        [self show_gcView];
    }
    
}

-(void)show_gcView
{
    if(!self.ach)
    {
        self.ach = [[GKAchievementViewController alloc]init];
        _ach.achievementDelegate = self;
    }
    [self Setup_Everything];
    [self presentViewController:_ach animated:YES completion:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self UpdateEasyAchievementData];
    [self UpdateHardAchievementData];
    
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
    button.layer.opacity = 0.7;
    [self.view addSubview:button];
    return button;
}

-(void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)Setup_Everything
{
    if(!self.Leaderboard_View)
    {
        self.Leaderboard_View = [[GKLeaderboardViewController alloc]init];
        self.Leaderboard_View.leaderboardDelegate = self;
    }
    [self UpdateEasyAchievementData];
    [self UpdateHardAchievementData];
    
    self.currentLeaderBoard = kHardLeaderboardID;
    self.Leaderboard_View.leaderboardIdentifier = self.currentLeaderBoard;
    [self submitScores_WithLeaderBoardID:self.currentLeaderBoard];//reloadHighScoresForIdentifier:在该函数中调用过了。
    
    self.currentLeaderBoard = kEasyLeaderboardID;
    self.Leaderboard_View.leaderboardIdentifier = self.currentLeaderBoard;
    [self submitScores_WithLeaderBoardID:self.currentLeaderBoard];
    [self setupUI];
    
}

 /* Note:  An GKAchievementDescription object holds text and images used to describe an achievement. When you develop your game, you create localized achievement descriptions in iTunes Connect. At runtime, your game retrieves these descriptions from Game Center.*/

-(void)setupUI{
    //更新排行榜个数
    [GKLeaderboard loadLeaderboardsWithCompletionHandler:^(NSArray *leaderboards, NSError *error) {
        if (error) {
            NSLog(@"加载排行榜过程中发生错误,错误信息:%@",error.localizedDescription);
        }
        //获取得分,注意只有调用了loadScoresWithCompletionHandler：方法之后leaderboards中的排行榜中的scores属性才有值，否则为nil
        [leaderboards enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            GKLeaderboard *leaderboard=obj;
            [leaderboard loadScoresWithCompletionHandler:^(NSArray *scores, NSError *error) {
            }];
        }];
    }];
    //更新获得成就个数，注意这个个数不一定等于iTunes Connect中的总成就个数，此方法只能获取到成就完成进度不为0的成就
    [GKAchievement loadAchievementsWithCompletionHandler:^(NSArray *achievements, NSError *error) {
        if (error) {
            NSLog(@"加载成就过程中发生错误,错误信息:%@",error.localizedDescription);
        }
        //加载成就描述(注意，即使没有获得此成就也能获取到)
        [GKAchievementDescription loadAchievementDescriptionsWithCompletionHandler:^(NSArray *descriptions, NSError *error)
         {
            if (error)
                {
                    NSLog(@"加载成就描述信息过程中发生错误,错误信息:%@",error.localizedDescription);
                }
            else{
                    //加载成就图片
                _achievementImages=[NSMutableDictionary dictionary];//Creates and returns an empty dictionary.
                
                [descriptions enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
                 {
                    GKAchievementDescription *description=(GKAchievementDescription *)obj;
                    [description loadImageWithCompletionHandler:^(UIImage *image, NSError *error)
                     {
                        [_achievementImages setObject:image forKey:description.identifier];
                     }];
                }];
            }
        }];
    }];
    NSLog(@"%@",self.achievementImages); //So far we can use self.achievementImages to check images that we used as achievement images, currently there is no customized image for our achievements.
}



-(void)UpdateEasyAchievementData
{
    if(self.AchievementID == nil)
        self.AchievementID = [[NSString alloc]init];
    //在这里面我们甄别出achievement的类型,并赋予相应的achievement id，再调用game_manager的submitAchievement:percentComplete: 同理对于hard one.
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(delegate.best_score2>0)
        self.currentScore = delegate.best_score2;
    else
    {
        int score = (int)[delegate.user_defaut integerForKey:@"Highest Score2"];
        self.currentScore = score;
    }
    
    //For total score:
   
        if(self.currentScore>=10)
        {
            self.AchievementID = kEasyHiScore1;
            self.percentComplete = 100;
             [self.game_manager submitAchievement:self.AchievementID percentComplete:self.percentComplete];
        }
        if(self.currentScore >=20)
        {
            self.AchievementID = kEasyHiScore2;
            self.percentComplete = 100;
             [self.game_manager submitAchievement:self.AchievementID percentComplete:self.percentComplete];
        }
         if(self.currentScore >=40)
         {
            self.AchievementID = kEasyHiScore3;
            self.percentComplete = 100;
             [self.game_manager submitAchievement:self.AchievementID percentComplete:self.percentComplete];
         }
        if(self.currentScore>=80)
        {
            self.AchievementID = kEasyHiScore4;
            self.percentComplete = 100;
             [self.game_manager submitAchievement:self.AchievementID percentComplete:self.percentComplete];
        }
        
    //For straght correct answers:
    if(delegate.Easy_Steak1_Got)
    {
        self.AchievementID = kEasyStreak1;
        self.percentComplete = 100;
        [self.game_manager submitAchievement:self.AchievementID percentComplete:self.percentComplete];
    }
    if(delegate.Easy_Steak2_Got)
    {
        self.AchievementID = kEasyStreak2;
        self.percentComplete = 100;
        [self.game_manager submitAchievement:self.AchievementID percentComplete:self.percentComplete];
    }
    
    if(delegate.Easy_Steak3_Got)
    {
        self.AchievementID = kEasyStreak3;
        self.percentComplete = 100;
        [self.game_manager submitAchievement:self.AchievementID percentComplete:self.percentComplete];
    }
    
    if(delegate.Easy_Steak4_Got)
    {
        self.AchievementID = kEasyStreak4;
        self.percentComplete = 100;
        [self.game_manager submitAchievement:self.AchievementID percentComplete:self.percentComplete];
    }
}

-(void)UpdateHardAchievementData
{
    if(self.AchievementID == nil)
        self.AchievementID = [[NSString alloc]init];
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if(delegate.best_score1>0)
        self.currentScore = delegate.best_score1;
    else
    {
        int score = (int)[delegate.user_defaut integerForKey:@"Highest Score"];
        self.currentScore = score;
    }
    
    //For total score:
  
        if(self.currentScore>=10)
        {
            self.AchievementID = kHardHiScore1;
            self.percentComplete = 100;
             [self.game_manager submitAchievement:self.AchievementID percentComplete:self.percentComplete];
        }
        if(self.currentScore>=20)
        {
            self.AchievementID = kHardHiScore2;
            self.percentComplete = 100;
             [self.game_manager submitAchievement:self.AchievementID percentComplete:self.percentComplete];
        }
        if(self.currentScore>=40)
        {
            self.AchievementID = kHardHiScore3;
            self.percentComplete = 100;
             [self.game_manager submitAchievement:self.AchievementID percentComplete:self.percentComplete];
         
        }
        if(self.currentScore>=80)
        {
            self.AchievementID = kHardHiScore4;
            self.percentComplete = 100;
             [self.game_manager submitAchievement:self.AchievementID percentComplete:self.percentComplete];
        }
        
    //For straght rows:
    if(delegate.Hard_Steak1_Got)
    {
        self.AchievementID = kHardStreak1;
        self.percentComplete = 100;
        [self.game_manager submitAchievement:self.AchievementID percentComplete:self.percentComplete];
    }
    if(delegate.Hard_Steak2_Got)
    {
        self.AchievementID = kHardStreak2;
        self.percentComplete = 100;
        [self.game_manager submitAchievement:self.AchievementID percentComplete:self.percentComplete];
    }
    
    if(delegate.Hard_Steak3_Got)
    {
        self.AchievementID = kHardStreak3;
        self.percentComplete = 100;
        [self.game_manager submitAchievement:self.AchievementID percentComplete:self.percentComplete];
    }
    
    if(delegate.Hard_Steak4_Got)
    {
        self.AchievementID = kHardStreak4;
        self.percentComplete = 100;
        [self.game_manager submitAchievement:self.AchievementID percentComplete:self.percentComplete];
    }
}


//只要我们需要加载leaderboard,我们就在加载前把数据上传到leaderboard上。we need to do more about the scores ....
- (void) submitScores_WithLeaderBoardID:(NSString*)ID
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if([ID isEqualToString:kEasyLeaderboardID])
    {
        self.currentScore = delegate.best_score2;
        if(self.currentScore>0)
            [self.game_manager reportScore: self.currentScore forCategory: self.currentLeaderBoard];
    }
    else if([ID isEqualToString:kHardLeaderboardID])
    {
        self.currentScore = delegate.best_score1;
        if(self.currentScore>0)
            [self.game_manager reportScore: self.currentScore forCategory: self.currentLeaderBoard];
    }
}



@end
