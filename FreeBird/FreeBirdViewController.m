//
//  FreeBirdViewController.m
//  FreeBird
//
//  Created by Joseph Feliciano on 11-09-19.
//  Copyright 2011 University of Victoria. All rights reserved.
//

//comment comment lolololol

#import "FreeBirdViewController.h"

UIImageView *deckGraphic[3];
Card *aCard;
BOOL areWePeeking;
int deckCounter;

@implementation FreeBirdViewController

@synthesize columns;
@synthesize cards;
@synthesize cardToMove;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpGameBoard];
    
    cardToMove = nil;
    deckCounter = 0;
    
    Deck *deck = [[Deck alloc] initWithFamilyOne:Icteridae FamilyTwo:Cardinalidae andFamilyThree:Corvidae];
    cards = [[NSMutableArray alloc] initWithArray:[deck populateCardArray]];
    [deck release];
    
    columns = [[NSMutableArray alloc] init];
    
    int xPos = 110;
    for (int i =0; i < 6; i++) {
        [columns addObject: [[Column alloc] initWithXPosition:xPos]];
        xPos += 160;
    }
    for (int row  = 0; row < 4; row++) {
        [self addRowOfCards];
    }
    /*int temp =0;
    for (int col = 0; col<6; col++) 
    {
        for (int row = 0; row<4; row++, temp++) 
        {
            [columns[col] addCardToColumn:[cards objectAtIndex:temp]];
            aCard = [columns[col] bottomCard];
            aCard.center = [aCard getCardPosition];
            [aCard setColumn:col];
            [self.view addSubview:aCard];
        }
        NSMutableArray *lol = [columns[col] allCardsInTheColumn];
        for (int i = 0; i < [lol count]; i++) {
            aCard = [lol objectAtIndex:i];
            NSLog(@"%@", [aCard speciesAsString]);
        }
    }*/
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

-(void)dealloc {
    for (int i = 0; i < 6; i++) {
        [[columns objectAtIndex:i] release];
    }
    
    for (int i = 0; i < 3; i++) {
        [deckGraphic[i] release];
    }
    [super dealloc];
}

-(void)addRowOfCards {
    for (int col = 0; col < 6; col++, deckCounter++) {
        [[columns objectAtIndex:col] addCardToColumn:[cards objectAtIndex:deckCounter]];
        aCard = [[columns objectAtIndex:col] bottomCard];
        aCard.center = [aCard getCardPosition];
        [aCard setColumn:col];
        [self.view addSubview:aCard];
        //[[cards objectAtIndex:deckCounter] release];
    }
}

-(void)setUpGameBoard {
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"gameplayBackgroundOne.png"]];
    
    int x = 100;
    CGRect freeCellImageRect = CGRectMake(0, 0, 120, 168);
    for (int i = 0; i < 4; i++) {
        UIImageView *freeCellImage = [[UIImageView alloc] initWithFrame:freeCellImageRect];
        [freeCellImage setImage:[UIImage imageNamed:@"freeCell.png"]];
        freeCellImage.opaque = NO;
        freeCellImage.center = CGPointMake(x, 100);
        [self.view addSubview:freeCellImage];
        [freeCellImage release];
        x += 160;
    }
    
    CGRect deckImageRect = CGRectMake(0, 0, 120, 168);
    x = 940;
    int y = 70;
    for (int i = 0; i < 3; i++) {
        deckGraphic[i] = [[UIImageView alloc] initWithFrame:deckImageRect];
        deckGraphic[i].userInteractionEnabled = YES;
        [deckGraphic[i] setImage:[UIImage imageNamed:@"cardBack.png"]];
        deckGraphic[i].opaque = NO;
        deckGraphic[i].center = CGPointMake(x, y);
        deckGraphic[i].contentMode = UIViewContentModeScaleAspectFit;
        CGRect temp = deckGraphic[i].frame;
        temp.size.width = 90;
        deckGraphic[i].frame = temp;
        [self.view addSubview:deckGraphic[i]];
        x += 20;
        y += 30;
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    /*for (int i = 0; i < 3; i++) {
        if ([touch view] == deckGraphic[i]) {
            if (deckCounter == 0) {
                NSLog(@"%d", deckCounter);
                for (int j=0; j<4; j++) {
                    [self addRowOfCards];
                }
            } else if (deckCounter == 24) {
                [self addRowOfCards];
                [deckGraphic[2] removeFromSuperview];
            } else if (deckCounter == 36) {
                [self addRowOfCards];
                [deckGraphic[1] removeFromSuperview];
            } else if (deckCounter == 42) {
                [self addRowOfCards];
                [deckGraphic[0] removeFromSuperview];
            } else {
                break;
            }
        }
    }*/
    
    for (int i=0; i<6; i++) 
    {
        int columnLength = [[columns objectAtIndex:i] numberOfCardsInColumn];
        NSMutableArray *thisColumn = [[columns objectAtIndex:i] allCardsInTheColumn];
        //NSLog(@"%d", columnLength);
        for (int j=0; j<columnLength; j++) 
        {
            //cardToMove is the card that has been touched
            cardToMove = [thisColumn objectAtIndex:j];
            
            if ([touch view] == cardToMove) 
            {
                NSLog(@"%@", [cardToMove speciesAsString]);
                if ([cardToMove isABottomCard]) {
                    areWePeeking = NO;
                } else {
                    areWePeeking = YES;
                }
                return;
            }
            cardToMove = nil;
            
        }
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (cardToMove == nil) {
        return;
    }
    
    //checks to see if any objects were touched
    UITouch *touch = [touches anyObject];
    
    //traverses the array of cards to see what card was touched
    if ([touch view] == cardToMove) 
    {
        if (!areWePeeking) {
            //Moves card assigned to cardToMove to the touched position
            [self.view bringSubviewToFront:cardToMove];
            CGPoint location = [touch locationInView:self.view];
            cardToMove.center = location;
            return;
        } else {
            CGPoint location = [touch locationInView:self.view];
            CGPoint temp = CGPointMake(cardToMove.center.x, location.y);
            cardToMove.center = temp;
            
            //Find position of card in column
            int i;
            NSMutableArray *thisColumn = [[columns objectAtIndex:[cardToMove column]] allCardsInTheColumn];
            for (i = 0; i < [thisColumn count]; i++) {
                if (cardToMove == [thisColumn objectAtIndex:i]) {
                    break;
                }
            }
            
            //Move rest of column
            for (int j = i; j < [thisColumn count]; j++) {
                CGPoint moveOthers = CGPointMake(cardToMove.center.x, location.y + ((j - i) * 80));
                Card *moveTempCard = [thisColumn objectAtIndex:j];
                moveTempCard.center = moveOthers;
            }
            return;
        }
    }
    cardToMove = nil;
}



-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (cardToMove ==  nil) {
        return;
    }
    if (!areWePeeking) {
        [[columns objectAtIndex:[cardToMove column]] removeCardFromColumn];
        for (int col = 0; col<6; col++) {
            Card *tempCard = [[columns objectAtIndex:col] bottomCard];
            if (CGRectIntersectsRect([cardToMove frame], [tempCard frame])) {
                //NSLog(@"%@", [cardToMove speciesAsString]);
                if ([self compareFamiliesOfCardA:cardToMove andCardB:tempCard]){
                    [cardToMove setColumn:col];
                
                    if (cardToMove != nil) {
                        [[columns objectAtIndex:col] addCardToColumn:cardToMove];
                        cardToMove.center = [cardToMove getCardPosition];
                        [self inARow:col];
                        return;
                    }
                }
                
                CGPoint start = [cardToMove getCardPosition];
                [[columns objectAtIndex:[cardToMove column]] addCardToColumn:cardToMove];
                cardToMove.center = start;
                
                return;
            }
        }
        
        //returns moved card to its original position
        CGPoint start = [cardToMove getCardPosition];
        [[columns objectAtIndex:[cardToMove column]] addCardToColumn:cardToMove];
        cardToMove.center = start;
        //resets cardToMove
        //cardToMove = nil;
    } else {
        NSMutableArray *thisColumn = [[columns objectAtIndex:[cardToMove column]] allCardsInTheColumn];
        for (int i = 0; i < [thisColumn count]; i++) {
            Card *tempCard = [thisColumn objectAtIndex:i];
            CGPoint start = [tempCard getCardPosition];
            tempCard.center = start;
        }
    }
}

-(BOOL)compareSpeciesOfCardA:(Card *)aCardA andCardB:(Card *)aCardB {
    NSString *movedCard = [aCardA speciesAsString];
    NSString *cardInColumn = [aCardB speciesAsString];
    
    return [movedCard isEqualToString:cardInColumn];
}

-(BOOL)compareFamiliesOfCardA:(Card *)aCardA andCardB:(Card *)aCardB {
    
    NSString *movedCard = [aCardA familyAsString];
    NSString *cardInColumn = [aCardB familyAsString];
    
    NSLog(@"%d", [movedCard isEqualToString:cardInColumn]);
    return [movedCard isEqualToString:cardInColumn];  
}
-(void)inARow:(int )clmn {
    int numberInARow = [self checkAbove:clmn];
    if (numberInARow == 4) {
        for(int i=0;i<4;i++){
            Card *tempCard = [[columns objectAtIndex:clmn] removeCardFromColumn];
            [tempCard removeFromSuperview]; 
        }
        return;        
    }
    return;
}
-(int)checkAbove:(int )clmn {
    int row = [[columns objectAtIndex:clmn] numberOfCardsInColumn];
    NSMutableArray *anotherColumn = [[columns objectAtIndex:clmn] allCardsInTheColumn]; 
    NSMutableString *currentCard = nil;
    NSMutableString *lastCard = nil;
    int numberInARow =0;
    if (row <1){
        return 0;
    }
    else if (row > 3) {
        lastCard = [NSMutableString stringWithString:[[anotherColumn objectAtIndex:row-1] speciesAsString]];
        for(int k=row-1; k>(row-4);k--) {
            Card *newCard = [anotherColumn objectAtIndex:k];
          //  NSString *tempString = [newCard speciesAsString];
            currentCard = [NSMutableString stringWithString:[newCard speciesAsString]];
            //NSLog(@"%d", k);
            if([lastCard isEqualToString:currentCard]) {
                NSLog(@"%d", k);
                lastCard = currentCard;
                numberInARow++;
            }
        }
    }
    else {
        lastCard = [NSMutableString stringWithString:[[anotherColumn objectAtIndex:row-1] speciesAsString]];
        for(int k=row-1; k>=0;k--) {
            Card *newCard = [anotherColumn objectAtIndex:k];
            NSString *tempString = [newCard speciesAsString];
            currentCard = [NSMutableString stringWithString:tempString];
            if([lastCard isEqualToString:currentCard]) {
                lastCard = currentCard;
                numberInARow++;
            }
        }
    }
    return numberInARow;
}

@end
