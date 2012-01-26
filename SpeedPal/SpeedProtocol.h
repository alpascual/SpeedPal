//
//  SpeedProtocol.h
//  SpeedPal
//
//  Created by Albert Pascual on 6/11/11.
//  Copyright 2011 Al. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol SpeedProtocol

-(void) speedChanged:(NSString*)speedText:(double)mySpeed;

@end
