//
//  VoiceController.m
//  SpeedPal
//
//  Created by Albert Pascual on 10/21/11.
//  Copyright (c) 2011 Al. All rights reserved.
//

#import "VoiceController.h"

@implementation VoiceController

@synthesize arrayTimes, picker;



- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.arrayTimes = [[NSMutableArray alloc] init];
    [self.arrayTimes addObject:@"Never"];
    [self.arrayTimes addObject:@"1 Minute"];
    [self.arrayTimes addObject:@"2 Minutes"];
    [self.arrayTimes addObject:@"3 Minutes"];
    [self.arrayTimes addObject:@"4 Minutes"];
    [self.arrayTimes addObject:@"5 Minutes"];
    [self.arrayTimes addObject:@"10 Minutes"];
    [self.arrayTimes addObject:@"15 Minutes"];
    [self.arrayTimes addObject:@"20 Minutes"];
    [self.arrayTimes addObject:@"15 Minutes"];
    [self.arrayTimes addObject:@"30 Minutes"];
    [self.arrayTimes addObject:@"45 Minutes"];
    [self.arrayTimes addObject:@"1 Hour"];
    }


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [self.arrayTimes count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.arrayTimes objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSLog(@"Selected Time: %@. Index of selected time: %i", [self.arrayTimes objectAtIndex:row], row);
    
    NSUserDefaults *myPrefs = [NSUserDefaults standardUserDefaults];   
    
    switch (row) {
        case 0:
            [myPrefs setObject:@"0" forKey:@"interval"];
            break;
            
        case 1:
            [myPrefs setObject:@"1" forKey:@"interval"];
            break;
            
        case 2:
            [myPrefs setObject:@"2" forKey:@"interval"];
            break;
            
        case 3:
            [myPrefs setObject:@"3" forKey:@"interval"];
            break;
            
        case 4:
            [myPrefs setObject:@"4" forKey:@"interval"];
            break;
            
        case 5:
            [myPrefs setObject:@"5" forKey:@"interval"];
            break;
            
        case 6:
            [myPrefs setObject:@"10" forKey:@"interval"];
            break;
        case 7:
            [myPrefs setObject:@"15" forKey:@"interval"];
            break;
        case 8:
            [myPrefs setObject:@"20" forKey:@"interval"];
            break;
        case 9:
            [myPrefs setObject:@"25" forKey:@"interval"];
            break;
        case 10:
            [myPrefs setObject:@"30" forKey:@"interval"];
            break;
        case 11:
            [myPrefs setObject:@"45" forKey:@"interval"];
            break;
        case 12:
            [myPrefs setObject:@"60" forKey:@"interval"];
            break;
               
            
        default:
            break;
    }
    
    //TODO call the delegate to the first view
    
}


@end
