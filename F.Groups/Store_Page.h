//
//  Store_Page.h
//  One-minute APP
//
//  Created by Shuran Xu on 2015-05-26.
//  Copyright (c) 2015 Impact Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeaderBoard.h"
#import "AppDelegate.h"
#import "LDB2.h"
#import <GameKit/GameKit.h>
#import "GameCenterManager.h"
#import "AppSpecificValues.h"


@class LeaderBoard;
@class LDB2;
@class GameCenterManager;



@interface Store_Page : UIViewController <UIAlertViewDelegate,GKAchievementViewControllerDelegate,GKLeaderboardViewControllerDelegate>

@property(nonatomic,strong) UIButton* simple;
@property(nonatomic,strong) UIButton* hard;
@property(nonatomic,strong) UIButton* gamecenter;
@property(nonatomic,strong) LeaderBoard* view1;
@property(nonatomic,strong) LDB2* view2;
@property(nonatomic,strong) UIButton* quit;



@property(nonatomic,strong) GameCenterManager* game_manager;
@property(nonatomic,strong) GKAchievementViewController* ach;
@property(nonatomic,strong) NSString* AchievementID;
@property(nonatomic) int percentComplete;
@property(nonatomic) int currentScore;
@property(nonatomic,strong) NSString* currentLeaderBoard;
@property(nonatomic,strong) GKLeaderboardViewController* Leaderboard_View;
@property(nonatomic,strong) NSMutableDictionary* achievementImages;


@property(nonatomic) CGFloat WIDTH;
@property(nonatomic) CGFloat HEIGHT;
@property(nonatomic) CGFloat GAP_X;

@property(nonatomic,strong) NSTimer* timer;


-(void)show_gcView;
@end
