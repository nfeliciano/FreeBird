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

@interface DifficultySettingsViewController : UIViewController {
    
    UIImageView *thirtySixCardsButton;
    UIImageView *fortyEightCardsButton;
    UIImageView *topLabelButton;
    UIImageView *bottomLabelButton;
    UIImageView *noLabelButton;
    UIImageView *startButton;
    
}

@property (nonatomic, assign) UIImageView *thirtySixCardsButton;
@property (nonatomic, assign) UIImageView *fortyEightCardsButton;
@property (nonatomic, assign) UIImageView *topLabelButton;
@property (nonatomic, assign) UIImageView *bottomLabelButton;
@property (nonatomic, assign) UIImageView *noLabelButton;
@property (nonatomic, assign) UIImageView *startButton;

@end
