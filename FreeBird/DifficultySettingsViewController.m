//
//  DifficultySettingsViewController.m
//  FreeBird
//
//  Created by Noel Feliciano on 12-01-28.
//  Copyright (c) 2012 University of Victoria. All rights reserved.
//

#import "DifficultySettingsViewController.h"

@implementation DifficultySettingsViewController

@synthesize thirtySixCardsButton;
@synthesize fortyEightCardsButton;
@synthesize topLabelButton;
@synthesize bottomLabelButton;
@synthesize noLabelButton;
@synthesize startButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    GameVariables* changeVariables = [GameVariables sharedInstance];
    [changeVariables setLabelShowing:0];
    [changeVariables setNumberOfCards:36];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"difficultyScreenBG.png"]];
    
    CGRect startButtonImageRect = CGRectMake(0, 0, 934, 81);
    startButton = [[UIImageView alloc] initWithFrame:startButtonImageRect];
    startButton.userInteractionEnabled = YES;
    [startButton setImage:[UIImage imageNamed:@"startGameButton.png"]];
    startButton.opaque = NO;
    startButton.center = CGPointMake(512, 700);
    [self.view addSubview:startButton];
    
    CGRect labelButtonsImageRect = CGRectMake(0, 0, 303, 81);
    
    topLabelButton = [[UIImageView alloc] initWithFrame:labelButtonsImageRect];
    topLabelButton.userInteractionEnabled = YES;
    [topLabelButton setImage:[UIImage imageNamed:@"topLabelEmbossed.png"]];
    topLabelButton.opaque = NO;
    topLabelButton.center = CGPointMake(170, 500);
    [self.view addSubview:topLabelButton];
    
    bottomLabelButton = [[UIImageView alloc] initWithFrame:labelButtonsImageRect];
    bottomLabelButton.userInteractionEnabled = YES;
    [bottomLabelButton setImage:[UIImage imageNamed:@"bottomLabel.png"]];
    bottomLabelButton.opaque = NO;
    bottomLabelButton.center = CGPointMake(511, 500);
    [self.view addSubview:bottomLabelButton];
    
    noLabelButton = [[UIImageView alloc] initWithFrame:labelButtonsImageRect];
    noLabelButton.userInteractionEnabled = YES;
    [noLabelButton setImage:[UIImage imageNamed:@"noLabel.png"]];
    noLabelButton.opaque = NO;
    noLabelButton.center = CGPointMake(852, 500);
    [self.view addSubview:noLabelButton];
    
    CGRect numCardsButtonsImageRect = CGRectMake(0, 0, 453, 81);
    
    thirtySixCardsButton = [[UIImageView alloc] initWithFrame:numCardsButtonsImageRect];
    thirtySixCardsButton.userInteractionEnabled = YES;
    [thirtySixCardsButton setImage:[UIImage imageNamed:@"thirtySixCardsEmbossed.png"]];
    thirtySixCardsButton.opaque = NO;
    thirtySixCardsButton.center = CGPointMake(256, 300);
    [self.view addSubview:thirtySixCardsButton];
    
    fortyEightCardsButton = [[UIImageView alloc] initWithFrame:numCardsButtonsImageRect];
    fortyEightCardsButton.userInteractionEnabled = YES;
    [fortyEightCardsButton setImage:[UIImage imageNamed:@"fortyEightCards.png"]];
    fortyEightCardsButton.opaque = NO;
    fortyEightCardsButton.center = CGPointMake(768, 300);
    [self.view addSubview:fortyEightCardsButton];
    
    /*CGRect deckImageRect = CGRectMake(0, 0, 120, 168);
     x = 900;
     y = 85;
     deckNumberOne = [[UIImageView alloc] initWithFrame:deckImageRect];
     deckNumberOne.userInteractionEnabled = YES;
     [deckNumberOne setImage:[UIImage imageNamed:@"cardBack.png"]];
     deckNumberOne.opaque = NO;
     deckNumberOne.center = CGPointMake(x, y);
     deckNumberOne.contentMode = UIViewContentModeScaleAspectFit;
     CGRect temp = deckNumberOne.frame;
     temp.size.height = 90;
     deckNumberOne.frame = temp;
     [self.view addSubview:deckNumberOne];
     x += 20;
     y += 30;*/
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    GameVariables *difficultySettings = [GameVariables sharedInstance];
    
    UITouch *touch = [touches anyObject];
    if ([touch view] == startButton)
    {
        FreeBirdViewController *freeBirdVC = [[FreeBirdViewController alloc] init];
        [self presentModalViewController:freeBirdVC animated:YES];
    } else if ([touch view] == topLabelButton) {
        [topLabelButton setImage:[UIImage imageNamed:@"topLabelEmbossed.png"]];
        [bottomLabelButton setImage:[UIImage imageNamed:@"bottomLabel.png"]];
        [noLabelButton setImage:[UIImage imageNamed:@"noLabel.png"]];
        [difficultySettings setLabelShowing:0];
    } else if ([touch view] == bottomLabelButton) {
        [topLabelButton setImage:[UIImage imageNamed:@"topLabel.png"]];
        [bottomLabelButton setImage:[UIImage imageNamed:@"bottomLabelEmbossed.png"]];
        [noLabelButton setImage:[UIImage imageNamed:@"noLabel.png"]];
        [difficultySettings setLabelShowing:1];
    } else if ([touch view] == noLabelButton) {
        [topLabelButton setImage:[UIImage imageNamed:@"topLabel.png"]];
        [bottomLabelButton setImage:[UIImage imageNamed:@"bottomLabel.png"]];
        [noLabelButton setImage:[UIImage imageNamed:@"noLabelsEmbossed.png"]];
        [difficultySettings setLabelShowing:2];
    } else if ([touch view] == thirtySixCardsButton) {
        [thirtySixCardsButton setImage:[UIImage imageNamed:@"thirtySixCardsEmbossed.png"]];
        [fortyEightCardsButton setImage:[UIImage imageNamed:@"fortyEightCards.png"]];
        [difficultySettings setNumberOfCards:36];
    } else if ([touch view] == fortyEightCardsButton) {
        [thirtySixCardsButton setImage:[UIImage imageNamed:@"thirtySixCards.png"]];
        [fortyEightCardsButton setImage:[UIImage imageNamed:@"fortyEightCardsEmbossed.png"]];
        [difficultySettings setNumberOfCards:48];
    }
    
}

@end
