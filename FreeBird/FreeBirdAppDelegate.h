//
//  FreeBirdAppDelegate.h
//  FreeBird
//
//  Created by Joseph Feliciano on 11-09-19.
//  Copyright 2011 University of Victoria. All rights reserved.
//

#import <UIKit/UIKit.h>
 
@class FreeBirdViewController;

@interface FreeBirdAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FreeBirdViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet FreeBirdViewController *viewController;

@end
