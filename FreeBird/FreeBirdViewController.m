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
    
    Deck *deck = [[Deck alloc] initWithFamilyOne:Icteridae FamilyTwo:Cardinalidae andFamilyThree:Corvidae];
    NSMutableArray *cards = [deck populateCardArray];
    
    int xPos = 110;
    for (int i =0; i < 6; i++) {
        columns[i] = [[Column alloc] initWithXPosition:xPos];
        xPos += 160;
    }
    
    [columns[3] addCardToColumn:[cards objectAtIndex:0]];
    Card *aCard = [columns[3] bottomCard];
    aCard.center = [aCard getCardPosition];
    [self.view addSubview:aCard];
    
    [columns[3] addCardToColumn:[cards objectAtIndex:1]];
    aCard = [columns[3] bottomCard];
    aCard.center = [aCard getCardPosition];
    [self.view addSubview:aCard];
    
    NSMutableArray *lol = [columns[3] allCardsInTheColumn];
    for (int i = 0; i < [lol count]; i++) {
        aCard = [lol objectAtIndex:i];
        NSLog(@"%@", [aCard speciesAsString]);
    }
    
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
    
    /*for (int i = 0; i < 6; i++) {
        Column *col = columns[i];
        NSLog(@"%d", [col numberOfCardsInColumn]);
    }*/
    
    /*for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 6; j++) {
            
        }
    }*/
    
    /*Card *cardDeck[48];
    for (int i = 0; i < 48; i++) {
        cardDeck[i] = [cards objectAtIndex:i];
    }
    
    cardDeck[0].center = CGPointMake(110, 300);
    [self.view addSubview:cardDeck[0]];
    
    cardDeck[1].center = CGPointMake(270, 300);
    [self.view addSubview:cardDeck[1]];
    
    cardDeck[2].center = CGPointMake(430, 300);
    [self.view addSubview:cardDeck[2]];
    
    cardDeck[3].center = CGPointMake(590, 300);
    [self.view addSubview:cardDeck[3]];
    
    cardDeck[4].center = CGPointMake(750, 300);
    [self.view addSubview:cardDeck[4]];
    
    cardDeck[5].center = CGPointMake(910, 300);
    [self.view addSubview:cardDeck[5]];
    
    
    
    
    cardDeck[6].center = CGPointMake(110, 330);
    [self.view addSubview:cardDeck[6]];
    
    cardDeck[7].center = CGPointMake(110, 360);
    [self.view addSubview:cardDeck[7]];
    
    cardDeck[8].center = CGPointMake(110, 440);
    [self.view addSubview:cardDeck[8]];
    
    cardDeck[9].center = CGPointMake(110, 520);
    [self.view addSubview:cardDeck[9]];
    
    cardDeck[10].center = CGPointMake(430, 380);
    [self.view addSubview:cardDeck[10]];
    
    cardDeck[11].center = CGPointMake(430, 460);
    [self.view addSubview:cardDeck[11]];
    
    cardDeck[12].center = CGPointMake(270, 380);
    [self.view addSubview:cardDeck[12]];
    
    cardDeck[13].center = CGPointMake(270, 460);
    [self.view addSubview:cardDeck[13]];*/
    
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
