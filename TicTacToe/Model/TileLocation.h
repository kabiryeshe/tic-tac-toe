#import <Foundation/Foundation.h>

@interface TileLocation : NSObject
@property(nonatomic, readonly) NSInteger row;
@property(nonatomic, readonly) NSInteger column;

+ (instancetype) locationWithRow:(NSInteger)row column:(NSInteger)column;
@end

