//
//  FreeBirdAppDelegate.h
//  FreeBird
//
//  Created by Joseph Feliciano on 11-09-19.
//  Copyright 2011 University of Victoria. All rights reserved.
//

#import <UIKit/UIKit.h>
 
@class DifficultySettingsViewController;
//@class FreeBirdViewController;

@interface FreeBirdAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DifficultySettingsViewController *viewController;
    //FreeBirdViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet DifficultySettingsViewController *viewController;
//@property (nonatomic, retain) IBOutlet FreeBirdViewController *viewController;

@end
