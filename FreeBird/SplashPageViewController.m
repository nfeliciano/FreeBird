//
//  SplashPageViewController.m
//  FreeBird
//
//  Created by CARTech Team on 12-03-06.
//  Copyright (c) 2012 University of Victoria. All rights reserved.
//

#import "SplashPageViewController.h"

@interface SplashPageViewController ()

@end

@implementation SplashPageViewController

@synthesize splashBackground;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setUserInteractionEnabled: YES];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"splash.png"]];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    DifficultySettingsViewController *diffSettVC = [[DifficultySettingsViewController alloc] init];
    [self presentModalViewController:diffSettVC animated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
