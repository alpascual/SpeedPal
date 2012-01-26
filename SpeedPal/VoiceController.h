//
//  VoiceController.h
//  SpeedPal
//
//  Created by Albert Pascual on 10/21/11.
//  Copyright (c) 2011 Al. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VoiceController : UIViewController <UIPickerViewDelegate>
{
    
    UIPickerView *picker;
    NSMutableArray *arrayTimes;
}

@property (nonatomic,retain) IBOutlet UIPickerView *picker;
@property (nonatomic,retain)  NSMutableArray *arrayTimes;

@end
