
#import "Player.h"

@implementation Player

- (instancetype)initWithName:(NSString *)name markSymbol:(NSString *)symbol{
    self = [super init];
    if(self) {
        _name = name;
        _markSymbol = symbol;
    }
    return self;
}

@end
