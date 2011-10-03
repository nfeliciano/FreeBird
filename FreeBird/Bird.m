//
//  Bird.m
//  FreeBird
//
//  Created by Noel Feliciano on 11-09-26.
//  Copyright 2011 University of Victoria. All rights reserved.
//

#import "Bird.h"

@implementation Bird

@synthesize mainDictionary;
@synthesize family;
@synthesize speciesString;
@synthesize imagePath;
@synthesize species;
@synthesize set;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

/*In this initialization, the species of the bird and which set it's from is initialized
 *Everything else, i.e. family and the imagepath, is set in the setProperties
 *Again, this might be better off as a plist
 *Also, not sure if set is necessary, as we will likely be loading from all four sets*/
-(id)initWithSpecies:(Species)birdSpecies andSet:(Set)birdSet {
    self = [super init];
    if (self) {
        self.set = birdSet;
        self.species = birdSpecies;
        
        NSString *path = [[NSBundle mainBundle] bundlePath];
        NSString *dictPath = [path stringByAppendingPathComponent:@"BirdInfoPlist.plist"];
        mainDictionary = [NSDictionary dictionaryWithContentsOfFile:dictPath];
        
        NSDictionary *birdDictionary = [mainDictionary objectForKey:@"birdDictionary"];
        
        NSDictionary *thisBird;
        
        switch (self.species) {
            case AltamiraOriole:
                thisBird = [birdDictionary objectForKey:@"altamiraOriole"];
                break;
            case AudubonsOriole:
                thisBird = [birdDictionary objectForKey:@"audubonsOriole"];
                break;
            case BaltimoreOriole:
                thisBird = [birdDictionary objectForKey:@"baltimoreOriole"];
                break;
            default:
                break;
        }
        
        family = [thisBird objectForKey:@"family"];
        speciesString = [thisBird objectForKey:@"species"];
        NSArray *pose = [thisBird objectForKey:@"imagePath"];
        switch (self.set) {
            case setA:
                imagePath = [pose objectAtIndex:0];
                break;
            case setB:
                imagePath = [pose objectAtIndex:1];
                break;
            case setC:
                imagePath = [pose objectAtIndex:2];
                break;
            case setD:
                imagePath = [pose objectAtIndex:3];
                break;
            default:
                break;
        }
        
        //[self setProperties];
    }
    
    return self;
}

//Returns the species as a string for display on cards, again, the issue is that we will need to check all the species
-(NSString *) speciesAsString {
    return speciesString;
}

-(NSString *) familyAsString {
    return family;
}

-(NSString *) theImagePath {
    return imagePath;
}

-(NSString *) description {
    return [NSString stringWithFormat:@"%@ of %@ Family.\nImage Path: %@", [self speciesAsString], [self familyAsString], [self theImagePath]];
}

@end
