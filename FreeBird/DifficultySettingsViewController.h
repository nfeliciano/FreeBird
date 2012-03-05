//
//  DifficultySettingsViewController.h
//  FreeBird
//
//  Created by Noel Feliciano on 12-01-28.
//  Copyright (c) 2012 University of Victoria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameVariables.h"
#import "FreeBirdViewController.h"

@interface DifficultySettingsViewController : UIViewController <UITextFieldDelegate> {
    
    UIImageView *thirtySixCardsButton;
    UIImageView *fortyEightCardsButton;
    UIImageView *topLabelButton;
    UIImageView *bottomLabelButton;
    UIImageView *noLabelButton;
    UIImageView *startButton;
    UITextField *participantField;
    UITextField *studyNoField;
    NSString *participantID;
    NSString *studyNumber;
    
}

@property (nonatomic, assign) UIImageView *thirtySixCardsButton;
@property (nonatomic, assign) UIImageView *fortyEightCardsButton;
@property (nonatomic, assign) UIImageView *topLabelButton;
@property (nonatomic, assign) UIImageView *bottomLabelButton;
@property (nonatomic, assign) UIImageView *noLabelButton;
@property (nonatomic, assign) UIImageView *startButton;
@property (nonatomic, assign) UITextField *participantField;
@property (nonatomic, assign) UITextField *studyNoField;
@property (nonatomic, assign) NSString *participantID;
@property (nonatomic, assign) NSString *studyNumber;

@end
