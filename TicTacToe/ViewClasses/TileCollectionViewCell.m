
#import "TileCollectionViewCell.h"

@interface TileCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation TileCollectionViewCell

- (void)prepareForReuse {
    self.imageView.image = nil;
    self.userInteractionEnabled = true;
}

- (void)setImage:(NSString *)imageName {
    
    self.imageView.image = [UIImage imageNamed:imageName];
}
@end
