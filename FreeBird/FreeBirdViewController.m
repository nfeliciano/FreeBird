//
//  FreeBirdViewController.m
//  FreeBird
//
//  Created by Joseph Feliciano on 11-09-19.
//  Copyright 2011 University of Victoria. All rights reserved.
//

#import "FreeBirdViewController.h"
#import "Bird.h"

@implementation FreeBirdViewController

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Bird *altamiraOrioleSetA = [[Bird alloc] initWithSpecies:AltamiraOriole andSet:setA];
    NSLog(@"%@", altamiraOrioleSetA);
    Bird *altamiraOrioleSetB = [[Bird alloc] initWithSpecies:AltamiraOriole andSet:setB];
    Bird *baltimoreOrioleSetA = [[Bird alloc] initWithSpecies:BaltimoreOriole andSet:setA];
    
    
    [altamiraOrioleSetA release];
    [altamiraOrioleSetB release];
    [baltimoreOrioleSetA release];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

-(void)dealloc {
    [super dealloc];
}

@end
