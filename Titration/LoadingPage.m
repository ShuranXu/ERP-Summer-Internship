//
//  LoadingPage.m
//  Titration
//
//  Created by Shuran Xu on 2015-08-08.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import "LoadingPage.h"

@interface LoadingPage ()

@end

@implementation LoadingPage
@synthesize next_view;
@synthesize wait;
@synthesize clock;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    // Do any additional setup after loading the view.
    UIImage* background = [UIImage imageNamed:@"loading.png"];
     self.view.backgroundColor = self.view.backgroundColor = [UIColor colorWithPatternImage:[self ChangeimageWithImage:background]];
    
    self.wait=[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(delegate.WIDTH*0.2,delegate.WIDTH*0.5,delegate.WIDTH*0.7,delegate.WIDTH*0.7)];
    
    self.wait.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    
    self.clock=[NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(StopWait:) userInfo:nil repeats:NO];//建立一个时钟对象，让活动指示器3秒钟后停止动画。
    
    self.wait.center=CGPointMake(delegate.WIDTH*0.5,delegate.WIDTH*0.9);//可以设置中心，但不能设置大小。
    [self.wait startAnimating];//Starts the animation of the progress indicator.
    
    self.wait.hidesWhenStopped=YES;
    self.wait.color=[UIColor blackColor];
    [self.view addSubview:self.wait];
    
    self.next_view = [[Menu alloc]initWithNibName:nil bundle:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) StopWait:(id)sender

{
    [self.wait stopAnimating];
    [self presentViewController:self.next_view animated:YES completion:nil];
    
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



@end
