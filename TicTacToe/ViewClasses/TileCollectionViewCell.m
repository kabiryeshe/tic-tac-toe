
#import "TileCollectionViewCell.h"

@interface TileCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation TileCollectionViewCell

- (void)setImage:(NSString *)imageName {
    
    self.imageView.image = [UIImage imageNamed:imageName];
}
@end
