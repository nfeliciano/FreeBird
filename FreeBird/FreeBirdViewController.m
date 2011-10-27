//
//  FreeBirdViewController.m
//  FreeBird
//
//  Created by Joseph Feliciano on 11-09-19.
//  Copyright 2011 University of Victoria. All rights reserved.
//

//comment comment lolololol

#import "FreeBirdViewController.h"
#import "Deck.h"
#import "Card.h"
#import "Column.h"

Column *columns[6];
Card *cardToMove;
Card *aCard;


@implementation FreeBirdViewController

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
    
    Deck *deck = [[Deck alloc] initWithFamilyOne:Icteridae FamilyTwo:Cardinalidae andFamilyThree:Corvidae];
    NSMutableArray *cards = [deck populateCardArray];
    
    int xPos = 110;
    for (int i =0; i < 6; i++) {
        columns[i] = [[Column alloc] initWithXPosition:xPos];
        xPos += 160;
    }
    int temp =0;
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
        /*NSMutableArray *lol = [columns[col] allCardsInTheColumn];
        for (int i = 0; i < [lol count]; i++) {
            aCard = [lol objectAtIndex:i];
            NSLog(@"%@", [aCard speciesAsString]);
        }*/
    }
   /* [columns[3] addCardToColumn:[cards objectAtIndex:0]];
    Card *aCard = [columns[3] bottomCard];
    aCard.center = [aCard getCardPosition];
    [self.view addSubview:aCard];
    
    [columns[3] addCardToColumn:[cards objectAtIndex:1]];
    aCard = [columns[3] bottomCard];
    aCard.center = [aCard getCardPosition];
    [self.view addSubview:aCard];*/
    

    
    /*[columns[0] addCardToColumn:[cards objectAtIndex:0]];
    Card *aCard = [columns[0] bottomCard];
    aCard.center = [columns[0] getPositionOfCard];
    [self.view addSubview:aCard];
    
    [columns[0] addCardToColumn:[cards objectAtIndex:1]];
    Card *aCardB = [columns[0] bottomCard];
    aCardB.center = [columns[0] getPositionOfCard];
    [self.view addSubview:aCardB];*/
    
    /*
     for (int i = 0; i < 6; i++) {
        //init Card *aCard;
        
     
     */
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //checks to see if any objects were touched
    UITouch *touch = [touches anyObject];
    
    //traverses the array of cards to see what card was touched
    for (int i=0; i<6; i++) 
    {
        int columnLength = [columns[i] numberOfCardsInColumn];
        NSMutableArray *thisColumn = [columns[i] allCardsInTheColumn];
        //NSLog(@"%d", columnLength);
        for (int j=0; j<columnLength; j++) 
        {
            //cardToMove is the card that has been touched
            cardToMove = [thisColumn objectAtIndex:j];
                                        
            if ([touch view] == cardToMove) 
            {
                //Moves card assigned to cardToMove to the touched position
                [self.view bringSubviewToFront:cardToMove];
                CGPoint location = [touch locationInView:self.view];
                cardToMove.center = location;
                return;
            }
            cardToMove = nil;
            
        }
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [columns[[cardToMove column]] removeCardFromColumn];
    for (int col = 0; col<6; col++) {
        Card *tempCard = [columns[col] bottomCard];
        if (CGRectIntersectsRect([cardToMove frame], [tempCard frame])) {
            [cardToMove setColumn:col];
            if (cardToMove != nil) [columns[col] addCardToColumn:cardToMove];
            cardToMove.center = [cardToMove getCardPosition];
            return;
        }
    }
    //returns moved card to its original position
    CGPoint start = [cardToMove getCardPosition];
    [columns[[cardToMove column]] addCardToColumn:cardToMove];
    cardToMove.center = start;
    //resets cardToMove
    cardToMove = nil;
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
    [super dealloc];
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
        UIImageView *deckImage = [[UIImageView alloc] initWithFrame:deckImageRect];
        [deckImage setImage:[UIImage imageNamed:@"cardBack.png"]];
        deckImage.opaque = NO;
        deckImage.center = CGPointMake(x, y);
        deckImage.contentMode = UIViewContentModeScaleAspectFit;
        CGRect temp = deckImage.frame;
        temp.size.width = 90;
        deckImage.frame = temp;
        [self.view addSubview:deckImage];
        [deckImage release];
        x += 20;
        y += 30;
    }
    
    
}

@end
