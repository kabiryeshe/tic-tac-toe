
#import <Foundation/Foundation.h>

@class Player, TileLocation;

@interface Board : NSObject

- (instancetype)initWithTiles:(NSArray *)tiles;
- (void)reset;
- (void)markTile:(TileLocation *)location forPlayer:(Player *)player;
- (NSArray *)checkForThreeContinuousMarks;

@end
