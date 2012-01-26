//
//  SpeedPalAppDelegate.h
//  SpeedPal
//
//  Created by Albert Pascual on 6/10/11.
//  Copyright 2011 Al. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpeedPalAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
