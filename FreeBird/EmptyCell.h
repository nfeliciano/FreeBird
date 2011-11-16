//
//  EmptyCell.h
//  FreeBird
//
//  Created by Noel Feliciano on 11-11-16.
//  Copyright (c) 2011 University of Victoria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"

@interface EmptyCell : UIView {
    UIImage *displayImage;
    BOOL isAFreeCell;
    BOOL isFilled;
    CGPoint position;
    Card *freeCellIsFilledWith;
}

@property (nonatomic, assign) UIImage *displayImage;
@property (nonatomic, assign) BOOL isAFreeCell;
@property (nonatomic, assign) BOOL isFilled;
@property (nonatomic, assign) CGPoint position;
@property (nonatomic, assign) Card *freeCellIsFilledWith;

-(id)initWithXPos:(int)xPos andYPos:(int)yPos andIsAFreeCell:(BOOL)free;

@end
