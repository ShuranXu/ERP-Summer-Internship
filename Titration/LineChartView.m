//
//  LineChartView.m
//  DrawDemo
//
//  Created by Shuran Xu on 15-7-31.
//  Copyright (c) 2012年 Shuran Xu. All rights reserved.
//

#import "LineChartView.h"

@interface LineChartView()
{
    CALayer *linesLayer;

    UIView *popView;
    UILabel *disLabel;
}

@end

@implementation LineChartView

@synthesize array;
@synthesize back = _back;
@synthesize x_scale;
@synthesize y_scale;
@synthesize horizontal_length;
@synthesize vertical_length;
@synthesize beginning_x;
@synthesize beginning_y;
@synthesize ending_x;
@synthesize ending_y;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor grayColor];
        self.delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
        {
            beginning_x = self.frame.size.width*0.02+30;
            beginning_y = self.frame.size.height*0.9-50;
            ending_x = self.frame.size.width*0.9;
            ending_y = self.frame.size.height*0.4;
        }
        else{
            beginning_x = self.frame.size.width*0.02+30;
            beginning_y = self.frame.size.height*0.9-30;
            ending_x = self.frame.size.width*0.9;
            ending_y = self.frame.size.height*0.5;
        }
        }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self setClearsContextBeforeDrawing: YES]; //When set to YES, the drawing buffer is automatically cleared to transparent black before the drawRect: method is called.
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //画背景线条------------------
    CGFloat backLineWidth = 2.f;
  
    CGContextSetLineWidth(context, backLineWidth);//主线宽度
    
    CGContextSetLineJoin(context, kCGLineJoinRound);//Sets the style for the joins of connected lines in a graphics context.
    
    CGContextSetLineCap(context, kCGLineCapRound );//Sets the style for the endpoints of lines drawn in a graphics context.
    
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor); //Sets the current stroke color in a context, using a Quartz color.
   
    int y = self.frame.size.height*0.9 - 30 ;
    
    
    //Setup scales:
    CGPoint temp = [[array objectAtIndex:[array count]-1] CGPointValue];
    double max;
    if(self.delegate.solu_select == 0 )//HCL
        max = 1*ceil(temp.x/1);
    else
        max = 10*ceil(temp.x/10);
    
    self.y_scale = (beginning_y - ending_y)/14;
    self.horizontal_length = ending_x - beginning_x;
    self.vertical_length = beginning_y - ending_y;
    self.x_scale = (ending_x - beginning_x)/max;
   
    //画纵轴label
    for(unsigned i =0; i<15; i++)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(beginning_x-30,beginning_y-10-i*self.y_scale, 40, 20)];
        
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setFont:[UIFont systemFontOfSize:12]];
        if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
             [label setFont:[UIFont systemFontOfSize:20]];
        [label setTextColor:[UIColor blackColor]];
        [label setText:[NSString stringWithFormat:@"%.0u",i]];
            
        [self addSubview:label];
        
    }
    
    for(unsigned i = 0; i <11; i++)
    {
        if(i == 0)
        {
            CGContextMoveToPoint(context, beginning_x, beginning_y);
            CGContextAddLineToPoint(context,ending_x,beginning_y);
        }
        //Draw X-axis
        
        double x_test = i*(ending_x - beginning_x)/10;
        UILabel* label2;
            label2 = [[UILabel alloc]initWithFrame:CGRectMake(beginning_x + x_test-10,beginning_y, 20, 20)]; //加的20是label自身的宽。
        
        [label2 setTextAlignment:NSTextAlignmentCenter];
        [label2 setBackgroundColor:[UIColor clearColor]];
        [label2 setTextColor:[UIColor blackColor]];
        label2.numberOfLines = 1;
        label2.adjustsFontSizeToFitWidth = YES;
        if(self.delegate.solu_select == 0 )//HCL
            [label2 setText:[NSString stringWithFormat:@"%.1f",(i*max*0.1)]];
        else
            [label2 setText:[NSString stringWithFormat:@"%.1f",(i*max*0.1)]];

        [label2 setFont:[UIFont systemFontOfSize:12]];
        if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
            [label2 setFont:[UIFont systemFontOfSize:20]];

        [self addSubview:label2];
    }

    for(unsigned i = 0; i< [array count]; i++)
    {
        CGPoint temp = [[array objectAtIndex:i] CGPointValue];
        double x_posi = beginning_x + temp.x*self.x_scale;
        
        double y_posi = beginning_y -(temp.y * self.y_scale);
        
         //画曲线:
        UILabel* dot = [[UILabel alloc]initWithFrame:CGRectMake(x_posi-2.5, y_posi-2.5, 5, 5)];
        if([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad)
            dot.frame = CGRectMake(x_posi-2.5, y_posi-2.5, 10, 10);
            dot.layer.cornerRadius = 30;
        dot.backgroundColor = [UIColor whiteColor];
        [self addSubview:dot];
        
        CGContextStrokePath(context);
        
        y = y - 20;
    }
    
      //画y轴:
        CGContextMoveToPoint(context,beginning_x, beginning_y);//self.frame.size.height*0.855
        CGContextAddLineToPoint(context,beginning_x,ending_y);
    
        CGContextStrokePath(context);//Paints a line along the current path. The color we are about to use has already been set on CGContextSetStrokeColorWithColor().
}

@end

/*
   int limit1 = (int) vDesc.count;
 self.highest_height = y -(limit1)*40+20;//该数值是为了曲线终点做的,加20的原因是纵横线之间的间距为20。

 
 int limit2 = (int)[hDesc count];
 for(int i = 0; i<limit2; i++)
 {
 //画横坐标
 int x_offset = floor(self.frame.size.width/limit2);
 UILabel* label2;
 if(i == 0)
 label2 = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width*0.02+30,self.frame.size.height*0.9-25, 20, 20)];
 else
 label2 = [[UILabel alloc]initWithFrame:CGRectMake(i*x_offset+20,self.frame.size.height*0.9-25, 30, 20)]; //加的20是label自身的宽。
 
 [label2 setTextAlignment:NSTextAlignmentCenter];
 [label2 setBackgroundColor:[UIColor clearColor]];
 [label2 setTextColor:[UIColor blackColor]];
 label2.numberOfLines = 1;
 label2.adjustsFontSizeToFitWidth = YES;
 [label2 setText:[hDesc objectAtIndex:i]];
 [label2 setFont:[UIFont systemFontOfSize:10]];
 [self addSubview:label2];
 }
 


  for (int i=0; i<limit1; i++)
 {
 //画纵轴label
 
 CGPoint bPoint = CGPointMake(self.frame.size.width*0.02+30, y);
 CGPoint ePoint = CGPointMake(x, y);
 
 UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width*0.02, 0, 50, 30)];
 if(self.cut_num >0)
 [label setCenter:CGPointMake(bPoint.x-10, bPoint.y-20)];
 else
 [label setCenter:CGPointMake(bPoint.x-10, bPoint.y-30)];
 
 [label setTextAlignment:NSTextAlignmentLeft];
 [label setBackgroundColor:[UIColor clearColor]];
 [label setFont:[UIFont systemFontOfSize:12]];
 [label setTextColor:[UIColor blackColor]];
 [label setText:[vDesc objectAtIndex:i]];
 [self addSubview:label];
 double temp = [[vDesc objectAtIndex:i]doubleValue];
 
 
 //画纵轴横线
 if(self.cut_num >0)
 {
 CGContextMoveToPoint(context, bPoint.x, bPoint.y-20);
 CGContextAddLineToPoint(context, ePoint.x, ePoint.y-20);
 }
 else
 {
 CGContextMoveToPoint(context, bPoint.x, bPoint.y-30);
 CGContextAddLineToPoint(context, ePoint.x, ePoint.y-30);
 }
 
 CGContextStrokePath(context);//Paints a line along the current path. The color we are about to use has already been set on CGContextSetStrokeColorWithColor().
 
 if(temp == 8.00)
 {
 self.saved_height = bPoint.y-30;//current label's height.
 double beginning_pt_x = bPoint.x; //label's width + starting point.
 double beginning_pt_y = self.frame.size.height*0.9-30; //view's height - label's height.
 double ending_pt_x = self.frame.size.width;
 
 CGFloat dashArray1[] = {5,5};
 CGContextSetLineDash(context, 0, dashArray1, 2);//画虚线,可参
 
 if(self.saved_index == 0)
 self.saved_index = 1;
 
 //画曲线:
 CGContextMoveToPoint(context,beginning_pt_x, beginning_pt_y);
 
 //通过一个控制点来描述ph<=8的情况。
 CGContextAddQuadCurveToPoint(context, self.saved_index*hInterval,beginning_pt_y , self.saved_index*hInterval, self.saved_height);
 
 //将3次曲线的第二个控制点与终点的纵坐标一致，可形成水平线，因为导数为0。
 CGContextAddCurveToPoint(context, self.saved_index*hInterval, self.highest_height, self.frame.size.width*0.7, self.highest_height, ending_pt_x, self.highest_height);
 
 CGContextStrokePath(context);//Paints a line along the current path. The color we are about to use has already been set on CGContextSetStrokeColorWithColor().
 }
 
 CGContextSetLineDash(context, 0, NULL, 0);//取消虚线模式
 y -= 40;
 }
 
 */



















