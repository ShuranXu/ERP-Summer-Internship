//
//  Load.m
//  WaveLength
//
//  Created by Shuran Xu on 2015-07-23.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import "Load.h"

@interface Load ()

@end

@implementation Load

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage* background = [UIImage imageNamed:@"loading.png"];
    self.view.backgroundColor = self.view.backgroundColor = [UIColor colorWithPatternImage:[self ChangeimageWithImage:background]];
    
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.wait=[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(delegate.WIDTH*0.2,delegate.WIDTH*0.5,delegate.WIDTH*0.7,delegate.WIDTH*0.7)];
    
    self.wait.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    
    self.wait.center=CGPointMake(delegate.WIDTH*0.5,delegate.WIDTH*0.9);//可以设置中心，但不能设置大小。
    [self.wait startAnimating];//Starts the animation of the progress indicator.
    
    self.wait.hidesWhenStopped=YES;
    self.wait.color=[UIColor blackColor];
    [self.view addSubview:self.wait];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
