//
//  GameViewController.m
//  TicTacToe
//
//  Created by Tushar on 13/05/16.
//  Copyright © 2016 thoughtworks. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController () {
    
}

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    

    return cell;
}



@end
