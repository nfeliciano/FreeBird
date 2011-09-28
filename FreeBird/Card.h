//
//  Card.h
//  FreeBird
//
//  Created by Noel Feliciano on 11-09-26.
//  Copyright 2011 University of Victoria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Card : UIView {
    UIImage *displayImage;
    UIImage *backgroundImage;
    NSString *displaySpecies;
    NSString *displayFamily;
    
}

@property (nonatomic, retain) UIImage *backgroundImage;
@property (nonatomic, retain) UIImage *displayImage;
@property (nonatomic, retain) NSString *displaySpecies;
@property (nonatomic, retain) NSString *displayFamily;

-(id) initWithImagePath:(NSString *)imagePath withSpecies:(NSString *)speciesString withFamily:(NSString *)familyString;


@end
