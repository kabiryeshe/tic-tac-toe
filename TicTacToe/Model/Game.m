#import "Game.h"
#import "Board.h"
#import "Player.h"
#import "TileLocation.h"

@interface Game ()

@property(nonatomic, strong) Board *board;
@property(nonatomic, strong) Player *player1;
@property(nonatomic, strong) Player *player2;
@property(nonatomic, strong) Player *nextTurn;
@property(nonatomic, strong) Player* currentPlayer;
@property(nonatomic) NSInteger turnsPlayed;


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
        _turnsPlayed = 0;
    }
    
    return self;
}

- (void)startGame {
    
    self.turnsPlayed = 0;
    self.currentPlayer = self.player1;
    self.nextTurn = self.player2;
    [self.board reset];
}


- (GameStatus)playMove:(TileLocation *)tileLocation {
    
    [self.board markTile:tileLocation forPlayer:self.currentPlayer];
    self.turnsPlayed += 1;
    GameStatus gameStatus = [self checkForGameStatus];
    return gameStatus;
}


- (GameStatus)checkForGameStatus {
    
    if(self.turnsPlayed < 5) {
        return NEXT_MOVE;
    }
    
    [self.board checkForThreeContinuousMarks];
    return DRAW;
}

//Property accessors

- (Board *)board {
    if(!_board) {
        _board = [[Board alloc]init];
    }
    return _board;
}

@end
