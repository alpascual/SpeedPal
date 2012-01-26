//
//  Speed.h
//  SpeedPal
//
//  Created by Albert Pascual on 6/10/11.
//  Copyright 2011 Al. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "SpeedProtocol.h"

@interface Speed : NSObject <CLLocationManagerDelegate> {
    CLLocationManager *locMgr;
    
    id <SpeedProtocol> speedDelegate;
}

@property (nonatomic, retain) CLLocationManager *locMgr;
@property (retain, nonatomic) id <SpeedProtocol> speedDelegate;

- (void)startReadingLocation;

@end
