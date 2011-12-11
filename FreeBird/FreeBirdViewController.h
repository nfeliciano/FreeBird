//
//  FreeBirdViewController.h
//  FreeBird
//
//  Created by Joseph Feliciano on 11-09-19.
//  Copyright 2011 University of Victoria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "Card.h"
#import "Column.h"
#import "EmptyCell.h"

@interface FreeBirdViewController : UIViewController {
    Card *aCard;
    Card *cardToMove;
    NSMutableArray *columns;
    NSMutableArray *cards;
    NSMutableArray *freeCells;
    NSMutableArray *emptyColumnCells;
    UIImageView *deckNumberOne;
    UIImageView *deckNumberTwo;
    UIImageView *deckNumberThree;
    int numberOfMoves;
    UILabel *moveCounter;
    int cardsFinished;
}

@property (nonatomic, retain) NSMutableArray *freeCells;
@property (nonatomic, retain) NSMutableArray *emptyColumnCells;
@property (nonatomic, retain) NSMutableArray *columns;
@property (nonatomic, retain) NSMutableArray *cards;
@property (nonatomic, retain) Card *cardToMove; 
@property (nonatomic, retain) UIImageView *deckNumberOne; 
@property (nonatomic, retain) UIImageView *deckNumberTwo; 
@property (nonatomic, retain) UIImageView *deckNumberThree; 
@property (nonatomic, assign) int numberOfMoves;
@property (nonatomic, assign) UILabel *moveCounter;
@property (nonatomic, assign) int cardsFinished;

-(void)addRowOfCards;
-(void)setUpGameBoard;
-(void)inARow:(int )clmn;
-(BOOL)compareSpeciesOfCardA:(Card *)aCardA andCardB:(Card *)aCardB;
-(BOOL)compareFamiliesOfCardA:(Card *)aCardA andCardB:(Card *)aCardB;
-(int)checkAbove:(int )clmn;
-(void)updateMoveCounter;
-(void)postToServer;

@end
