//
//  Speed.m
//  SpeedPal
//
//  Created by Albert Pascual on 6/10/11.
//  Copyright 2011 Al. All rights reserved.
//

#import "Speed.h"


@implementation Speed

@synthesize locMgr;
@synthesize speedDelegate;

- (id)init {
	self = [super init];
    
	if(self != nil) {
		self.locMgr = [[[CLLocationManager alloc] init] autorelease]; // Create new instance of locMgr
		self.locMgr.delegate = self; // Set the delegate as self.
	}
    
	return self;
}

#define kRequiredAccuracy 500.0 //meters
#define kMaxAge 10.0 //seconds

- (void)startReadingLocation {
    [self.locMgr startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation 
{

    NSTimeInterval ageInSeconds = [newLocation.timestamp timeIntervalSinceNow];

    //ensure you have an accurate and non-cached reading
    if( newLocation.horizontalAccuracy > kRequiredAccuracy || fabs(ageInSeconds) > kMaxAge )
    return;

    //get current speed  
    //TODO
    
    if ( newLocation.speed >= 0 )
    {
        NSString *temp = [[NSString alloc] initWithFormat:@"%.2f", (newLocation.speed *2.2369)];
        NSLog(@"Speed %@", temp);
        [self.speedDelegate speedChanged:temp:(newLocation.speed * 2.2369)];
        [temp release];
    }

    //this puts the GPS to sleep, saving power
    //[self.locMgr stopUpdatingLocation]; 

    //timer fires after 60 seconds, then stops
    //self.timer = [NSTimer scheduledTimerWithTimeInterval:60.0 target:self selector:@selector(timeIntervalEnded:) userInfo:nil repeats:NO];
}

//this is a wrapper method to fit the required selector signature
- (void)timeIntervalEnded:(NSTimer*)timer {
    [self startReadingLocation];
}
- (void)dealloc {
	[self.locMgr release];
	[super dealloc];
}

@end
