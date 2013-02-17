//
//  FirstViewController.m
//  SpeedPal
//
//  Created by Albert Pascual on 6/10/11.
//  Copyright 2011 Al. All rights reserved.
//

#import "FirstViewController.h"



@implementation FirstViewController

@synthesize speed;
@synthesize speedLabel, avgLabel, maxLabel;
@synthesize maxSpeed;
@synthesize accumulatedSpeed, countSpeed, audioStatus;
@synthesize intervalTimer;
@synthesize intervalSet = _intervalSet;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.maxSpeed = -1;
    self.accumulatedSpeed = 0; 
    self.countSpeed = 0;
    
    self.speed = [[Speed alloc] init];
    self.speed.speedDelegate = self;
    [self.speed startReadingLocation];
    
    UIImage *image = [UIImage imageNamed:@"leather.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];    
    [self.view insertSubview:imageView atIndex:1];
    
    bIntervalSet = NO;
    self.intervalTimer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector: @selector(checktimerCallback:) userInfo: nil repeats: YES];    
    
}

- (void)checktimerCallback:(NSTimer *)timer {
    
    if ( bIntervalSet == YES )
    {
        // Get the interval time
        NSUserDefaults *myPrefs = [NSUserDefaults standardUserDefaults]; 
        if ( [myPrefs objectForKey:@"interval"] != nil )
        {
            NSString * sInterval = [myPrefs objectForKey:@"interval"];
            NSInteger iInterval = [sInterval intValue];
            if ( iInterval > 0 )
            {
                // Get elapse time from starting
                if ( self.intervalSet == nil || iInterval != lastInterval) {
                    // Set it
                    lastInterval = iInterval;
                    if ( self.intervalSet != nil) {
                        [self.intervalSet invalidate];
                        self.intervalSet = nil;
                    }
                    self.intervalSet = [NSTimer scheduledTimerWithTimeInterval: iInterval target: self selector: @selector(intervalCallback:) userInfo: nil repeats: YES];  
                }
            }
        }        
    }
}

- (void)intervalCallback:(NSTimer *)timer {
    // Talk to the interval
    // TODO
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc
{
    [super dealloc];
    
    [self.intervalTimer release];
}

-(void) speedChanged:(NSString*)speedText:(double)mySpeed
{
    self.speedLabel.text = speedText;
    
    if ( mySpeed > self.maxSpeed)
    {
        NSString *temp = [[NSString alloc] initWithFormat:@"%.2f", mySpeed];
        self.maxLabel.text = temp;
        [temp release];
        self.maxSpeed = mySpeed;
    }
    if ( mySpeed > 0 )
    {
        self.accumulatedSpeed  += mySpeed; 
        self.countSpeed += 1;
        double tempSpeed = self.accumulatedSpeed / self.countSpeed;
        
        NSString *avgTemp = [[NSString alloc] initWithFormat:@"%.2f", tempSpeed];
        self.avgLabel.text = avgTemp;
    }
    
    NSUserDefaults *myPrefs = [NSUserDefaults standardUserDefaults];
    if ( [myPrefs stringForKey:@"limit"] != nil )
    {        
        NSString *limitText = [myPrefs stringForKey:@"limit"];
        if ( [limitText isEqualToString:@"0"] )
              return;
        
        NSInteger myInteger = [[limitText substringWithRange:NSMakeRange(1, 1)] integerValue];
        NSLog(@"My speed limit is %d", myInteger);
        
        if ( myInteger > 0 )
        {
            // you passed the limit.
            if ( mySpeed > myInteger )
            {
                // vibrate or sound
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            }
        }
    }
    
}


- (IBAction) resetButtonPressed
{
    self.accumulatedSpeed  = 0; 
    self.countSpeed = 0;
    self.maxSpeed = 0;

    self.avgLabel.text = @"0.0";
    self.maxLabel.text = @"0.0";
}



@end
