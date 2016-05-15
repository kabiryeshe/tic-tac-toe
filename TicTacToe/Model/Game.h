#import <Foundation/Foundation.h>

@class TileLocation;

typedef enum NSInteger {
    NEXT_MOVE,
    PLAYER_1_WINS,
    PLAYER_2_WINS,
    DRAW,
    FINISH,
}GameStatus;



@interface Game : NSObject

- (void)startGame;
- (GameStatus)playMove:(TileLocation *)tileLocation;

@end
