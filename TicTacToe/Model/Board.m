
#import "Board.h"
#import "TileLocation.h"
#import "Player.h"

static const NSInteger BOARD_SIZE = 3;
NSString * const EMPTY = @"empty";

@interface Board ()

@property(nonatomic, strong) NSMutableArray* tiles;
@property(nonatomic) NSInteger numberOfMarkedTiles;

@end

@implementation Board

- (instancetype)initWithTiles:(NSMutableArray *)tiles {
    self = [super init];
    if(self) {
        _tiles = tiles;
        for(NSMutableArray* row in tiles) {
            for(NSObject *mark in row) {
                if(EMPTY != mark ) {
                    _numberOfMarkedTiles++;
                }
            }
        }
    }
    return self;
}

- (void)reset {
    
}


- (void)markTile:(TileLocation *)location withMark:(NSObject *)mark {

    self.tiles[location.row][location.column] = mark;
    self.numberOfMarkedTiles++;
}


- (NSArray *)checkForThreeContinuousMarks {
    
    NSArray *locations;
    for(NSInteger i = 0; i< BOARD_SIZE; i++) {
        
        locations = [self checkForSameMarkInRow:i];
        if(locations) {
            return locations;
        }

        locations = [self checkForSameMarkInColumn:i];
        
        if(locations) {
            return locations;
        }
    }
    
    if(!locations) {
        return [self checkForDiagonal];
    }
    
    return locations;
}

- (NSArray *)checkForSameMarkInRow:(NSInteger)row {
    
    NSMutableArray *locations;
    
    if ( EMPTY != self.tiles[row][0] && self.tiles[row][0] == self.tiles[row][1] && self.tiles[row][1] == self.tiles[row][2]) {
        locations = [[NSMutableArray alloc]initWithCapacity:3];
        for(NSInteger j = 0; j< BOARD_SIZE; j++) {
            [locations addObject:[TileLocation locationWithRow:row column:j]];
        }
    }
    
    return locations;
}

- (NSArray *)checkForSameMarkInColumn:(NSInteger)col {
    
    NSMutableArray *locations;
    
    if (EMPTY != self.tiles[0][col] && self.tiles[0][col] == self.tiles[1][col] && self.tiles[1][col] == self.tiles[2][col]) {
        locations = [[NSMutableArray alloc]initWithCapacity:3];
        for(NSInteger i = 0; i< BOARD_SIZE; i++) {
            [locations addObject:[TileLocation locationWithRow:i column:col]];
        }
    }
    
    return locations;
}

- (NSArray *)checkForDiagonal{
    
    NSMutableArray *locations;
    
    if ( EMPTY != self.tiles[0][0] && self.tiles[0][0] == self.tiles[1][1] && self.tiles[1][1] == self.tiles[2][2]) {
        locations = [[NSMutableArray alloc]initWithCapacity:3];
        for(NSInteger i = 0; i< BOARD_SIZE; i++) {
            [locations addObject:[TileLocation locationWithRow:i column:i]];
        }
    }
    
    
    if (nil == locations && EMPTY != self.tiles[0][2] && self.tiles[0][2] == self.tiles[1][1] && self.tiles[1][1] == self.tiles[2][0]) {
        locations = [[NSMutableArray alloc]initWithCapacity:3];
        for(NSInteger i = 0; i< BOARD_SIZE; i++) {
            [locations addObject:[TileLocation locationWithRow:i column: BOARD_SIZE-i-1]];
        }
    }
    
    return locations;
}



@end
