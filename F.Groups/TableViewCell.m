//
//  TableViewCell.m
//  One-minute APP
//
//  Created by Shuran Xu on 2015-06-05.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell
@synthesize label2 = _label2;
@synthesize label1 = _label1;
@synthesize myname = _myname;
@synthesize myscore = _myscore;


- (void)awakeFromNib {
    // Initialization code
    
    /*
     - (NSArray *)loadNibNamed:(NSString *)name owner:(id)owner options:(NSDictionary *)options
     Description:
     Unarchives the contents of a nib file located in the receiver's bundle. The return value is an array containing the top-level objects in the nib file.
     
     You can use this method to load user interfaces and make the objects available to your code. During the loading process, this method unarchives each object, initializes it, sets its properties to their configured values, and reestablishes any connections to other objects.
     
     */

   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
