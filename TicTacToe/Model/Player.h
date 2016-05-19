
#import <Foundation/Foundation.h>

@interface Player : NSObject

@property(strong, nonatomic, readonly) NSString* name;
@property(strong, nonatomic, readonly) NSString* markSymbol;

- (instancetype)initWithName:(NSString *)name markSymbol:(NSString *)symbol;

@end
