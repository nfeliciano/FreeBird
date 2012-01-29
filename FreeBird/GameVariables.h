//
//  GameVariables.h
//  FreeBird
//
//  Created by Noel Feliciano on 12-01-28.
//  Copyright (c) 2012 University of Victoria. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameVariables : NSObject {
    int numberOfCards;
    int labelsShowing;
}

@property (nonatomic, assign) int numberOfCards;
@property (nonatomic, assign) int labelShowing;

+ (id)sharedInstance;

@end
