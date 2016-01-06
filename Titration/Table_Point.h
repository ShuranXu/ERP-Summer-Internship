//
//  Table_Point.h
//  Titration
//
//  Created by Shuran Xu on 2015-07-30.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Table_Point : NSObject
{
    double OH_volume;
    double PH_value;
}


-(void)Set_OH_Vol:(double)var;
-(void)Set_PH_value:(double)var;
-(double)Get_OH_Vol;
-(double)Get_PH_value;
@end
