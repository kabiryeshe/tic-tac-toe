#import "TileLocation.h"

@implementation TileLocation

- (instancetype)initWithRow:(NSInteger)row column:(NSInteger)column {
    self = [super init];
    if(self) {
        _row = row;
        _column = column;
    }
    return self;
}

+ (instancetype) locationWithRow:(NSInteger)row column:(NSInteger)column {
    
    return [[TileLocation alloc]initWithRow:row column:column];
}

@end
