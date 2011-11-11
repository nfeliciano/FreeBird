//
//  Deck.m
//  FreeBird
//
//  Created by Noel Feliciano on 11-10-06.
//  Copyright 2011 University of Victoria. All rights reserved.
//

#import "Deck.h"

NSDictionary *speciesArray[12];

@implementation Deck

@synthesize mainDictionary;
@synthesize cardsLeft;
@synthesize cards;
@synthesize arrayCounter;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(id)initWithFamilyOne:(Family)familyOne FamilyTwo:(Family)familyTwo andFamilyThree:(Family)familyThree {
    self = [super init];
    if (self) {
        arrayCounter = 0;
        
        NSString *path = [[NSBundle mainBundle] bundlePath];
        NSString *dictPath = [path stringByAppendingPathComponent:@"BirdInfoPlist.plist"];
        mainDictionary = [NSDictionary dictionaryWithContentsOfFile:dictPath];
        
        NSDictionary *birdDictionary = [mainDictionary objectForKey:@"birdDictionary"];
        NSDictionary *familyDictionary;
        
        Family tempFamily;
        for (int i = 0; i < 3; i++) {
            if (i == 0) tempFamily = familyOne;
            if (i == 1) tempFamily = familyTwo;
            if (i == 2) tempFamily = familyThree;
            switch (tempFamily) {
                case Icteridae:
                    familyDictionary = [birdDictionary objectForKey:@"icteridae"];
                    break;
                case Cardinalidae:
                    familyDictionary = [birdDictionary objectForKey:@"cardinalidae"];
                    break;
                case Corvidae:
                    familyDictionary = [birdDictionary objectForKey:@"corvidae"];
                    break;
                default:
                    familyDictionary = nil;
                    break;
            }
            
            [self getRandomSpeciesFromDictionary:familyDictionary];
            
            
        }
        
    }
    
    return self;
}

-(void) dealloc {
    [cards release];
    [super dealloc];
}

-(void)getRandomSpeciesFromDictionary:(NSDictionary *)familyDictionary {
    NSArray *tempArray = [familyDictionary allKeys];
    for (int i = arrayCounter; i < arrayCounter + 4; i++) {
        NSString *tempDictString = [tempArray objectAtIndex:(arc4random() % [tempArray count])];
        NSDictionary *tempDictionary = [familyDictionary objectForKey:tempDictString];
        if ( (![tempDictionary isEqualToDictionary:speciesArray[arrayCounter]]) && (![tempDictionary isEqualToDictionary:speciesArray[arrayCounter+1]]) && (![tempDictionary isEqualToDictionary:speciesArray[arrayCounter+2]]) && (![tempDictionary isEqualToDictionary:speciesArray[arrayCounter+3]]) ){
            speciesArray[i] = tempDictionary;
        } else {
            i--;
        }
    }
    
    arrayCounter += 4;
}

-(NSMutableArray *)populateCardArray {
    
    cards = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 12; i++) {
        NSDictionary *thisBird = speciesArray[i];
        NSArray *pose = [thisBird objectForKey:@"imagePath"];
        
        for (int j = 0; j < 4; j++) {
            Card *aCard = [[Card alloc] initWithImagePath:[pose objectAtIndex:0] withSpecies:[thisBird objectForKey:@"species"] withFamily:[thisBird objectForKey:@"family"]];
            [cards addObject:aCard];
            [aCard release];
        }
        
    }
    
    [self shuffleDeck];
    
    return cards;
}

-(void)shuffleDeck {
    for (int i = 0; i < 30; i++) {
        [cards sortUsingFunction:randomSort context:nil];
    }
}

NSInteger randomSort(id obj1, id obj2, void *context) {
    return (arc4random()%3 - 1);
}



@end
