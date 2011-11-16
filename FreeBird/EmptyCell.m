//
//  EmptyCell.m
//  FreeBird
//
//  Created by Noel Feliciano on 11-11-16.
//  Copyright (c) 2011 University of Victoria. All rights reserved.
//

#import "EmptyCell.h"

@implementation EmptyCell

@synthesize displayImage;
@synthesize isAFreeCell;
@synthesize isFilled;
@synthesize position;
@synthesize freeCellIsFilledWith;

-(id)initWithXPos:(int)xPos andYPos:(int)yPos andIsAFreeCell:(BOOL)free {
    UIImage *image = [UIImage imageNamed:@"freeCell.png"];
    CGRect frame = CGRectMake(0, 0, image.size.width, image.size.height);    
    
    self = [self initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        displayImage = image;
        isAFreeCell = free;
        isFilled = NO;
        position = CGPointMake(xPos, yPos);
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [displayImage drawAtPoint:CGPointMake(0, 0)];
    [[UIColor whiteColor] set];
}


@end
