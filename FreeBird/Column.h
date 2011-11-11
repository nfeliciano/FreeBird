//
//  Column.h
//  FreeBird
//
//  Created by Noel Feliciano on 11-10-08.
//  Copyright 2011 University of Victoria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Column : NSObject {
    NSMutableArray *column;
    int cardsInColumn;
    int xPosition;
    int yPosition;
    Card *bottomCard;
}

@property (nonatomic, assign) NSMutableArray *column;
@property (nonatomic, assign) int cardsInColumn;
@property (nonatomic, assign) int xPosition;
@property (nonatomic, assign) int yPosition;
@property (nonatomic, assign) Card *bottomCard;

-(id)initWithXPosition:(int)xPos;
-(void)addCardToColumn:(Card *)aCard;
-(Card *)bottomCard;
-(Card *)removeCardFromColumn;
-(int)numberOfCardsInColumn;
-(NSMutableArray *)allCardsInTheColumn;

@end
