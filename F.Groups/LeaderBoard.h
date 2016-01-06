//
//  LeaderBoard.h
//  One-minute APP
//
//  Created by Shuran Xu on 2015-05-26.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import <UIKit/UIKit.h> 
#import "TableViewCell.h"
#import "AppDelegate.h"

@class TableViewCell;
//THIS IS FOR HARD-LEVEL DATABASE !

@interface LeaderBoard : UITableViewController <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) NSMutableArray* stored_data;
@property(nonatomic,strong) NSMutableArray* preset_row;
@property(nonatomic,strong) NSString* DirPath;
@property(nonatomic,strong) NSString* FilePath;
@property(nonatomic,strong) NSString* DirPath2;
@property(nonatomic,strong) NSString* FilePath2;
@property(nonatomic) NSMutableArray* stored_score;
@property(nonatomic) BOOL empty_score;
@property(nonatomic) BOOL empty_name;
@property(nonatomic) BOOL used;
@property(nonatomic) int length_compare;
@property(nonatomic,strong) NSString* name_reference;
@property(nonatomic) int created_data;
@property(nonatomic,strong) NSString* created_name;
@property(nonatomic) BOOL addName;
@property(nonatomic) BOOL addScore;
@property(nonatomic,strong) TableViewCell* cell;


-(void)Read_Data_From_Local_File;
-(void)Read_Score_From_Local_File;
-(void)Delete_Name_And_Score_At_indexPath:(NSIndexPath *)indexPath In:(UITableView*)tableView;


@end
