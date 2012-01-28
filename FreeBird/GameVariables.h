//
//  GameVariables.h
//  FreeBird
//
//  Created by Noel Feliciano on 12-01-28.
//  Copyright (c) 2012 University of Victoria. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameVariables : NSObject {
    NSString *difficulty;
}

@property (nonatomic, retain) NSString *difficulty;

+ (id)sharedInstance;

@end
