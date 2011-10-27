//
//  Column.m
//  FreeBird
//
//  Created by Noel Feliciano on 11-10-08.
//  Copyright 2011 University of Victoria. All rights reserved.
//

//random comment too

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
    [aCard setCoordinatesWithXPosition:xPosition andYPosition:yPosition];
    cardsInColumn++;
    yPosition += 80;
}

-(Card *)bottomCard {
    return [column objectAtIndex:cardsInColumn - 1];
}

-(Card *)removeCardFromColumn {
    Card *bottom = [self bottomCard];
    [column removeObjectAtIndex:cardsInColumn-1];
    yPosition -= 80;
    cardsInColumn--;
    return bottom;
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

-(NSMutableArray *)allCardsInTheColumn {
    return column;
}

@end
