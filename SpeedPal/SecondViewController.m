//
//  SecondViewController.m
//  SpeedPal
//
//  Created by Albert Pascual on 6/10/11.
//  Copyright 2011 Al. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController

@synthesize picker, arraySpeeds;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.arraySpeeds = [[NSMutableArray alloc] init];
    [self.arraySpeeds addObject:@"Never"];
    [self.arraySpeeds addObject:@"10"];
    [self.arraySpeeds addObject:@"25"];
    [self.arraySpeeds addObject:@"50"];
    [self.arraySpeeds addObject:@"70"];
    [self.arraySpeeds addObject:@"80"];
    [self.arraySpeeds addObject:@"85"];
    
    UIImage *image = [UIImage imageNamed:@"baby-blue-solid.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.view insertSubview:imageView atIndex:1];
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
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [self.arraySpeeds count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.arraySpeeds objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSLog(@"Selected Speed: %@. Index of selected speed: %i", [self.arraySpeeds objectAtIndex:row], row);
    
    NSUserDefaults *myPrefs = [NSUserDefaults standardUserDefaults];   
    
    switch (row) {
        case 0:
            [myPrefs setObject:@"0" forKey:@"limit"];
            break;
            
        case 1:
            [myPrefs setObject:@"10" forKey:@"limit"];
            break;
            
        case 2:
            [myPrefs setObject:@"25" forKey:@"limit"];
            break;
            
        case 3:
            [myPrefs setObject:@"50" forKey:@"limit"];
            break;
            
        case 4:
            [myPrefs setObject:@"70" forKey:@"limit"];
            break;
            
        case 5:
            [myPrefs setObject:@"80" forKey:@"limit"];
            break;
            
        case 6:
            [myPrefs setObject:@"85" forKey:@"limit"];
            break;
            
        default:
            break;
    }
    
   
}

@end
