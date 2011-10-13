//
//  Column.m
//  FreeBird
//
//  Created by Noel Feliciano on 11-10-08.
//  Copyright 2011 University of Victoria. All rights reserved.
//

#import "Column.h"

@implementation Column

@synthesize column;
@synthesize cardsInColumn;
@synthesize xPosition;
@synthesize yPosition;
@synthesize bottomCard;

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

-(id)initWithXPosition:(int)xPos {
    self = [super init];
    if (self) {
        column = [[NSMutableArray alloc] init];
        cardsInColumn = 0;
        xPosition = xPos;
        yPosition = 300;
        bottomCard = nil;
    }
    return self;
}

-(void)dealloc {
    [column release];
    [super dealloc];
}

-(void)addCardToColumn:(Card *)aCard {
    [column addObject:aCard];
    cardsInColumn++;
    yPosition += 80;
}

-(Card *)bottomCard {
    return [column objectAtIndex:cardsInColumn - 1];
}

-(Card *)removeCardFromColumn {
    Card *lol;
    return lol;
}

-(CGPoint)getPositionOfCard {
    CGPoint bottomCardCenter = CGPointMake(xPosition, yPosition-80);
    return bottomCardCenter;
}

-(BOOL)compareSpeciesOfCardA:(Card *)aCardA andCardB:(Card *)aCardB {
    return YES;
}

-(BOOL)compareFamiliesOfCardA:(Card *)aCardA andCardB:(Card *)aCardB {
    return YES;   
}

-(int)numberOfCardsInColumn {
    return cardsInColumn;
}

@end
