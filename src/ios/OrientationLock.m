//
//  OrientationLock.m
//
//  Created by Alex Wasner on 7/15/2014.
//  Copyright 2014 Alex Wasner. All rights reserved.
//

#import "OrientationLock.h"
#import "MainViewController.h"

@implementation OrientationLock

- (void) lock:(CDVInvokedUrlCommand*)command
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MainViewController *rootViewController = (MainViewController*) window.rootViewController;
    [rootViewController setRotationAllowed:NO];
    [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"window.plugins.orientationLock.success('%s');", "success"]];
}

- (void) unlock:(CDVInvokedUrlCommand*)command
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MainViewController *rootViewController = (MainViewController*) window.rootViewController;
    [rootViewController setRotationAllowed:YES];
    [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"window.plugins.orientationLock.success('%s');", "success"]];
}

@end