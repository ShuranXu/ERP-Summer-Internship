
#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>
#import "AppDelegate.h"


@class GKLeaderboard, GKAchievement, GKPlayer;

@interface GameCenterManager : NSObject

//This property must be attomic to ensure that the cache is always in a viable state...
@property (retain) NSMutableDictionary* earnedAchievementCache;


+ (BOOL) isGameCenterAvailable;

- (void) authenticateLocalUser;
- (void) reportScore: (int64_t) score forCategory: (NSString*) category;
- (void) reloadHighScoresForIdentifier: (NSString*) identifier;

- (void) submitAchievement: (NSString*) identifier percentComplete: (double)BestScore;
- (void) mapPlayerIDtoPlayer: (NSString*) playerID;
- (void) processGameCenterAuth: (NSError*) error;
- (void) scoreReported: (NSError*) error;
- (void) reloadScoresComplete: (GKLeaderboard*) leaderBoard error: (NSError*) error;
- (void) achievementSubmitted: (GKAchievement*) ach error:(NSError*) error;
- (void) mappedPlayerIDToPlayer: (GKPlayer*) player error: (NSError*) error;
@end
