//
//  FreeBirdViewController.m
//  FreeBird
//
//  Created by Joseph Feliciano on 11-09-19.
//  Copyright 2011 University of Victoria. All rights reserved.
//

//comment comment lol

#import "FreeBirdViewController.h"
#import "Deck.h"
#import "Bird.h"
#import "Card.h"

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
    
    Card *cardDeck[48];
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
    [self.view addSubview:cardDeck[13]];
    
    
    /*All temporary code until released down there
     *Order: initialize bird -> initialize card using bird object descriptions -> position card ->add card to view -> release -> release -> release
     *This will get more complex when we get plists up. This was strictly to check if the bird model works*/
    
    /*Bird *altamiraOrioleSetA = [[Bird alloc] initWithSpecies:AltamiraOriole andSet:setA];
    NSLog(@"%@", altamiraOrioleSetA);
    Bird *altamiraOrioleSetB = [[Bird alloc] initWithSpecies:AltamiraOriole andSet:setB];
    Bird *baltimoreOrioleSetA = [[Bird alloc] initWithSpecies:BaltimoreOriole andSet:setA];
    
    Card *aCardF = [[Card alloc] initWithImagePath:altamiraOrioleSetB.imagePath withSpecies:[altamiraOrioleSetB speciesAsString] withFamily:altamiraOrioleSetB.familyString];
    aCardF.center = CGPointMake(512, 200);
    [self.view addSubview:aCardF];
    [aCardF release];
    
    Card *aCardG = [[Card alloc] initWithImagePath:altamiraOrioleSetB.imagePath withSpecies:[altamiraOrioleSetB speciesAsString] withFamily:altamiraOrioleSetB.familyString];
    aCardG.center = CGPointMake(512, 270);
    [self.view addSubview:aCardG];
    [aCardG release];
    
    Card *aCardH = [[Card alloc] initWithImagePath:altamiraOrioleSetB.imagePath withSpecies:[altamiraOrioleSetB speciesAsString] withFamily:altamiraOrioleSetB.familyString];
    aCardH.center = CGPointMake(512, 340);
    [self.view addSubview:aCardH];
    [aCardH release];
    
    Card *aCard = [[Card alloc] initWithImagePath:altamiraOrioleSetA.imagePath withSpecies:[altamiraOrioleSetA speciesAsString] withFamily:altamiraOrioleSetA.familyString];
    aCard.center = CGPointMake(512, 410);
    [self.view addSubview:aCard];
    [aCard release];
    
    Card *aCardB = [[Card alloc] initWithImagePath:altamiraOrioleSetB.imagePath withSpecies:[altamiraOrioleSetB speciesAsString] withFamily:altamiraOrioleSetB.familyString];
    aCardB.center = CGPointMake(512, 480);
    [self.view addSubview:aCardB];
    [aCardB release];
    
    Card *aCardC = [[Card alloc] initWithImagePath:altamiraOrioleSetB.imagePath withSpecies:[altamiraOrioleSetB speciesAsString] withFamily:altamiraOrioleSetB.familyString];
    aCardC.center = CGPointMake(512, 550);
    [self.view addSubview:aCardC];
    [aCardC release];
    
    Card *aCardD = [[Card alloc] initWithImagePath:altamiraOrioleSetB.imagePath withSpecies:[altamiraOrioleSetB speciesAsString] withFamily:altamiraOrioleSetB.familyString];
    aCardD.center = CGPointMake(512, 620);
    [self.view addSubview:aCardD];
    [aCardD release];
    
    

    
    Card *anotherCard = [[Card alloc] initWithImagePath:baltimoreOrioleSetA.imagePath withSpecies:[baltimoreOrioleSetA speciesAsString] withFamily:baltimoreOrioleSetA.familyString];
    anotherCard.center = CGPointMake(700, 384);
    [self.view addSubview:anotherCard];
    [anotherCard release];
    
    [altamiraOrioleSetA release];
    [altamiraOrioleSetB release];
    [baltimoreOrioleSetA release];*/
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
