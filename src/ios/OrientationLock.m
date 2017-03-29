//
//  OrientationLock.m
//
//  Created by Alex Wasner on 7/15/2014.
//  Copyright 2014 Alex Wasner. All rights reserved.
//

#import "OrientationLock.h"
#import "MainViewController.h"
#import "objc/runtime.h"

#pragma mark add dynamic property

static const char *OLRotationAllowedKey = '\0';

@interface MainViewController (OrientationLock)

@property (nonatomic, assign) BOOL rotationAllowed;

@end

@implementation MainViewController (OrientationLock)

- (BOOL)rotationAllowed
{
    return [objc_getAssociatedObject(self, &OLRotationAllowedKey) boolValue];
}

- (void)setRotationAllowed:(BOOL)allowed
{
    if (allowed != self.rotationAllowed) {
        [self willChangeValueForKey:@"rotationAllowed"]; // KVO
        objc_setAssociatedObject(self, &OLRotationAllowedKey,
                                 @(allowed), OBJC_ASSOCIATION_RETAIN);
        [self didChangeValueForKey:@"rotationAllowed"]; // KVO
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if(self.rotationAllowed)
    {
        return [super shouldAutorotateToInterfaceOrientation:interfaceOrientation];
    }
    else
    {
        if(interfaceOrientation == UIInterfaceOrientationMaskPortrait){
            return YES;
        }
        return NO;
    }
}

- (BOOL)shouldAutorotate
{
    return self.rotationAllowed;
}

@end


#pragma mark - OrientationLock implementation

@implementation OrientationLock

- (void) lock:(CDVInvokedUrlCommand*)command
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MainViewController *rootViewController = (MainViewController*) window.rootViewController;
    [rootViewController setRotationAllowed:NO];
    [(UIWebView*)self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"window.plugins.orientationLock.success('%s');", "success"]];
}

- (void) unlock:(CDVInvokedUrlCommand*)command
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MainViewController *rootViewController = (MainViewController*) window.rootViewController;
    [rootViewController setRotationAllowed:YES];
    [(UIWebView*)self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"window.plugins.orientationLock.success('%s');", "success"]];
}

@end
