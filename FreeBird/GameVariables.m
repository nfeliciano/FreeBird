//
//  GameVariables.m
//  FreeBird
//
//  Created by Noel Feliciano on 12-01-28.
//  Copyright (c) 2012 University of Victoria. All rights reserved.
//

#import "GameVariables.h"

@implementation GameVariables

@synthesize difficulty;

static GameVariables *sharedInstance = nil;

+(GameVariables *)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    
    return sharedInstance;
}

//this gets called first, just like any other init
-(id) init {
    self = [super init];
    
    if (self) {
        //do the init stuff here
    }
    
    return self;
}

-(void) dealloc {
    [super dealloc];
}

+(id)allocWithZone:(NSZone *)zone {
    return [[self sharedInstance] retain];
}

-(id)copyWithZone:(NSZone *)zone {
    return self;
}

-(id)retain {
    return self;
}

-(NSUInteger)retainCount {
    return NSUIntegerMax;
}

-(oneway void)release {
    
}

-(id)autorelease {
    return self;
}

@end
