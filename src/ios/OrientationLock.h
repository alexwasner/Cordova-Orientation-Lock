//
//  OrientationLock.h
//
//  Created by Alex Wasner on 7/15/2014.
//  Copyright 2014 Alex Wasner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>


@interface OrientationLock : CDVPlugin {
    
}

- (void) lock:(CDVInvokedUrlCommand*) command;
- (void) unlock:(CDVInvokedUrlCommand*) command;

@end
