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
BOOL speciesInARow;
int deckCounter;

@implementation FreeBirdViewController

@synthesize freeCells;
@synthesize emptyColumnCells;
@synthesize columns;
@synthesize cards;
@synthesize cardToMove;
@synthesize cardToMove0;
@synthesize cardToMove1;
@synthesize cardToMove2;
@synthesize cardToMove3;
@synthesize touchStart;
@synthesize deckNumberOne;
@synthesize deckNumberTwo;
@synthesize deckNumberThree;
@synthesize numberOfMoves;
@synthesize numberOfErrors;
@synthesize timeInSeconds;
@synthesize startDate;
@synthesize freeCellsUsed;
@synthesize moveCounter;
@synthesize errorCounter;
@synthesize timer;
@synthesize cardsFinished;
@synthesize difficultyLevel;

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
    
    //GameVariables* changeVariables = [GameVariables sharedInstance];
    //[changeVariables setDifficulty:[NSString stringWithFormat:@"Easy"]];
    
    [super viewDidLoad];
    columns = [[NSMutableArray alloc] init];
    freeCells = [[NSMutableArray alloc] init];
    emptyColumnCells = [[NSMutableArray alloc] init];
    
    [self setUpGameBoard];
    
    areMoving = NO;
    cardToMove = nil;
    cardToMove0 = nil;
    cardToMove1 = nil;
    cardToMove2 = nil;
    cardToMove3 = nil;
    touchStart = 0;
    deckCounter = 0;
    numberOfMoves = 0;
    numberOfErrors = 0;
    freeCellsUsed = 0;
    cardsFinished = 0;
    
    CGRect labelFrame = CGRectMake(0, 0, 160, 30);
    moveCounter = [[UILabel alloc] initWithFrame:labelFrame];
    [moveCounter setFont:[UIFont systemFontOfSize:26]];
    moveCounter.textAlignment = UITextAlignmentLeft;
    moveCounter.textColor = [UIColor whiteColor];
    moveCounter.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    [moveCounter setText:[NSString stringWithFormat:@"Moves: %d", numberOfMoves]];
    moveCounter.center = CGPointMake(780, 40);
    moveCounter.opaque = YES;
    [self.view addSubview:moveCounter];
    
    CGRect labelFrame1 = CGRectMake(0, 0, 160, 30);
    errorCounter = [[UILabel alloc] initWithFrame:labelFrame1];
    [errorCounter setFont:[UIFont systemFontOfSize:26]];
    errorCounter.textAlignment = UITextAlignmentLeft;
    errorCounter.textColor = [UIColor whiteColor];
    errorCounter.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    [errorCounter setText:[NSString stringWithFormat:@"Errors: %d", numberOfErrors]];
    errorCounter.center = CGPointMake(780, 70);
    errorCounter.opaque = YES;
    [self.view addSubview:errorCounter];
    
    timer = [[UILabel alloc] initWithFrame:labelFrame1];
    [timer setTextAlignment:UITextAlignmentCenter];
    [timer setTextColor:[UIColor whiteColor]];
    [timer setFont:[UIFont systemFontOfSize:32]];
    [timer setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    [timer setText:[NSString stringWithFormat:@"0:00"]];
    [timer setCenter:CGPointMake(512, 700)];
    [timer setOpaque:YES];
    [self.view addSubview:timer];
    
    startDate = [[NSDate date]retain];
    timeInSeconds = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
    /*CGRect labelFrame2 = CGRectMake(0, 0, 300, 30);
    freeCellCounter = [[UILabel alloc] initWithFrame:labelFrame2];
    [freeCellCounter setFont:[UIFont systemFontOfSize:26]];
    freeCellCounter.textAlignment = UITextAlignmentLeft;
    freeCellCounter.textColor = [UIColor whiteColor];
    freeCellCounter.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    [freeCellCounter setText:[NSString stringWithFormat:@"FreeCells Used: %d", freeCellsUsed]];
    freeCellCounter.center = CGPointMake(780, 100);
    freeCellCounter.opaque = YES;
    [self.view addSubview:freeCellCounter];*/
    
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

- (void)updateTimer {
    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:startDate];
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    NSString *timeString = [dateFormatter stringFromDate:timerDate];
    [timer setText:timeString];
    [dateFormatter release];
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
    AudioServicesDisposeSystemSoundID(audioEffect);
    [freeCells release];
    [deckNumberOne release];
    [deckNumberTwo release];
    [deckNumberThree release];
    [startDate release];
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
    CGRect buttonRect = CGRectMake(0, 0, 215, 108);
    button = [[UIImageView alloc] initWithFrame:buttonRect];    //size
    button.userInteractionEnabled = YES;                        //enable interaction
    [button setImage:[UIImage imageNamed:@"sendToServer.png"]];   //set the image for the button
    button.opaque = NO;                                         //not opaque
    button.center = CGPointMake(512, 384);                      //center the button
    button.contentMode = UIViewContentModeScaleAspectFit;
}

-(void) playSound : (NSString *) fName : (NSString *) ext
{
    NSString *path  = [[NSBundle mainBundle] pathForResource : fName ofType :ext];
    if ([[NSFileManager defaultManager] fileExistsAtPath : path])
    {
        NSURL *pathURL = [NSURL fileURLWithPath : path];
        AudioServicesCreateSystemSoundID((CFURLRef) pathURL, &audioEffect);
        AudioServicesPlaySystemSound(audioEffect);
    }
    else
    {
        NSLog(@"error, file not found: %@", path);
    }
}
-(void)updateMoveCounter {
    [moveCounter setText:[NSString stringWithFormat:@"Moves: %d", numberOfMoves]];
    [errorCounter setText:[NSString stringWithFormat:@"Errors: %d", numberOfErrors]];
    //[freeCellCounter setText:[NSString stringWithFormat:@"FreeCells Used: %d", freeCellsUsed]];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if ([touch view] == button)
    {
        [self postToServer];
        return;
    }
    if ([touch view] != cardToMove && cardToMove != nil){
        return;
    }
    if (areMoving){
        CGPoint start = [cardToMove getCardPosition];
        cardToMove.center = start;
    }
    areMoving = YES;
    GameVariables *difficultySettings = [GameVariables sharedInstance];
    int numCards = [difficultySettings numberOfCards];
    
    if (cardsFinished == numCards) {      //change for 48!!
        return;
    }
    
    for (int i = 0; i < 3; i++) {
        if ([touch view] == deckNumberOne || [touch view] == deckNumberTwo || [touch view] == deckNumberThree) {
            if (numCards == 36) {
                if (deckCounter == 0) {
                    //NSLog(@"%d", deckCounter);
                    for (int j=0; j<4; j++) {
                        [self playSound:@"twoCards" :@"caf"];
                        [self addRowOfCards];
                        for (int x=0;x<4;x++){
                            [self inARow:x];
                        }
                    }
                    [deckNumberThree removeFromSuperview];//temp for 36 cards
                    break;
                } else if (deckCounter == 24) {
                    [self playSound:@"twoCards" :@"caf"];
                    [self addRowOfCards];
                    for (int x=0;x<4;x++){
                        [self inARow:x];
                    }
                    [deckNumberTwo removeFromSuperview];//temp for 36
                    //[deckNumberThree removeFromSuperview];
                    break;
                } else if (deckCounter == 30) {
                    [deckNumberOne removeFromSuperview];//temp for 36
                    [self playSound:@"twoCards" :@"caf"];
                    [self addRowOfCards];
                    for (int x=0;x<4;x++){
                        [self inARow:x];
                    }
                    break;
                } /*else if (deckCounter == 36) {
                   [self addRowOfCards];
                   [deckNumberTwo removeFromSuperview];
                   return;
                   } else if (deckCounter == 42) {
                   [self addRowOfCards];
                   [deckNumberOne removeFromSuperview];
                   return;
                   }*/ else {
                       break;
                   }
            } else {
                if (deckCounter == 0) {
                    //NSLog(@"%d", deckCounter);
                    for (int j=0; j<4; j++) {
                        [self playSound:@"twoCards" :@"caf"];
                        [self addRowOfCards];
                    }
                    for (int x=0;x<4;x++){
                        [self inARow:x];
                    }
                    break;
                } else if (deckCounter == 24) {
                    [self playSound:@"twoCards" :@"caf"];
                    [self addRowOfCards];
                    [deckNumberThree removeFromSuperview];
                    for (int x=0;x<4;x++){
                         [self inARow:x];
                    }
                    break;
                } else if (deckCounter == 30) {
                    [self playSound:@"twoCards" :@"caf"];
                    [self addRowOfCards];
                    for (int x=0;x<4;x++){
                        [self inARow:x];
                    }
                    break;
                } else if (deckCounter == 36) {
                    [self playSound:@"twoCards" :@"caf"];
                    [self addRowOfCards];
                    [deckNumberTwo removeFromSuperview];
                    for (int x=0;x<4;x++){
                        [self inARow:x];
                    }
                    break;
                } else if (deckCounter == 42) {
                    [self playSound:@"twoCards" :@"caf"];
                    [self addRowOfCards];
                    [deckNumberOne removeFromSuperview];
                    for (int x=0;x<4;x++){
                        [self inARow:x];
                    }
                    break;
                } else {
                    break;
                }
            }
        }
    }
    
    for (int i=0; i<4; i++) {
        EmptyCell *freeCell = [freeCells objectAtIndex:i];
        cardToMove = [freeCell freeCellIsFilledWith];
        if ([touch view] == cardToMove) {
            //NSLog(@"%@", [cardToMove speciesAsString]);
            [self playSound:@"singleCard" :@"caf"];
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
                [self playSound:@"singleCard" :@"caf"];
                //NSLog(@"%@", [cardToMove speciesAsString]);
                if ([cardToMove isABottomCard]) {
                    areWePeeking = NO;
                    speciesInARow = NO;
                } else {
                    if ([self checkBelow:i fromRow:j]) {
                        areWePeeking = NO;
                        speciesInARow = YES;
                    } else {
                        areWePeeking = YES;
                        speciesInARow = NO;
                    }
                }
                return;
            }
            cardToMove = nil;
        }
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (cardToMove == nil) {
        return;
    }
    areMoving = NO;
    //checks to see if any objects were touched
    UITouch *touch = [touches anyObject];
    
    //traverses the array of cards to see what card was touched
    if ([touch view] == cardToMove) 
    {
        if (!areWePeeking && !speciesInARow) {
            //Moves card assigned to cardToMove to the touched position
            [self.view bringSubviewToFront:cardToMove];
            CGPoint location = [touch locationInView:self.view];
            cardToMove.center = location;
            return;
        } else {
            CGPoint location = [touch locationInView:self.view];
            CGPoint temp;
            if (!speciesInARow) temp = CGPointMake(cardToMove.center.x, location.y);        //if multiple cards are being moved
            else temp = CGPointMake(location.x, location.y);                                //if not
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
                CGPoint moveOthers;
                if (!speciesInARow) moveOthers = CGPointMake(cardToMove.center.x, location.y + ((j - i) * 80));
                else moveOthers = CGPointMake(location.x, location.y + ((j - i) * 80));
                Card *moveTempCard = [thisColumn objectAtIndex:j];
                [self.view bringSubviewToFront:moveTempCard];
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
    [self playSound:@"singleCard" :@"caf"];
    
    //If we're only moving one card
    if (!areWePeeking && !speciesInARow) {
        if ([cardToMove column] < 10) [[columns objectAtIndex:[cardToMove column]] removeCardFromColumn];       //not in a freecell
        
        //add card to free cell if in contact with it
        for (int i = 0; i < 4; i++) {
            EmptyCell *empty = [freeCells objectAtIndex:i];
            if (CGRectIntersectsRect([cardToMove frame], [empty frame])) {
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
                if ([cardToMove column] >= 10) {
                    CGPoint start = [cardToMove getCardPosition];
                    cardToMove.center = start;
                    EmptyCell *backTo = [freeCells objectAtIndex:[cardToMove column]-10];
                    [backTo setIsFilled:YES];
                    return;
                }
                cardToMove.center = [empty position];
                [cardToMove setCardPosition:[empty position]];
                [cardToMove setColumn:10+i];
                [empty setIsFilled:YES];
                [empty setFreeCellIsFilledWith:cardToMove];
                numberOfMoves++;
                freeCellsUsed++;
                NSLog(@"%d", freeCellsUsed);
                [self updateMoveCounter];
                cardToMove = nil;
                return;
            }
        }
        
        //add card to nonempty column
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
                        cardToMove = nil;
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
                cardToMove = nil;
                numberOfErrors++;
                [self updateMoveCounter];
                return;
            }
        }
        
        //add card to empty column
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
                        cardToMove = nil;
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
    } else if (!areWePeeking && speciesInARow) {
        //get the number that the card is on the column
        int row;
        Column *tempColumn = [columns objectAtIndex:[cardToMove column]];
        NSMutableArray *tempColumnArray = [tempColumn allCardsInTheColumn];
        Card *tempCard;
        for (int i = 0; i < [tempColumn cardsInColumn]; i++) {
            tempCard = [tempColumnArray objectAtIndex:i];
            if (tempCard == cardToMove) {
                row = i;
                break;
            }
        }
        
        //check if cardToMove intersects with other card
        //remove card from current column
        //add card to new column
        //set card's position
        int numCardsInCol = [tempColumn cardsInColumn];
        for (int col = 0; col<6; col++) {
            Card *tempCard = [[columns objectAtIndex:col] bottomCard];
            if (col != [cardToMove column]) {
                if (CGRectIntersectsRect([cardToMove frame], [tempCard frame])) {
                    if ([self compareFamiliesOfCardA:cardToMove andCardB:tempCard]) {
                        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
                        for (int i = row; i < numCardsInCol; i++) {
                            cardToMove = [tempColumnArray objectAtIndex:i];
                            [tempArray insertObject:cardToMove atIndex:0];
                        }
                        
                        for (int i = 0; i < [tempArray count]; i++) {
                            cardToMove = [tempArray objectAtIndex:i];
                            [[columns objectAtIndex:[cardToMove column]] removeCardFromColumn];
                            [cardToMove setColumn:col];
                            if (cardToMove != nil) {
                                [[columns objectAtIndex:col] addCardToColumn:cardToMove];
                                cardToMove.center = [cardToMove getCardPosition];
                                [self.view bringSubviewToFront:cardToMove];
                                [self inARow:col];
                            }
                        }
                        
                        numberOfMoves++;
                        [self updateMoveCounter];
                        [tempArray release];
                        
                        speciesInARow = NO;
                        cardToMove = nil;
                        return;
                    }
                }
            }
        }
        
        for (int col = 0; col < 6; col++) {
            if ([[columns objectAtIndex:col] cardsInColumn] == 0) {
                EmptyCell *emptyColumn = [emptyColumnCells objectAtIndex:col];
                if (CGRectIntersectsRect([cardToMove frame], [emptyColumn frame])) {
                    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
                    for (int i = row; i < numCardsInCol; i++) {
                        cardToMove = [tempColumnArray objectAtIndex:i];
                        [tempArray insertObject:cardToMove atIndex:0];
                    }
                    
                    for (int i = 0; i < [tempArray count]; i++) {
                        cardToMove = [tempArray objectAtIndex:i];
                        [[columns objectAtIndex:[cardToMove column]] removeCardFromColumn];
                        [cardToMove setColumn:col];
                        if (cardToMove != nil) {
                            [[columns objectAtIndex:col] addCardToColumn:cardToMove];
                            cardToMove.center = [cardToMove getCardPosition];
                            [self.view bringSubviewToFront:cardToMove];
                            [self inARow:col];
                        }
                    }
                    
                    numberOfMoves++;
                    [self updateMoveCounter];
                    [tempArray release];
                    speciesInARow = NO;
                    cardToMove = nil;
                    return;
                }
            }
        }
        
        for (int i = row; i < numCardsInCol; i++) {
            //NSLog(@"THIS NUMBER %d AND THIS ONE %d, ALSO THIS %d", i, row, [tempColumn cardsInColumn]);
            cardToMove = [tempColumnArray objectAtIndex:i];
            CGPoint start = [cardToMove getCardPosition];
            //NSLog(@"FROM %f TO %f", cardToMove.center.x, start.x);
            cardToMove.center = start;
        }
        speciesInARow = NO;
        cardToMove = nil;
        return;
        
    } else {
        NSMutableArray *thisColumn = [[columns objectAtIndex:[cardToMove column]] allCardsInTheColumn];
        for (int i = 0; i < [thisColumn count]; i++) {
            Card *tempCard = [thisColumn objectAtIndex:i];
            CGPoint start = [tempCard getCardPosition];
            tempCard.center = start;
        }
    }
    cardToMove = nil;
}

-(BOOL)compareSpeciesOfCardA:(Card *)aCardA andCardB:(Card *)aCardB {
    NSString *movedCard = [aCardA speciesAsString];
    NSString *cardInColumn = [aCardB speciesAsString];
    
    return [movedCard isEqualToString:cardInColumn];
}

-(BOOL)compareFamiliesOfCardA:(Card *)aCardA andCardB:(Card *)aCardB {
    
    NSString *movedCard = [aCardA familyAsString];
    NSString *cardInColumn = [aCardB familyAsString];
    
    //NSLog(@"%d", [movedCard isEqualToString:cardInColumn]);
    return [movedCard isEqualToString:cardInColumn];  
}



-(void)inARow:(int )clmn {
    GameVariables *difficultySettings = [GameVariables sharedInstance];
    int numCards = [difficultySettings numberOfCards];
    int numberInARow = [self checkAbove:clmn];
    //NSLog(@"NUMBER IN A ROW %d", numberInARow);
    if (numberInARow == 4) {    //change back to 4, this and line below
        //******ADD POOF HERE******//
        for(int i=0;i<4;i++){
            Card *tempCard = [[columns objectAtIndex:clmn] removeCardFromColumn];
            UIImage *image = [UIImage imageNamed:@"poofAnim1.png"];
            CGRect frame = CGRectMake(0, 0, image.size.width / 4, image.size.height / 4);  
            UIImageView *poof = [[UIImageView alloc] initWithFrame:frame];
            [poof setAnimationImages:[NSArray arrayWithObjects:
                                      [UIImage imageNamed:@"poofAnim1.png"], 
                                      [UIImage imageNamed:@"poofAnim2.png"],
                                      [UIImage imageNamed:@"poofAnim3.png"],
                                      [UIImage imageNamed:@"poofAnim4.png"],
                                      [UIImage imageNamed:@"poofAnim5.png"],
                                      [UIImage imageNamed:@"poofAnim6.png"],
                                      nil]
             ];
            [poof setAnimationDuration:0.5];
            [poof setAnimationRepeatCount:1];
            [poof startAnimating];
            [poof setCenter:[tempCard center]];
            [self.view addSubview:poof];
            [tempCard removeFromSuperview];
            [image release];
            [poof release];
            cardsFinished ++;
            //NSLog(@"CARDS DONE %d", cardsFinished);
            if (cardsFinished == numCards) {
                CGRect labelFrame = CGRectMake(0, 0, 800, 100);
                UILabel *gameDone = [[UILabel alloc] initWithFrame:labelFrame];
                [gameDone setFont:[UIFont systemFontOfSize:42]];
                gameDone.textAlignment = UITextAlignmentCenter;
                gameDone.textColor = [UIColor whiteColor];
                gameDone.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
                [gameDone setText:[NSString stringWithFormat:@"GAME OVER"]];
                gameDone.center = CGPointMake(512, 500);
                gameDone.opaque = YES;
                [self.view addSubview:gameDone];
                [self.view addSubview:button];
                [self updateTimer];
                [timeInSeconds invalidate];
                timeInSeconds = nil;
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
                //NSLog(@"%d", k);
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

-(BOOL)checkBelow:(int)clmn fromRow:(int)row {
    BOOL areInARow;
    int numCardsInCol = [[columns objectAtIndex:clmn] numberOfCardsInColumn];
    NSMutableArray *tempColumn = [[columns objectAtIndex:clmn] allCardsInTheColumn];
    NSMutableString *currentCard = [NSMutableString stringWithString:[cardToMove speciesAsString]];
    NSMutableString *nextCard = nil;
    
    if ([cardToMove isABottomCard]) return FALSE;
    
    for (int i = row; i < numCardsInCol; i++) {
        Card *tempCard = [tempColumn objectAtIndex:i];
        nextCard = [NSMutableString stringWithString:[tempCard speciesAsString]];
        if (![currentCard isEqualToString:nextCard]) {
            areInARow = FALSE;
            //NSLog(@"NOPE FALSE RETURN");
            return areInARow;
        }
    }
    //NSLog(@"THIS RETURNED TRUE");
    areInARow = TRUE;
    return areInARow;
}

-(void)postToServer {
    int moves = numberOfMoves;
    int errors = numberOfErrors;
    int frees = freeCellsUsed;
    GameVariables* changeVariables = [GameVariables sharedInstance];
    int userID = [changeVariables userID];
    int studyNo = [changeVariables studyNumber];
    
    //other IVs and DVs to put in
    
    NSString *phpUrl = [NSString stringWithFormat:@"http://www.noelfeliciano.com/freebird.php?user=%d&numberOfMoves=%d&studyNum=%d&errors=%d&freeCells=%d&time=%@", userID, moves, studyNo, errors, frees, [timer text]];
    //NSString *phpUrl = [NSString stringWithFormat:@"http://www.noelfeliciano.com/freebird.php?user=%d&studyNum=%d", userID, studyNo];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:phpUrl]];
    [request setHTTPMethod:@"POST"];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *get = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Your Data has been uploaded" message: [NSString stringWithFormat:@"Your number of moves: %d has been uploaded", moves] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
    [alert release];
    
    //NSLog(@"You said: %@", get);
    
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

-(void)sendStats
{
    //NSLog(@"%@", @"there");
    //[self postToServer];
    //send stats from game to server
}

@end
