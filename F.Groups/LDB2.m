//
//  LDB2.m
//  One-minute APP
//
//  Created by Shuran Xu on 2015-05-26.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import "LDB2.h"

@interface LDB2 ()

@end

@implementation LDB2
@synthesize stored_score = _stored_score;
@synthesize FilePath2 = _FilePath2;
@synthesize DirPath2 = _DirPath2;
@synthesize empty_name = _empty_name;
@synthesize empty_score = _empty_score;
@synthesize used = _used;
@synthesize created_data = _created_data;
@synthesize created_name = _created_name;
@synthesize length_compare = _length_compare;
@synthesize name_reference = _name_reference;
@synthesize cell = _cell;


- (instancetype)initWithNibName:(NSString *)nibName
                         bundle:(NSBundle *)nibBundle
{
    self = [super initWithNibName:nibName bundle:nibBundle];
    if(self)
    {
        self.stored_score = nil;
        self.empty_score = true;
        self.empty_name = true;
        self.used = false;
        self.length_compare = 0;
        self.created_name = nil;
        self.created_data = 0;
        self.addScore = false;
        self.addName = false;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self Find_Score_Path];
    self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.delegate = self;
    self.tableView.allowsSelection = NO;
    self.tableView.allowsMultipleSelection = NO;
    self.tableView.allowsSelectionDuringEditing = NO;
    self.tableView.delegate = self;
    UINavigationBar* bar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,44)];
    self.navigationItem.rightBarButtonItem = self.editButtonItem; //navigationItem : This is a unique instance of UINavigationItem created to represent the view controller when it is pushed onto a navigation controller.
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(Cancel_Clicked:)];
    
    [bar pushNavigationItem:self.navigationItem animated:NO];
    [self.tableView addSubview:bar];
    [self Read_Data_From_Local_File];
    [self Read_Score_From_Local_File];
    [self Set_preset_row];
    self.used = true;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    if(!self.used)
    {
        [self Read_Data_From_Local_File];
        [self Read_Score_From_Local_File];
        [self Set_preset_row];
        [self.tableView reloadData];
    }
    else
        self.used = false;
}

-(void)Set_preset_row
{
    self.preset_row = nil;
    if([self.stored_data count]>[self.stored_score count])
    {
        for(int i = 0; i < [self.stored_data count]; i++)
    {
        if(i == 0)
            self.preset_row = [NSMutableArray arrayWithObject:@"1"];
        else
            [self.preset_row insertObject:@"1" atIndex:i];
    }
    }
    else
    {
        for(int i = 0; i < [self.stored_score count]; i++)
        {
            if(i == 0)
                self.preset_row = [NSMutableArray arrayWithObject:@"1"];
            else
                [self.preset_row insertObject:@"1" atIndex:i];
        }

    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)Read_Data_From_Local_File
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);//Creates a list of directory search paths.
    NSString* documentsDirPath = [paths objectAtIndex:0];//Obtain the path for Documents directory.
    self.DirPath = [documentsDirPath stringByAppendingPathComponent:@"Names2"];//Create an new path under "Document" directory.
    self.FilePath = [_DirPath stringByAppendingPathComponent:@"name2.txt"];//Create a path for the text file for the saving data under "Document" directory.
    NSError* error;
    //Read data from the local file:
    NSString* nameInfoString = [NSString stringWithContentsOfFile:_FilePath encoding:NSUTF8StringEncoding error:&error];
    if(nameInfoString == NULL)
    {
        self.empty_name = true;
        return;
    }
    else
    {
        self.empty_name = false;
        //(2) Divide nameInfoString into an array using commas:
        NSArray* nameInfoStringArray = [nameInfoString componentsSeparatedByString:@","];
        
        //Create and intialize self.stored_data:
        self.stored_data = [NSMutableArray arrayWithArray:nameInfoStringArray];
        if([[self.stored_data lastObject] isEqualToString:[NSString stringWithFormat:@""]])
            [self.stored_data removeObjectAtIndex:[self.stored_data count]-1];
    }
    
}


-(void)Read_Score_From_Local_File
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);//Creates a list of directory search paths.
    NSString* documentsDirPath = [paths objectAtIndex:0];//Obtain the path for Documents directory.
    self.DirPath2 = [documentsDirPath stringByAppendingPathComponent:@"Score2"];//Create an new path under "Document" directory.
    self.FilePath2 = [_DirPath2 stringByAppendingPathComponent:@"score2.txt"];//Create a path for the text file for the saving data under "Document" directory.
    NSError* error;
    //Read data from the local file:
    NSString* scoreInfoString = [NSString stringWithContentsOfFile:_FilePath2 encoding:NSUTF8StringEncoding error:&error];
    if(scoreInfoString == NULL)
    {
        self.empty_score = true;
        return;
    }
    else
    {
        self.empty_score = false;
        self.stored_score = [NSMutableArray arrayWithArray:[scoreInfoString componentsSeparatedByString:@","]];
        //Sort self.stored_score:
        // [self.stored_score sortedArrayUsingComparator:compareElements];
        
    }
}


/*NSComparator compareElement = ^ (id ele1, id ele2)
{
    int temp1 = (int)ele1;
    int temp2 = (int)ele2;
    if(temp1 > temp2)
        return NSOrderedAscending;
    else if(temp1 == temp2)
        return NSOrderedSame;
    else
        return NSOrderedDescending;
};*/


-(void) Cancel_Clicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.preset_row count];
    
}

-(void)Check_stored_score_LastObject
{
    NSString* delete_one = [self.stored_score lastObject];
    if([delete_one isEqualToString:[NSString stringWithFormat:@""]])
        [self.stored_score removeObjectAtIndex:[self.stored_score count]-1];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell...
    static NSString* reusedIdentifier=@"TableViewCell";
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:reusedIdentifier];
    
    /* Note: Prior to dequeueing any cells, call this method or the registerNib:forCellReuseIdentifier: method to tell the table view how to create new cells. If a cell of the specified type is not currently in a reuse queue, the table view uses the provided information to create a new cell object automatically.
     */
    self.cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusedIdentifier];
    
    if((!self.empty_name)&&(!self.empty_score)) //The user both types name and plays games only for the 1st time:
    {
        self.addName = false;
        self.addScore = false;
        
        if(indexPath.row <= [self.stored_data count])
           {
            //The following checking is applied for the case where the user plays games without inputing new names for the registration:
            
            [self Check_stored_score_LastObject];
            if([self.stored_data count]< [self.stored_score count])
            {
                int difference = [self.stored_score count]- [self.stored_data count];
                for(int i =0; i<difference; i++)
                {
                    [self.stored_data insertObject:[NSString stringWithFormat:@"Anonymous"] atIndex:i];
                }
                

                self.addName = true;
                self.addScore = false;
                [self Data_Transmit_to_Local_File];
            }
            else if([self.stored_data count] > [self.stored_score count])
            {
                int difference = [self.stored_data count] -[self.stored_score count];
                for(int i =0; i<difference; i++)
                {
                    [self.stored_score insertObject:[NSString stringWithFormat:@"0"] atIndex:i];
                }
                
                self.addName = false;
                self.addScore = true;
                [self Data_Transmit_to_Local_File];
            }
            
            [self Check_stored_score_LastObject];
            [self CheckCell];
            BOOL con1 = false;
            BOOL con2 = false;
            if(([self.stored_data count] >0)&&([self.stored_score count]>0))
            {
                if((indexPath.row<= [self.stored_data count]-1)&&[self.stored_data objectAtIndex:indexPath.row]!= NULL)
                {
                    self.cell.myname.text = [self.stored_data objectAtIndex:indexPath.row];
                    con1 = true;
                }
                if((indexPath.row<= [self.stored_score count]-1)&&[self.stored_score objectAtIndex:indexPath.row]!=NULL)
                {
                    self.cell.myscore.text = [self.stored_score objectAtIndex:indexPath.row];
                    con2 = true;
                }
                if(!con1&&!con2)
                {
                    self.cell.label2.text = nil;
                    self.cell.label1.text = nil;
                }
            }
            else
            {
                self.cell.label2.text = nil;
                self.cell.label1.text = nil;
            }
        }
    }
    else if((self.empty_score)&&(self.empty_name)) //both name and data are not available for the 1st time
    {
        self.addScore = false;
        self.addName = false;
        [self CheckCell];
        _cell.myname.text = nil;
        _cell.myscore.text = nil;
    }
    else if((!self.empty_name)&&(self.empty_score)) //User types name but doesn't play game for the 1st time
    {
        
        self.addName = false;
        self.addScore = true;
        
        if(indexPath.row <= [self.stored_data count])
        {
            //Update stored_score:
            if(!self.stored_score)
                self.stored_score = [[NSMutableArray alloc]init];
            [self.stored_score addObject:[NSString stringWithFormat:@"0"]];
            [self Data_Transmit_to_Local_File];
            [self CheckCell];
            BOOL con1 = false;
            BOOL con2 = false;
            if(([self.stored_data count] >0)&&([self.stored_score count]>0))
            {
                if((indexPath.row<= [self.stored_data count]-1)&&[self.stored_data objectAtIndex:indexPath.row]!= NULL)
                {
                    self.cell.myname.text = [self.stored_data objectAtIndex:indexPath.row];
                    con1 = true;
                }
                if((indexPath.row<= [self.stored_score count]-1)&&[self.stored_score objectAtIndex:indexPath.row]!=NULL)
                {
                    self.cell.myscore.text = [self.stored_score objectAtIndex:indexPath.row];
                    con2 = true;
                }
                if(!con1&&!con2)
                {
                    self.cell.label2.text = nil;
                    self.cell.label1.text = nil;
                }
            }
            else
            {
                self.cell.label2.text = nil;
                self.cell.label1.text = nil;
            }
            
        }
    }
    else if((self.empty_name)&&(!self.empty_score)) //User doesn't type name but played game for the 1st time
    {
        self.addScore = false;
        self.addName = true;
        [self Check_stored_score_LastObject];
        if(indexPath.row <= [self.stored_score count])//&&(indexPath.row>0))
        {
            //Update stored_data:
            if(!self.stored_data)
                self.stored_data = [[NSMutableArray alloc]init];
            [self.stored_data addObject:[NSString stringWithFormat:@"Anonymous"]];
            [self Data_Transmit_to_Local_File];
            [self CheckCell];
            BOOL con1 = false;
            BOOL con2 = false;
            if(([self.stored_data count] >0)&&([self.stored_score count]>0))
            {
                if((indexPath.row<= [self.stored_data count]-1)&&[self.stored_data objectAtIndex:indexPath.row]!= NULL)
                {
                    self.cell.myname.text = [self.stored_data objectAtIndex:indexPath.row];
                    con1 = true;
                }
                if((indexPath.row<= [self.stored_score count]-1)&&[self.stored_score objectAtIndex:indexPath.row]!=NULL)
                {
                    self.cell.myscore.text = [self.stored_score objectAtIndex:indexPath.row];
                    con2 = true;
                }
                if(!con1&&!con2)
                {
                    self.cell.label2.text = nil;
                    self.cell.label1.text = nil;
                }
            }
            else
            {
                self.cell.label2.text = nil;
                self.cell.label1.text = nil;
            }
            
        }
    }
    
    return _cell;
}


-(void)CheckCell
{
    if(self.cell.myscore == nil && self.cell.myname == nil&& self.cell.label1 == nil&&self.cell.label2 == nil)
    {
        AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        self.cell.label1 = [[UILabel alloc]initWithFrame:CGRectMake(delegate.WIDTH*0.05, delegate.WIDTH*0.15, delegate.WIDTH*0.2, delegate.WIDTH*0.1)];
        self.cell.label2 = [[UILabel alloc]initWithFrame:CGRectMake(delegate.WIDTH*0.75, delegate.WIDTH*0.15, delegate.WIDTH*0.15, delegate.WIDTH*0.1)];
        
        self.cell.myname = [[UILabel alloc]initWithFrame:CGRectMake(delegate.WIDTH*0.3, delegate.WIDTH*0.15, delegate.WIDTH*0.4, delegate.WIDTH*0.1)];
        
        self.cell.myscore = [[UILabel alloc]initWithFrame:CGRectMake(delegate.WIDTH*0.9, delegate.WIDTH*0.15, delegate.WIDTH*0.1, delegate.WIDTH*0.1)];
        
        self.cell.label1.text = @"Name:";
        self.cell.label2.text = @"Score";
        self.cell.label1.font = [UIFont systemFontOfSize:15];
        self.cell.label2.font = [UIFont systemFontOfSize:15];
        self.cell.myname.font = [UIFont systemFontOfSize:15];
        self.cell.myscore.font = [UIFont systemFontOfSize:15];
        
        [self.cell addSubview:self.cell.label1];
        [self.cell addSubview:self.cell.label2];
        [self.cell addSubview:self.cell.myname];
        [self.cell addSubview:self.cell.myscore];
    }
    
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        if((self.empty_name)&&(self.empty_score))//If user neither types name nor plays game:
                return;
        else
            {
                if((int)[self.stored_data count]> 0 &&(int)[self.stored_score count]>0 )//&&(int)[self.preset_row count]>0)
                {
                [self Delete_Name_And_Score_At_indexPath:indexPath In:tableView];
                [self Update_current_data];
                [self.tableView reloadData];
                }
            }
    }
}

-(void)Delete_Name_And_Score_At_indexPath:(NSIndexPath *)indexPath In:(UITableView*)tableView
{
    // Delete the row from the data source
    [self.preset_row removeObjectAtIndex:indexPath.row];
    [self.stored_data removeObjectAtIndex:indexPath.row-1];
    [self.stored_score removeObjectAtIndex:indexPath.row-1];
    if([self.preset_row count]>0)
        [self.preset_row removeObjectAtIndex:0];
    
    [self.tableView beginUpdates];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.preset_row insertObject:@"1" atIndex:0];
    [self.tableView endUpdates];

}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return NO;
}

-(void)Data_Transmit_to_Local_File
{
    if(self.addName)
    {
        //Transmit name:
        NSString* filePath = [self Find_Name_Path];
        
        NSFileManager* fileManager = [NSFileManager defaultManager];
        // Transfer elements of self.name_data into NSString type data:
        NSMutableString* nameInfoString = [[NSMutableString alloc] init];
        for (NSString* name in self.stored_data)
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
    if(self.addScore)
    {
        
        //Transmit score:
        NSString* filePath2 = [self Find_Score_Path];
        NSFileManager* fileManager = [NSFileManager defaultManager];
        NSMutableString* scoreInfoString = [[NSMutableString alloc] init];
        for (NSString* score in self.stored_score)
        {
            [scoreInfoString appendFormat:@"%@",score];
            [scoreInfoString appendFormat:@","];
        }
        
        NSData* scoreData = [scoreInfoString dataUsingEncoding:NSUTF8StringEncoding];//Returns an NSData object containing a representation of the receiver encoded using a given encoding.
        
        if(![fileManager createFileAtPath:filePath2 contents:scoreData attributes:nil])
        {
            printf("Fail to create file to store data");
            return;
        }
    }
}

-(void)Update_current_data
{
    //Update data into the local file:
    NSFileManager* manager = [NSFileManager defaultManager];
    NSError* error;
    [manager removeItemAtPath:self.FilePath error:&error];
    NSMutableString* new_nameInfoString = [[NSMutableString alloc] init];
    for (NSString* name in self.stored_data)
    {
        [new_nameInfoString appendFormat:@"%@", name];
        [new_nameInfoString appendFormat:@","];
    }
    
    NSMutableString* new_scoreInfoString = [[NSMutableString alloc] init];
    for (NSString* score in self.stored_score)
    {
        [new_scoreInfoString appendFormat:@"%@", score];
        [new_scoreInfoString appendFormat:@","];
    }
    
    //Encode productInfoString, and save it in our new file:
    NSData* nameData = [new_nameInfoString dataUsingEncoding:NSUTF8StringEncoding];
    if(![manager createFileAtPath:_FilePath contents:nameData attributes:nil])
    {
        printf("Fail to create file to store data");
        return;
    }
    
    NSData* scoreData = [new_scoreInfoString dataUsingEncoding:NSUTF8StringEncoding];
    if(![manager createFileAtPath:self.FilePath2 contents:scoreData attributes:nil])
    {
        printf("Fail to create file to store data");
        return;
    }
    
}


-(NSString*) Find_Name_Path
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

-(NSString*)Find_Score_Path
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);//Creates a list of directory search paths.
    NSString* documentsDirPath = [paths objectAtIndex:0];//Obtain the path for Documents directory.
    NSString* DirPath = [documentsDirPath stringByAppendingPathComponent:@"Score2"];//Create an new path under "Document" directory.
    NSString* FilePath = [DirPath stringByAppendingPathComponent:@"score2.txt"];//Create a path for the text file for the saving data under "Document" directory.
    
    NSLog(@"%@",FilePath);
    
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

@end
