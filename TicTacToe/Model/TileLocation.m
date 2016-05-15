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


- (BOOL)isEqual:(id)object {
    TileLocation *anotherLocation = object;
    return (self == anotherLocation) || (self.row == anotherLocation.row && self.column == anotherLocation.column);
}

- (NSUInteger)hash{
    NSInteger prime = 31;
    NSInteger result = 1;
    result = prime * result + self.row;
    result = prime * result + self.column;
    return result;
}

@end
