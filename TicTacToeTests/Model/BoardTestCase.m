
#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#import "Board.h"
#import "TileLocation.h"


@interface BoardTestCase : XCTestCase {
    NSString *mark1;
    NSString *mark2;
}

@end

@implementation BoardTestCase

- (void)setUp {
    [super setUp];
    
    mark1 = @"0";
    mark2 = @"X";
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
