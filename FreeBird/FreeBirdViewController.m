//
//  FreeBirdViewController.m
//  FreeBird
//
//  Created by Joseph Feliciano on 11-09-19.
//  Copyright 2011 University of Victoria. All rights reserved.
//

//comment comment lolololol

#import "FreeBirdViewController.h"

BOOL areWePeeking;
int deckCounter;

@implementation FreeBirdViewController

@synthesize freeCells;
@synthesize emptyColumnCells;
@synthesize columns;
@synthesize cards;
@synthesize cardToMove;
@synthesize deckNumberOne;
@synthesize deckNumberTwo;
@synthesize deckNumberThree;
@synthesize numberOfMoves;
@synthesize moveCounter;
@synthesize cardsFinished;

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
    columns = [[NSMutableArray alloc] init];
    freeCells = [[NSMutableArray alloc] init];
    emptyColumnCells = [[NSMutableArray alloc] init];
    
    [self setUpGameBoard];
    
    cardToMove = nil;
    deckCounter = 0;
    numberOfMoves = 0;
    cardsFinished = 0;
    
    CGRect labelFrame = CGRectMake(0, 0, 160, 30);
    moveCounter = [[UILabel alloc] initWithFrame:labelFrame];
    [moveCounter setFont:[UIFont systemFontOfSize:26]];
    moveCounter.textAlignment = UITextAlignmentLeft;
    moveCounter.textColor = [UIColor whiteColor];
    moveCounter.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    [moveCounter setText:[NSString stringWithFormat:@"Moves: %d", numberOfMoves]];
    moveCounter.center = CGPointMake(800, 40);
    moveCounter.opaque = YES;
    [self.view addSubview:moveCounter];
    
    Deck *deck = [[Deck alloc] initWithFamilyOne:Icteridae FamilyTwo:Cardinalidae andFamilyThree:Corvidae];
    cards = [[NSMutableArray alloc] initWithArray:[deck populateCardArray]];
    [deck release];
    
    int xPos = 85;      //was 110
    for (int i =0; i < 6; i++) {
        [columns addObject: [[Column alloc] initWithXPosition:xPos]];
        xPos += 170;    //was 160
    }
    /*for (int row  = 0; row < 4; row++) {
        [self addRowOfCards];
    }*/
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
    [freeCells release];
    [deckNumberOne release];
    [deckNumberTwo release];
    [deckNumberThree release];
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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"gameplayBackgroundThree.png"]];
    
    int x = 100;
    int y = 80;
    
    for (int i = 0; i < 4; i++) {
        EmptyCell *emptyCellImage = [[EmptyCell alloc] initWithXPos:x andYPos:y andIsAFreeCell:YES];
        [freeCells addObject:emptyCellImage];
        //emptyCellImage.center = [emptyCellImage position];
        //[self.view addSubview:emptyCellImage];
        [emptyCellImage release];
        x += 170;
    }
    
    for (int i = 0; i < 4; i++) {
        EmptyCell *emptyCell = [freeCells objectAtIndex:i];
        emptyCell.center = [emptyCell position];
        [self.view addSubview:emptyCell];
    }
    
    x = 85;
    y = 220;
    for (int i = 0; i < 6; i++) {
        EmptyCell *emptyCellImage = [[EmptyCell alloc] initWithXPos:x andYPos:y andIsAFreeCell:NO];
        [emptyColumnCells addObject:emptyCellImage];
        [emptyCellImage release];
        x += 170;
    }
    
    for (int i = 0; i < 6; i++) {
        EmptyCell *emptyCell = [emptyColumnCells objectAtIndex:i];
        emptyCell.center = [emptyCell position];
        [self.view addSubview:emptyCell];
    }
    
    /*CGRect freeCellImageRect = CGRectMake(0, 0, 120, 168);
    for (int i = 0; i < 4; i++) {
        UIImageView *freeCellImage = [[UIImageView alloc] initWithFrame:freeCellImageRect];
        [freeCellImage setImage:[UIImage imageNamed:@"freeCell.png"]];
        freeCellImage.opaque = NO;
        freeCellImage.center = CGPointMake(x, 100);
        [self.view addSubview:freeCellImage];
        [freeCellImage release];
        x += 160;
    }*/
    
    CGRect deckImageRect = CGRectMake(0, 0, 120, 168);
    x = 900;
    y = 85;
    deckNumberOne = [[UIImageView alloc] initWithFrame:deckImageRect];
    deckNumberOne.userInteractionEnabled = YES;
    [deckNumberOne setImage:[UIImage imageNamed:@"cardBack.png"]];
    deckNumberOne.opaque = NO;
    deckNumberOne.center = CGPointMake(x, y);
    deckNumberOne.contentMode = UIViewContentModeScaleAspectFit;
    CGRect temp = deckNumberOne.frame;
    temp.size.height = 90;
    deckNumberOne.frame = temp;
    [self.view addSubview:deckNumberOne];
    x += 20;
    y += 30;
    
    deckNumberTwo = [[UIImageView alloc] initWithFrame:deckImageRect];
    deckNumberTwo.userInteractionEnabled = YES;
    [deckNumberTwo setImage:[UIImage imageNamed:@"cardBack.png"]];
    deckNumberTwo.opaque = NO;
    deckNumberTwo.center = CGPointMake(x, y);
    deckNumberTwo.contentMode = UIViewContentModeScaleAspectFit;
    temp = deckNumberTwo.frame;
    temp.size.height = 90;
    deckNumberTwo.frame = temp;
    [self.view addSubview:deckNumberTwo];
    x += 20;
    y += 30;
    
    deckNumberThree = [[UIImageView alloc] initWithFrame:deckImageRect];
    deckNumberThree.userInteractionEnabled = YES;
    [deckNumberThree setImage:[UIImage imageNamed:@"cardBack.png"]];
    deckNumberThree.opaque = NO;
    deckNumberThree.center = CGPointMake(x, y);
    deckNumberThree.contentMode = UIViewContentModeScaleAspectFit;
    temp = deckNumberThree.frame;
    temp.size.height = 90;
    deckNumberThree.frame = temp;
    [self.view addSubview:deckNumberThree];
    x += 20;
    y += 30;
    
    
                                                                //info for the send stats button
    CGRect buttonRect = CGRectMake(0, 0, 160, 200);
    button = [[UIImageView alloc] initWithFrame:buttonRect];    //size
    button.userInteractionEnabled = YES;                        //enable interaction
    [button setImage:[UIImage imageNamed:@"buttonPic2.png"]];   //set the image for the button
    button.opaque = NO;                                         //not opaque
    button.center = CGPointMake(512, 384);                      //center the button
    button.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:button];

    /*for (int i = 0; i < 3; i++) {
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
    }*/
}

-(void)updateMoveCounter {
    [moveCounter setText:[NSString stringWithFormat:@"Moves: %d", numberOfMoves]];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (cardsFinished == 48) {
        
    }
    
    UITouch *touch = [touches anyObject];
    if ([touch view] == button)
    {
        NSLog(@"%@", @"hi");
        [self sendStats];
    }
    
    for (int i = 0; i < 3; i++) {
        if ([touch view] == deckNumberOne || [touch view] == deckNumberTwo || [touch view] == deckNumberThree) {
            if (deckCounter == 0) {
                NSLog(@"%d", deckCounter);
                for (int j=0; j<4; j++) {
                    [self addRowOfCards];
                }
                //[deckNumberThree removeFromSuperview];//temp for 36 cards
                break;
            } else if (deckCounter == 24) {
                [self addRowOfCards];
                //[deckNumberTwo removeFromSuperview];//temp for 36
                [deckNumberThree removeFromSuperview];
                break;
            } else if (deckCounter == 30) {
                //[deckNumberOne removeFromSuperview];//temp for 36
                [self addRowOfCards];
                break;
            } else if (deckCounter == 36) {
                [self addRowOfCards];
                [deckNumberTwo removeFromSuperview];
                break;
            } else if (deckCounter == 42) {
                [self addRowOfCards];
                [deckNumberOne removeFromSuperview];
                break;
            } else {
                break;
            }
        }
    }
    
    for (int i=0; i<4; i++) {
        EmptyCell *freeCell = [freeCells objectAtIndex:i];
        cardToMove = [freeCell freeCellIsFilledWith];
        if ([touch view] == cardToMove) {
            NSLog(@"%@", [cardToMove speciesAsString]);
            [freeCell setIsFilled:NO];
            return;
        }
    }
    
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
        if ([cardToMove column] < 10) [[columns objectAtIndex:[cardToMove column]] removeCardFromColumn];
        for (int i = 0; i < 4; i++) {
            EmptyCell *empty = [freeCells objectAtIndex:i];
            if (CGRectIntersectsRect([cardToMove frame], [empty frame])) {
                //NSLog(@"ALFJAL");
                if ([empty isFilled] == YES) {
                    CGPoint start = [cardToMove getCardPosition];
                    if ([cardToMove column] < 10) [[columns objectAtIndex:[cardToMove column]] addCardToColumn:cardToMove];
                    else {
                        EmptyCell *backTo = [freeCells objectAtIndex:[cardToMove column]-10];
                        [backTo setIsFilled:YES];
                    }
                    cardToMove.center = start;
                    return;
                }
                cardToMove.center = [empty position];
                [cardToMove setCardPosition:[empty position]];
                [cardToMove setColumn:10+i];
                [empty setIsFilled:YES];
                [empty setFreeCellIsFilledWith:cardToMove];
                numberOfMoves++;
                [self updateMoveCounter];
                return;
            }
        }
        for (int col = 0; col<6; col++) {
            Card *tempCard = [[columns objectAtIndex:col] bottomCard];
            if (CGRectIntersectsRect([cardToMove frame], [tempCard frame])) {
                //NSLog(@"%@", [cardToMove speciesAsString]);
                if ([self compareFamiliesOfCardA:cardToMove andCardB:tempCard]) {
                    [cardToMove setColumn:col];
                
                    if (cardToMove != nil) {
                        [[columns objectAtIndex:col] addCardToColumn:cardToMove];
                        cardToMove.center = [cardToMove getCardPosition];
                        [self inARow:col];
                        numberOfMoves++;
                        [self updateMoveCounter];
                        return;
                    }
                }
                
                CGPoint start = [cardToMove getCardPosition];
                if ([cardToMove column] < 10) [[columns objectAtIndex:[cardToMove column]] addCardToColumn:cardToMove];
                else {
                    EmptyCell *backTo = [freeCells objectAtIndex:[cardToMove column]-10];
                    [backTo setIsFilled:YES];
                }
                cardToMove.center = start;
                
                return;
            }
        }
        
        for (int col = 0; col < 6; col++) {
            if ([[columns objectAtIndex:col] cardsInColumn] == 0) {
                EmptyCell *emptyColumn = [emptyColumnCells objectAtIndex:col];
                if (CGRectIntersectsRect([cardToMove frame], [emptyColumn frame])) {
                    [cardToMove setColumn:col];
                    
                    if (cardToMove != nil) {
                        [[columns objectAtIndex:col] addCardToColumn:cardToMove];
                        cardToMove.center = [cardToMove getCardPosition];
                        [self inARow:col];
                        numberOfMoves++;
                        [self updateMoveCounter];
                        return;
                    }
                }
            }
        }
        
        //returns moved card to its original position
        CGPoint start = [cardToMove getCardPosition];
        if ([cardToMove column] < 10) [[columns objectAtIndex:[cardToMove column]] addCardToColumn:cardToMove];
        else {
            EmptyCell *backTo = [freeCells objectAtIndex:[cardToMove column]-10];
            [backTo setIsFilled:YES];
        }
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
    //NSLog(@"NUMBER IN A ROW %d", numberInARow);
    if (numberInARow == 4) {    //change back to 4, this and line below
        for(int i=0;i<4;i++){
            Card *tempCard = [[columns objectAtIndex:clmn] removeCardFromColumn];
            [tempCard removeFromSuperview];
            cardsFinished ++;
            //NSLog(@"CARDS DONE %d", cardsFinished);
            if (cardsFinished == 48) {
                CGRect labelFrame = CGRectMake(0, 0, 800, 100);
                UILabel *gameDone = [[UILabel alloc] initWithFrame:labelFrame];
                [gameDone setFont:[UIFont systemFontOfSize:42]];
                gameDone.textAlignment = UITextAlignmentCenter;
                gameDone.textColor = [UIColor whiteColor];
                gameDone.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
                [gameDone setText:[NSString stringWithFormat:@"GAME OVER. CONGRATULATIONS!"]];
                gameDone.center = CGPointMake(512, 500);
                gameDone.opaque = YES;
                [self.view addSubview:gameDone];
                
                
            }
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
        for(int k=row-1; k>(row-5);k--) {
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

<<<<<<< HEAD
-(void)postToServer {
    int moves = numberOfMoves;
    //other IVs and DVs to put in
    
    NSString *phpUrl = [NSString stringWithFormat:@"http://www.noelfeliciano.com/freebird.php?numberOfMoves=%d&user=1001", moves];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:phpUrl]];
    [request setHTTPMethod:@"POST"];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *get = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", get);
    
    /*NSString *post = [[NSString alloc] initWithFormat:@"numberOfMoves=%d&submit=yes", moves];
    
    NSString *postLength = [NSString stringWithFormat:@"%d",[post length]];
    
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    
    
    [request setHTTPBody:[post dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    if(conn) {
        NSLog(@"Connection Successful");
    } else {
        NSLog(@"Connection not made");
    }*/
    
    
    
}

=======
-(IBAction)statButtonPressed;
{
    NSLog(@"%@", @"hi");
    [self sendStats];
    //
    
}

-(void)sendStats
{
     NSLog(@"%@", @"there");
    //send stats from game to server
}

>>>>>>> 03366ed2f0e7636fddcc857d151912c8283c3466
@end
