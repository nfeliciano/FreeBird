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
@synthesize participantField;
@synthesize studyNoField;
@synthesize participantID;
@synthesize studyNumber;

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
    topLabelButton.center = CGPointMake(170, 410);
    [self.view addSubview:topLabelButton];
    
    bottomLabelButton = [[UIImageView alloc] initWithFrame:labelButtonsImageRect];
    bottomLabelButton.userInteractionEnabled = YES;
    [bottomLabelButton setImage:[UIImage imageNamed:@"bottomLabel.png"]];
    bottomLabelButton.opaque = NO;
    bottomLabelButton.center = CGPointMake(511, 410);
    [self.view addSubview:bottomLabelButton];
    
    noLabelButton = [[UIImageView alloc] initWithFrame:labelButtonsImageRect];
    noLabelButton.userInteractionEnabled = YES;
    [noLabelButton setImage:[UIImage imageNamed:@"noLabel.png"]];
    noLabelButton.opaque = NO;
    noLabelButton.center = CGPointMake(852, 410);
    [self.view addSubview:noLabelButton];
    
    CGRect numCardsButtonsImageRect = CGRectMake(0, 0, 453, 81);
    
    thirtySixCardsButton = [[UIImageView alloc] initWithFrame:numCardsButtonsImageRect];
    thirtySixCardsButton.userInteractionEnabled = YES;
    [thirtySixCardsButton setImage:[UIImage imageNamed:@"thirtySixCardsEmbossed.png"]];
    thirtySixCardsButton.opaque = NO;
    thirtySixCardsButton.center = CGPointMake(256, 250);
    [self.view addSubview:thirtySixCardsButton];
    
    fortyEightCardsButton = [[UIImageView alloc] initWithFrame:numCardsButtonsImageRect];
    fortyEightCardsButton.userInteractionEnabled = YES;
    [fortyEightCardsButton setImage:[UIImage imageNamed:@"fortyEightCards.png"]];
    fortyEightCardsButton.opaque = NO;
    fortyEightCardsButton.center = CGPointMake(768, 250);
    [self.view addSubview:fortyEightCardsButton];
    
    CGRect participantFieldRect = CGRectMake(0, 0, 611, 81);
    participantField = [[UITextField alloc] initWithFrame:participantFieldRect];
    [participantField setTextColor: [UIColor blackColor]];
    [participantField setBorderStyle: UITextBorderStyleNone];
    [participantField setPlaceholder:@"000000"];
    [participantField setText:@"000000"];
    [participantField setTextAlignment:UITextAlignmentCenter];
    [participantField setBackground:[UIImage imageNamed:@"participantTextField.png"]];
    [participantField setCenter:CGPointMake(330, 560)];
    [participantField setAdjustsFontSizeToFitWidth:YES];
    [participantField setFont: [UIFont systemFontOfSize:50.0]];
    [participantField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [participantField setKeyboardType: UIKeyboardTypeNumberPad];
    [participantField setClearButtonMode: UITextFieldViewModeWhileEditing];
    [participantField setReturnKeyType:UIReturnKeyDone];
    [participantField setDelegate: self];
    [participantField setClearsOnBeginEditing:YES];
    [self.view addSubview:participantField];
    
    CGRect studyNumberRect = CGRectMake(0, 0, 303, 81);
    studyNoField = [[UITextField alloc] initWithFrame:studyNumberRect];
    [studyNoField setTextColor: [UIColor blackColor]];
    [studyNoField setBorderStyle: UITextBorderStyleNone];
    [studyNoField setText:@"0"];
    [studyNoField setPlaceholder:@"0"];
    [studyNoField setTextAlignment:UITextAlignmentCenter];
    [studyNoField setBackground:[UIImage imageNamed:@"studyNoTextField.png"]];
    [studyNoField setCenter:CGPointMake(852, 560)];
    [studyNoField setAdjustsFontSizeToFitWidth:YES];
    [studyNoField setFont: [UIFont systemFontOfSize:50.0]];
    [studyNoField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [studyNoField setKeyboardType: UIKeyboardTypeNumberPad];
    [studyNoField setClearButtonMode: UITextFieldViewModeWhileEditing];
    [studyNoField setReturnKeyType:UIReturnKeyDone];
    [studyNoField setDelegate: self];
    [studyNoField setClearsOnBeginEditing:YES];
    [self.view addSubview:studyNoField];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    participantID = participantField.text;
    studyNumber = studyNoField.text;
    GameVariables* changeVariables = [GameVariables sharedInstance];
    [changeVariables setUserID:[participantID intValue]];
    [changeVariables setStudyNumber:[studyNumber intValue]];
    [participantField resignFirstResponder];
    [studyNoField resignFirstResponder];
    return YES;
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
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    GameVariables *difficultySettings = [GameVariables sharedInstance];
    
    UITouch *touch = [touches anyObject];
    if ([touch view] == startButton)
    {
        FreeBirdViewController *freeBirdVC = [[[FreeBirdViewController alloc] init] autorelease];
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
