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
    CGPoint cardPosition;
    int column;
    BOOL isABottomCard;
}

@property (nonatomic, retain) UIImage *backgroundImage;
@property (nonatomic, retain) UIImage *displayImage;
@property (nonatomic, retain) NSString *displaySpecies;
@property (nonatomic, retain) NSString *displayFamily;
@property (nonatomic, assign) CGPoint cardPosition;
@property (nonatomic, assign) int column;
@property (nonatomic, assign) BOOL isABottomCard;

-(id) initWithImagePath:(NSString *)imagePath withSpecies:(NSString *)speciesString withFamily:(NSString *)familyString;
-(NSString *)speciesAsString;
-(NSString *)familyAsString;
-(void)setCoordinatesWithXPosition:(int)xPosition andYPosition:(int)yPosition;
-(CGPoint)getCardPosition;

@end
