//
//  GameViewController.m
//  TicTacToe
//
//  Created by Tushar on 13/05/16.
//  Copyright © 2016 thoughtworks. All rights reserved.
//

#import "GameViewController.h"
#import "Game.h"
#import "Board.h"
#import "Player.h"
#import "TileCollectionViewCell.h"
#import "TileLocation.h"

@interface GameViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property(nonatomic, strong) Game* game;
@property(nonatomic, strong) Player* firstPlayer;
@property(nonatomic, strong) Player* secondPlayer;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UICollectionView *tilesCollectionView;
@property(nonatomic, strong) Board* board;
@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.game = [[Game alloc]initWithGameBoard:self.board
                                   firstPlayer:self.firstPlayer
                                  secondPlayer:self.secondPlayer];
    self.statusLabel.text = [NSString stringWithFormat: @"%@, your turn", [self.game currentPlayer].name];
    [self.button setHidden:YES];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TileLocation *location = [TileLocation locationWithRow:indexPath.section column:indexPath.item];
    
    if(![self.board isTileMarked:location]){
        TileCollectionViewCell *cell = (TileCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        Player* currentPlayer = [self.game currentPlayer];
        [cell setImage:currentPlayer.markSymbol];
        [cell setUserInteractionEnabled:NO];
        GameStatus status = [self.game playMove:location];
        [self updateViewWithGameStatus:status];
    }
    
}

- (void)updateViewWithGameStatus:(GameStatus)gameStatus {
    
    switch(gameStatus) {
        case NEXT_MOVE: self.statusLabel.text = [NSString stringWithFormat: @"%@, your turn", [self.game currentPlayer].name];
            break;
        case PLAYER_1_WINS: self.statusLabel.text = [NSString stringWithFormat: @"%@, wins", self.firstPlayer.name];
            [self setReadyForRestart];
            break;
        case PLAYER_2_WINS: self.statusLabel.text = [NSString stringWithFormat: @"%@, wins", self.secondPlayer.name];
            [self setReadyForRestart];
            break;
        case DRAW: self.statusLabel.text = @"It's a draw !";
            [self setReadyForRestart];
            break;
    }
}

- (void)setReadyForRestart {
    [self.tilesCollectionView setUserInteractionEnabled:NO];
    [self.button setHidden:NO];
}

- (IBAction)startRestartButtonPressed:(id)sender {
    [self.statusLabel setText:@""];
    [self.tilesCollectionView reloadData];
    [self.tilesCollectionView setUserInteractionEnabled:YES];
    [self.game restartGame];
}

- (Player *)firstPlayer {
    if(!_firstPlayer) {
        _firstPlayer = [[Player alloc]initWithName:@"Rob" markSymbol:@"cross"];
    }
    return _firstPlayer;
    
}

- (Player *)secondPlayer {
    if(!_secondPlayer) {
        _secondPlayer = [[Player alloc]initWithName:@"Shelly" markSymbol:@"circle"];
    }
    return _secondPlayer;
}

- (Board *)board {
    if(!_board) {
        _board = [Board emptyBoard];
    }
    return _board;
}


@end
