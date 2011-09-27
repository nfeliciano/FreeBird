//
//  Bird.m
//  FreeBird
//
//  Created by Noel Feliciano on 11-09-26.
//  Copyright 2011 University of Victoria. All rights reserved.
//

#import "Bird.h"

@interface Bird(Private)
    -(NSString *) speciesAsString;
@end

@implementation Bird

@synthesize family;
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
        [self setProperties];
    }
    
    return self;
}

//Returns the species as a string for display on cards, again, the issue is that we will need to check all the species
-(NSString *) speciesAsString {
    switch (self.species) {
        case AltamiraOriole:
            return @"Altamira Oriole";
            break;
        case BaltimoreOriole:
            return @"Baltimore Oriole";
            break;
        case BlueJay:
            return @"Blue Jay";
            break;
        case GrayJay:
            return @"Gray Jay";
            break;
        default:
            return @"No species";
            break;
    }
}

/*Set the properties, that's the family string and the imagepath
 *Imagepath string has format familySpeciesSet*/

-(void) setProperties {
    switch (self.species) {
        case AltamiraOriole:
            self.family = @"Blackbirds and Orioles (Icteridae)";
            self.imagePath = [NSString stringWithFormat:@"icteridaeAltamiraOriole"];
            break;
        case BaltimoreOriole:
            self.family = @"Blackbirds and Orioles (Icteridae)";
            self.imagePath = [NSString stringWithFormat:@"icteridaeBaltimoreOriole"];
            break;
        case BlueJay:
            self.family = @"Crows, Jays and Magpies (Corvidae)";
            self.imagePath = [NSString stringWithFormat:@"corvidaeBlueJay"];
            break;
        case GrayJay:
            self.family = @"Crows, Jays and Magpies (Corvidae)";
            self.imagePath = [NSString stringWithFormat:@"corvidaeGrayJay"];
            break;
        default:
            self.family = @"No Family";
            self.imagePath = [NSString stringWithFormat:@"noSpecies"];
            break;
    }
    
    switch (self.set) {
        case setA:
            self.imagePath = [self.imagePath stringByAppendingString:@"setA"];
            break;
        case setB:
            self.imagePath = [self.imagePath stringByAppendingString:@"setB"];
            break;
        case setC:
            self.imagePath = [self.imagePath stringByAppendingString:@"setC"];
            break;
        case setD:
            self.imagePath = [self.imagePath stringByAppendingString:@"setD"];
            break;
        default:
            self.imagePath = [self.imagePath stringByAppendingString:@"noSet"];
            break;
            
    }
}

-(NSString *) description {
    return [NSString stringWithFormat:@"%@ of %@ Family", [self speciesAsString], self.family];
}

@end
