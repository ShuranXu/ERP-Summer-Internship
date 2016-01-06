//
//  Table_Point.m
//  Titration
//
//  Created by Shuran Xu on 2015-07-30.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import "Table_Point.h"

@implementation Table_Point

-(void)Set_OH_Vol:(double)var
{
    OH_volume = var;
}
-(void)Set_PH_value:(double)var
{
    PH_value = var;
}
-(double)Get_OH_Vol
{
    return OH_volume;
}
-(double)Get_PH_value
{
    return PH_value;
}


@end
