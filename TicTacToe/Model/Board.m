
#import "Board.h"
#import "TileLocation.h"
#import "Player.h"

static const NSInteger BOARD_SIZE = 3;

@interface Board ()

@property(nonatomic, strong) NSArray* tiles;

@end

@implementation Board

- (instancetype)init {
    
    self = [super init];
    return self;
}

- (instancetype)initWithTiles:(NSArray *)tiles {
    self = [super init];
    if(self) {
        _tiles = tiles;
    }
    return self;
}

- (void)reset {
    
}


- (void)markTile:(TileLocation *)location forPlayer:(Player *)player {
    self.tiles[location.row][location.column] = player;
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
    
    if ( self.tiles[row][0] == self.tiles[row][1] && self.tiles[row][1] == self.tiles[row][2]) {
        locations = [[NSMutableArray alloc]initWithCapacity:3];
        for(NSInteger j = 0; j< BOARD_SIZE; j++) {
            [locations addObject:[TileLocation locationWithRow:row column:j]];
        }
    }
    
    return locations;
}

- (NSArray *)checkForSameMarkInColumn:(NSInteger)col {
    
    NSMutableArray *locations;
    
    if ( self.tiles[0][col] == self.tiles[1][col] && self.tiles[1][col] == self.tiles[2][col]) {
        locations = [[NSMutableArray alloc]initWithCapacity:3];
        for(NSInteger i = 0; i< BOARD_SIZE; i++) {
            [locations addObject:[TileLocation locationWithRow:i column:col]];
        }
    }
    
    return locations;
}

- (NSArray *)checkForDiagonal{
    
    NSMutableArray *locations;
    
    if ( self.tiles[0][0] == self.tiles[1][1] && self.tiles[1][1] == self.tiles[2][2]) {
        locations = [[NSMutableArray alloc]initWithCapacity:3];
        for(NSInteger i = 0; i< BOARD_SIZE; i++) {
            [locations addObject:[TileLocation locationWithRow:i column:i]];
        }
    }
    
    
    if (nil == locations && self.tiles[0][2] == self.tiles[1][1] && self.tiles[1][1] == self.tiles[2][0]) {
        locations = [[NSMutableArray alloc]initWithCapacity:3];
        for(NSInteger i = 0; i< BOARD_SIZE; i++) {
            [locations addObject:[TileLocation locationWithRow:i column: BOARD_SIZE-i-1]];
        }
    }
    
    return locations;
}



@end
