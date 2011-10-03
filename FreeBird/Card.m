//
//  Card.m
//  FreeBird
//
//  Created by Noel Feliciano on 11-09-26.
//  Copyright 2011 University of Victoria. All rights reserved.
//

#import "Card.h"

/*Card UIView
 Pushed on to mainview*/
@implementation Card

@synthesize displayImage;
@synthesize displaySpecies;
@synthesize displayFamily;
@synthesize backgroundImage;

/*In this initialization, the card itself is initialized, that's the image being shown, the family, and the species
 *It isn't drawn itself until drawRect - not sure if this is the right thing to do, performance-wise*/
- (id)initWithImagePath:(NSString *)imagePath withSpecies:(NSString *)speciesString withFamily:(NSString *)familyString {
    NSString *path = imagePath;
    path = [path stringByAppendingFormat:@".jpg"];                          //these will be .pngs in the future
    UIImage *image = [UIImage imageNamed:@"cardBG.png"];
    CGRect frame = CGRectMake(0, 0, image.size.width, image.size.height);
    
    self = [self initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        displayImage = [UIImage imageNamed:path];
        backgroundImage = image;
        displayFamily = familyString;
        displaySpecies = speciesString;
        
    }
    
    return self;
}

-(void) dealloc {
    [super dealloc];
    [backgroundImage release];
    [displayImage release];
    [displayFamily release];
    [displaySpecies release];
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
    [backgroundImage drawAtPoint:CGPointMake(0, 0)];
    [displaySpecies drawAtPoint:CGPointMake(rect.size.width / 8, 10) withFont:[UIFont systemFontOfSize:14.0f]];
    
    UIImageView *birdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 15, displayImage.size.width, displayImage.size.height)];
    [birdImageView setImage:displayImage];
    birdImageView.contentMode = UIViewContentModeScaleAspectFit;
    CGRect temp = birdImageView.frame;
    temp.size.width = 110;
    birdImageView.frame = temp;
    birdImageView.opaque = NO;
    birdImageView.center = CGPointMake(birdImageView.center.x + 6, birdImageView.center.y - 155);
    [self addSubview:birdImageView];
    
    
    [birdImageView release];
}

@end
