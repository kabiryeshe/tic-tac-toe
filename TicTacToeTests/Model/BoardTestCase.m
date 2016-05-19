
#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#import "Board.h"
#import "TileLocation.h"


@interface BoardTestCase : XCTestCase {
    NSString *mark1;
    NSString *mark2;
    NSObject *empty;    
}

@end

@implementation BoardTestCase

- (void)setUp {
    [super setUp];
    
    mark1 = @"0";
    mark2 = @"X";
}


- (void)testThatAnEmptyBoardIsReturend {
    Board* board = [Board emptyBoard];
    
    assertThatLong([board numberOfMarkedTiles], equalToInt(0));
    assertThatBool([board isTileMarked:[TileLocation locationWithRow:0 column:0]], equalToInt(false));
}


- (void)testThatItMarksTileAtGivenLocation {
    
    
    Board* board = [[Board alloc]initWithTiles:[@[
                                                 [@[mark1, mark2, mark1] mutableCopy],
                                                 [@[mark2, EMPTY, mark2] mutableCopy],
                                                 [@[mark1, mark1, mark2] mutableCopy]
                                                 ]mutableCopy]];
    NSInteger markingsBefore = board.numberOfMarkedTiles;
    assertThatLong(board.numberOfMarkedTiles, equalToLong(8));
    TileLocation* location = [TileLocation locationWithRow:1 column:1];
    [board markTile:location withMark:mark1];
    
    assertThatLong(board.numberOfMarkedTiles, equalToLong(markingsBefore + 1));
    assertThatBool([board isTileMarked:location], equalToInt(true));
}


- (void)testThatItReturnsRowWhenItsAllMarkingsAreSame {
    
    Board* board = [[Board alloc]initWithTiles:@[
                                @[mark1, mark2, mark1],
                                @[mark2, mark2, mark2],
                                @[mark1, mark1, mark2]
                                ]];
    NSArray* markLocations = [board checkForThreeContinuousMarks];
    
    NSArray* expectedMarkings = @[[TileLocation locationWithRow:1 column:0],
                                 [TileLocation locationWithRow:1 column:1],
                                 [TileLocation locationWithRow:1 column:2]];
    
    assertThat(markLocations, containsIn(expectedMarkings));

}


- (void)testThatItReturnsColumnWhenItsAllMarkingsAreSame {
    
    Board* board = [[Board alloc]initWithTiles:@[
                                                 @[mark1, mark2, mark1],
                                                 @[mark2, mark2, mark1],
                                                 @[mark1, mark2, mark2]
                                                 ]];
    
    NSArray* markLocations = [board checkForThreeContinuousMarks];
    
    NSArray* expectedMarkings = @[[TileLocation locationWithRow:0 column:1],
                                  [TileLocation locationWithRow:1 column:1],
                                  [TileLocation locationWithRow:2 column:1]];
    assertThat(markLocations, containsIn(expectedMarkings));
}


- (void)testThatItReturnsLeftDiagonalWhenItsAllMarkingsAreSame {
    
    Board* board = [[Board alloc]initWithTiles:@[
                                                 @[mark1, mark2, mark1],
                                                 @[mark2, mark1, mark2],
                                                 @[mark2, mark2, mark1]
                                                 ]];
    
    NSArray* markLocations = [board checkForThreeContinuousMarks];
    
    NSArray* expectedMarkings = @[[TileLocation locationWithRow:0 column:0],
                                  [TileLocation locationWithRow:1 column:1],
                                  [TileLocation locationWithRow:2 column:2]];
    assertThat(markLocations, containsIn(expectedMarkings));
}

- (void)testThatItReturnsRightDiagonalWhenItsAllMarkingsAreSame {
    
    Board* board = [[Board alloc]initWithTiles:@[
                                                 @[mark1, mark2, mark1],
                                                 @[mark2, mark1, mark2],
                                                 @[mark1, mark2, mark2]
                                                 ]];
    
    NSArray* markLocations = [board checkForThreeContinuousMarks];
    
    NSArray* expectedMarkings = @[[TileLocation locationWithRow:0 column:2],
                                  [TileLocation locationWithRow:1 column:1],
                                  [TileLocation locationWithRow:2 column:0]];
    assertThat(markLocations, containsIn(expectedMarkings));
}


@end
