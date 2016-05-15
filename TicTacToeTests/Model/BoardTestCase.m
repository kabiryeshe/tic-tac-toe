
#import <XCTest/XCTest.h>
#import "Board.h"

@interface BoardTestCase : XCTestCase

@end

@implementation BoardTestCase

- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testShouldReturnRowWithSameMarking {
    
    NSString *mark1 = @"O";
    NSString *mark2 = @"X";
    Board* board = [[Board alloc]initWithTiles:@[
                                @[mark1, mark2, mark1],
                                @[mark2, mark2, mark2],
                                @[mark1, mark1, mark2]
                                ]];
    NSArray *markLocations = [board checkForThreeContinuousMarks];
    XCTAssertNotNil(markLocations);

}
@end
