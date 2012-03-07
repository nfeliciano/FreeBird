//
//  FreeBirdViewController.h
//  FreeBird
//
//  Created by Joseph Feliciano on 11-09-19.
//  Copyright 2011 University of Victoria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameVariables.h"
#import "DifficultySettingsViewController.h"
#import "Deck.h"
#import "Card.h"
#import "Column.h"
#import "EmptyCell.h"
#import <AudioToolbox/AudioServices.h>

@interface FreeBirdViewController : UIViewController {
    Card *aCard;
    Card *cardToMove;
    Card *cardToMove0;
    Card *cardToMove1;
    Card *cardToMove2;
    Card *cardToMove3;
    NSMutableArray *columns;
    NSMutableArray *cards;
    NSMutableArray *freeCells;
    NSMutableArray *emptyColumnCells;
    UIImageView *deckNumberOne;
    UIImageView *deckNumberTwo;
    UIImageView *deckNumberThree;
    int numberOfMoves;
    int numberOfErrors;
    NSTimer *timeInSeconds;
    NSDate *startDate;
    UILabel *moveCounter;
    UILabel *errorCounter;
    UILabel *timer;
    int cardsFinished;
    UIImageView *button;
    NSString *difficultyLevel;
    SystemSoundID audioEffect;
}

@property (nonatomic, retain) NSMutableArray *freeCells;
@property (nonatomic, retain) NSMutableArray *emptyColumnCells;
@property (nonatomic, retain) NSMutableArray *columns;
@property (nonatomic, retain) NSMutableArray *cards;
@property (nonatomic, retain) Card *cardToMove;
@property (nonatomic, retain) Card *cardToMove0; 
@property (nonatomic, retain) Card *cardToMove1; 
@property (nonatomic, retain) Card *cardToMove2; 
@property (nonatomic, retain) Card *cardToMove3; 
@property (nonatomic, retain) UIImageView *deckNumberOne; 
@property (nonatomic, retain) UIImageView *deckNumberTwo; 
@property (nonatomic, retain) UIImageView *deckNumberThree; 
@property (nonatomic, assign) int numberOfMoves;
@property (nonatomic, assign) int numberOfErrors;
@property (nonatomic, assign) NSTimer *timeInSeconds;
@property (nonatomic, assign) NSDate *startDate;
@property (nonatomic, assign) UILabel *moveCounter;
@property (nonatomic, assign) UILabel *errorCounter;
@property (nonatomic, assign) UILabel *timer;
@property (nonatomic, assign) int freeCellsUsed;
@property (nonatomic, assign) int cardsFinished;
@property (nonatomic, assign) int touchStart;
@property (nonatomic, assign) NSString *difficultyLevel;

-(void) playSound:(NSString *)fName:(NSString *)ext;
-(void)addRowOfCards;
-(void)setUpGameBoard;
-(void)inARow:(NSNumber *)column;
-(BOOL)compareSpeciesOfCardA:(Card *)aCardA andCardB:(Card *)aCardB;
-(BOOL)compareFamiliesOfCardA:(Card *)aCardA andCardB:(Card *)aCardB;
-(int)checkAbove:(int )clmn;
-(BOOL)checkBelow:(int )clmn fromRow:(int )row;
-(void)updateMoveCounter;
-(void)postToServer;
@end
