//
//  SecondViewController.h
//  SpeedPal
//
//  Created by Albert Pascual on 6/10/11.
//  Copyright 2011 Al. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SecondViewController : UIViewController <UIPickerViewDelegate> {
    
    UIPickerView *picker;
    NSMutableArray *arraySpeeds;
}

@property (nonatomic,retain) IBOutlet UIPickerView *picker;
@property (nonatomic,retain)  NSMutableArray *arraySpeeds;

@end
