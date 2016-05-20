
#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#import "Game.h"
#import "Board.h"
#import "Player.h"
#import "TileLocation.h"
#import <OCMock/OCMock.h>

@interface GameTest : XCTestCase {
    NSString* mark1;
    NSString* mark2;
    Player* firstPlayer;
    Player* secondPlayer;
    id board;
}

@end

@implementation GameTest

- (void)setUp {
    [super setUp];
    firstPlayer = [[Player alloc]init];
    secondPlayer = [[Player alloc]init];
    board = OCMClassMock([Board class]);
    
}


- (void)testThatGameContinuesWhenNotDrawOrVictory {
    
    OCMStub([board numberOfMarkedTiles]).andReturn(4);

    Game* game = [[Game alloc]initWithGameBoard:board firstPlayer:firstPlayer secondPlayer:secondPlayer];
    
    GameStatus status = [game playMove:[TileLocation locationWithRow:1 column:1]];
    
    assertThatLong(status, equalToLong(NEXT_MOVE));
}

- (void)testThatGameIsWon {
    
    TileLocation* tileLocation = [TileLocation locationWithRow:2 column:0];
    NSArray* markedTiles = @[tileLocation,
                             [TileLocation locationWithRow:2 column:1],
                             [TileLocation locationWithRow:2 column:2]
                            ];
    OCMStub([board numberOfMarkedTiles]).andReturn(7);
    OCMStub([board checkForThreeContinuousMarks]).andReturn(markedTiles);
    
    Game* game = [[Game alloc]initWithGameBoard:board firstPlayer:firstPlayer secondPlayer:secondPlayer];
    
    GameStatus status = [game playMove:tileLocation];
    
    assertThatLong(status, equalToLong(PLAYER_1_WINS));
}

- (void)testThatGameIsDrawn {
    
    OCMStub([board numberOfMarkedTiles]).andReturn(9);
    OCMStub([board checkForThreeContinuousMarks]).andReturn(nil);
    Game* game = [[Game alloc]initWithGameBoard:board firstPlayer:firstPlayer secondPlayer:secondPlayer];
    
    GameStatus status = [game playMove:[TileLocation locationWithRow:2 column:2]];
    
    assertThatLong(status, equalToLong(DRAW));
}

- (void)testThatGameIsWonWhenBoardIsFull {
    
    OCMStub([board numberOfMarkedTiles]).andReturn(9);
    TileLocation* tileLocation = [TileLocation locationWithRow:2 column:0];
    NSArray* markedTiles = @[tileLocation,
                             [TileLocation locationWithRow:2 column:1],
                             [TileLocation locationWithRow:2 column:2]
                             ];
    OCMStub([board checkForThreeContinuousMarks]).andReturn(markedTiles);
    Game* game = [[Game alloc]initWithGameBoard:board firstPlayer:firstPlayer secondPlayer:secondPlayer];
    
    GameStatus status = [game playMove:[TileLocation locationWithRow:2 column:2]];
    
    assertThatLong(status, equalToLong(PLAYER_1_WINS));
}

@end
