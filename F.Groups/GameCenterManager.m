
#import "GameCenterManager.h"


@implementation GameCenterManager
@synthesize earnedAchievementCache;


- (id) init
{
	self = [super init];
	if(self!= NULL)
	{
		earnedAchievementCache= NULL;
	}
	return self;
}

+ (BOOL) isGameCenterAvailable
{
	// check for presence of GKLocalPlayer API
	Class gcClass = (NSClassFromString(@"GKLocalPlayer")); //Obtains a class by name.
	
	// check if the device is running iOS 4.1 or later
	NSString *reqSysVer = @"4.1";
	NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
	BOOL osVersionSupported = ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending);
	
	return (gcClass && osVersionSupported);
}


- (void) authenticateLocalUser
{
	if([GKLocalPlayer localPlayer].authenticated == NO)
	{
        [[GKLocalPlayer localPlayer] authenticateWithCompletionHandler:^(NSError *error)
         {
             AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
             delegate.finished = true;

         }];

    /* When this method is called, it creates a new background task to handle the request. The method then returns control to your game. Later, when the task is complete, Game Kit calls your completion handler. The completion handler is always called on the main thread.

          ** If there is not an authenticated player on the device when your game calls this method, Game Kit displays a user interface that allows the player to sign in with their credentials (or to create a new account if he or she has never used Game Center).
     
         If your game moves into the background, Game Kit automatically authenticates the player again whenever your game moves back to the foreground. Game Kit calls your same completion handler each time it authenticates the local player.
         */
    }
}


- (void) reloadHighScoresForIdentifier: (NSString*)identifier
{
    GKLeaderboard* leaderBoard= [[GKLeaderboard alloc] init];
	leaderBoard.identifier= identifier;
    leaderBoard.playerScope = GKLeaderboardPlayerScopeGlobal;
	leaderBoard.timeScope= GKLeaderboardTimeScopeAllTime;
	leaderBoard.range= NSMakeRange(1, 100);
    [leaderBoard loadScoresWithCompletionHandler:nil];
}

- (void) reportScore: (int64_t) score forCategory: (NSString*) category 
{
	GKScore *scoreReporter = [[GKScore alloc] initWithCategory:category];
	scoreReporter.value = score;
	[scoreReporter reportScoreWithCompletionHandler: ^(NSError *error) 
	 {
         if(error == NULL)
             [self reloadHighScoresForIdentifier:category];
     }];
}


- (void) mapPlayerIDtoPlayer: (NSString*) playerID
{
	[GKPlayer loadPlayersForIdentifiers: [NSArray arrayWithObject: playerID] withCompletionHandler:^(NSArray *playerArray, NSError *error)
	{
		GKPlayer* player= NULL;
		for (GKPlayer* tempPlayer in playerArray)
		{
			if([tempPlayer.playerID isEqualToString: playerID])
			{
				player= tempPlayer;
				break;
			}
		}
		[self performSelector:@selector(mappedPlayerIDToPlayer:error:)];
	}];
}

- (void) submitAchievement: (NSString*) identifier percentComplete: (double) percentComplete
{
    /* GameCenter checks for duplicate achievements when the achievement is submitted, but if you only want to report new achievements to the user, then you need to check if it's been earned before you submit.
     
     Otherwise you'll end up with a race condition between loadAchievementsWithCompletionHandler
     and reportAchievementWithCompletionHandler. To avoid this, we fetch the current achievement list once,
     then cache it and keep it updated with any new achievements.*/
    
    if(self.earnedAchievementCache == NULL)
    {
        [GKAchievement loadAchievementsWithCompletionHandler: ^(NSArray *scores, NSError *error)
         {
             if(error == NULL)
             {
                 NSMutableDictionary* tempCache= [NSMutableDictionary dictionaryWithCapacity: [scores count]];
                 for (GKAchievement* score in scores)
                 {
                     [tempCache setObject: score forKey: score.identifier];
                 }
                 self.earnedAchievementCache= tempCache;
                 [self submitAchievement: identifier percentComplete: percentComplete];
             }
             else
             {
                 NSLog(@"Error: %@",[error description]);
             }
             
         }];
    }
    else
    {
        //Search the list for the ID we're using...
        GKAchievement* achievement= [self.earnedAchievementCache objectForKey: identifier];
        if(achievement != NULL)
        {
            if((achievement.percentComplete >= 100.0) || (achievement.percentComplete >= percentComplete))
            {
                //Achievement has already been earned so we're done.
                achievement= NULL;
            }
            achievement.percentComplete= percentComplete;
        }
        else
        {
            achievement= [[GKAchievement alloc] initWithIdentifier: identifier];
            achievement.percentComplete= percentComplete;
            //Add achievement to achievement cache...
            [self.earnedAchievementCache setObject: achievement forKey: achievement.identifier];
        }
        if(achievement!= NULL)
        {
            //Submit the Achievement...
            [achievement reportAchievementWithCompletionHandler:nil];
        }
    }
}


@end
