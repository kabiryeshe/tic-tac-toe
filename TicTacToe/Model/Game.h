#import <Foundation/Foundation.h>

@class TileLocation, Player, Board;

typedef enum NSInteger {
    NEXT_MOVE = 0,
    PLAYER_1_WINS,
    PLAYER_2_WINS,
    DRAW,
}GameStatus;


@interface Game : NSObject

- (instancetype) initWithGameBoard:(Board *)board
                       firstPlayer:(Player *)player1
                      secondPlayer:(Player *)player2;

- (void)startGame;
- (GameStatus)playMove:(TileLocation *)tileLocation;

@end
