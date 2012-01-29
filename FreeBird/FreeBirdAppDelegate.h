//
//  FreeBirdAppDelegate.h
//  FreeBird
//
//  Created by Joseph Feliciano on 11-09-19.
//  Copyright 2011 University of Victoria. All rights reserved.
//

#import <UIKit/UIKit.h>
 
@class DifficultySettingsViewController;

@interface FreeBirdAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DifficultySettingsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet DifficultySettingsViewController *viewController;

@end
