//
//  GameTest.m
//  TicTacToe
//
//  Created by Tushar on 15/05/16.
//  Copyright © 2016 thoughtworks. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#import "Game.h"
#import "Board.h"
#import "Player.h"
#import "TileLocation.h"

@interface GameTest : XCTestCase {
    NSString* mark1;
    NSString* mark2;
    Player* firstPlayer;
    Player* secondPlayer;
    NSObject *empty;
}

@end

@implementation GameTest

- (void)setUp {
    [super setUp];
    firstPlayer = [[Player alloc]init];
    secondPlayer = [[Player alloc]init];
}


- (void)testThatGameContinuesWhenNoDrawOrVictory {
    
    Board* board = [[Board alloc]initWithTiles:[@[
                                                 [@[firstPlayer, firstPlayer, secondPlayer] mutableCopy],
                                                 [@[EMPTY, EMPTY, EMPTY] mutableCopy],
                                                 [@[EMPTY, EMPTY, EMPTY] mutableCopy]
                                                 ] mutableCopy] ];

    Game* game = [[Game alloc]initWithGameBoard:board firstPlayer:firstPlayer secondPlayer:secondPlayer];
    
    GameStatus status = [game playMove:[TileLocation locationWithRow:1 column:1]];
    
    assertThatLong(status, equalToLong(NEXT_MOVE));
}

- (void)testThatGameIsWon {
    
    Board* board = [[Board alloc]initWithTiles:[@[
                                                  [@[firstPlayer, firstPlayer, secondPlayer] mutableCopy],
                                                  [@[firstPlayer, EMPTY, EMPTY] mutableCopy],
                                                  [@[EMPTY, EMPTY, EMPTY] mutableCopy]
                                                  ] mutableCopy] ];
    
    Game* game = [[Game alloc]initWithGameBoard:board firstPlayer:firstPlayer secondPlayer:secondPlayer];
    
    GameStatus status = [game playMove:[TileLocation locationWithRow:2 column:0]];
    
    assertThatLong(status, equalToLong(PLAYER_1_WINS));
}

- (void)testThatGameIsDrawn {
    
    Board* board = [[Board alloc]initWithTiles:[@[
                                                  [@[secondPlayer, firstPlayer, secondPlayer] mutableCopy],
                                                  [@[firstPlayer, firstPlayer, secondPlayer] mutableCopy],
                                                  [@[secondPlayer, secondPlayer, EMPTY] mutableCopy]
                                                  ] mutableCopy] ];
    
    Game* game = [[Game alloc]initWithGameBoard:board firstPlayer:firstPlayer secondPlayer:secondPlayer];
    
    GameStatus status = [game playMove:[TileLocation locationWithRow:2 column:2]];
    
    assertThatLong(status, equalToLong(DRAW));
}


@end
