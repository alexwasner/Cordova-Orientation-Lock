cordova-orientation-lock
=============================

A cordova plugin to lock and unlock the orientation of the UI programmatically.

Currently supports iOS and Android.

##Usage

```
 window.plugins.orientationLock.lock(function(){},function(){});
 window.plugins.orientationLock.unlock(function(){},function(){});
```

###Important Note for usage on iOS

In your XCode Project, set the preferences for all the orientations you want to have access to. if you want the app to lock in portrait, call lock() upon initialization of your webapp.


Add this to your MainViewController.m

```
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if(self.canRotate){
        return [super shouldAutorotateToInterfaceOrientation:interfaceOrientation];
    }
    else{
        if(interfaceOrientation == UIInterfaceOrientationMaskPortrait){
            return YES;
        }
        return NO;
    }
}

-(void)setRotationAllowed:(BOOL)value {
    _canRotate = value;
}
```

and this to your MainViewController.h


```
@property BOOL canRotate;
- (void)setRotationAllowed:(BOOL) value;

```
