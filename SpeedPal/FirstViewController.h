//
//  FirstViewController.h
//  SpeedPal
//
//  Created by Albert Pascual on 6/10/11.
//  Copyright 2011 Al. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AudioToolbox/AudioServices.h>
#import "Speed.h"
#import "SpeedProtocol.h"

@interface FirstViewController : UIViewController <SpeedProtocol> {

    Speed *speed;
    
    UILabel *speedLabel;
    UILabel *avgLabel;
    UILabel *maxLabel;
    
    double maxSpeed;
    double accumulatedSpeed;
    double countSpeed;
    
    UILabel *audioStatus;
    BOOL bIntervalSet;
    
    NSInteger lastInterval;
    
}

@property (nonatomic,retain) Speed *speed;
@property (nonatomic,retain) IBOutlet UILabel *speedLabel;
@property (nonatomic,retain) IBOutlet UILabel *avgLabel;
@property (nonatomic,retain) IBOutlet UILabel *maxLabel;
@property (nonatomic,retain) IBOutlet UILabel *audioStatus;

@property (nonatomic) double maxSpeed;
@property (nonatomic) double accumulatedSpeed;
@property (nonatomic) double countSpeed;

@property (nonatomic,retain) NSTimer *intervalTimer;
@property (nonatomic, retain) NSTimer *intervalSet;

- (IBAction) resetButtonPressed;

@end
