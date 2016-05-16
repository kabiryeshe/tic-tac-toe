#import "Game.h"
#import "Board.h"
#import "Player.h"
#import "TileLocation.h"

@interface Game ()

@property(nonatomic, strong) Board *board;
@property(nonatomic, strong) Player *player1;
@property(nonatomic, strong) Player *player2;
@property(nonatomic, strong) Player* currentPlayer;

@end

@implementation Game

- (instancetype) initWithGameBoard:(Board *)board
                       firstPlayer:(Player *)player1
                      secondPlayer:(Player *)player2 {
    
    self = [super init];
    if (self) {
        _board = board;
        _player1 = player1;
        _player2 = player2;
        _currentPlayer = player1;
    }
    
    return self;
}

- (void)startGame {
    
    self.currentPlayer = self.player1;
    [self.board reset];
}


- (GameStatus)playMove:(TileLocation *)tileLocation {
    
    [self.board markTile:tileLocation withMark:self.currentPlayer];

    GameStatus gameStatus = [self checkForGameStatus];
    self.currentPlayer = [self nextPlayer];
    return gameStatus;
}


- (GameStatus)checkForGameStatus {
    
    if(self.board.numberOfMarkedTiles < 5) {
        return NEXT_MOVE;
    }
    if(self.board.numberOfMarkedTiles == 9) {
        return DRAW;
    }
    NSArray *tileLocations = [self.board checkForThreeContinuousMarks];
    if(tileLocations && [tileLocations count] == 3) {
        return self.currentPlayer == self.player1 ? PLAYER_1_WINS : PLAYER_2_WINS;
        
    }
    return NEXT_MOVE;
}

- (Player *)nextPlayer {
    return self.currentPlayer == self.player1 ? self.player2 : self.player1;
}

//Property accessors

- (Board *)board {
    if(!_board) {
        _board = [[Board alloc]init];
    }
    return _board;
}

@end
