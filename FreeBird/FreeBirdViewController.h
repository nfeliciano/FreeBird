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

@interface FreeBirdViewController : UIViewController {
    Card *aCard;
    Card *cardToMove;
    NSMutableArray *columns;
    NSMutableArray *cards;
}

@property (nonatomic, retain) NSMutableArray *columns;
@property (nonatomic, retain) NSMutableArray *cards;
@property (nonatomic, retain) Card *cardToMove;

-(void)addRowOfCards;
-(void)setUpGameBoard;
-(void)inARow:(int )clmn;
-(BOOL)compareSpeciesOfCardA:(Card *)aCardA andCardB:(Card *)aCardB;
-(BOOL)compareFamiliesOfCardA:(Card *)aCardA andCardB:(Card *)aCardB;
-(int)checkAbove:(int )clmn;

@end
