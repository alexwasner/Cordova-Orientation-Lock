cordova-orientation-lock
=============================

A cordova plugin to lock and unlock the orientation of the UI programmatically.

Currently supports iOS and Android.


#Important Note for usage:
##iOS
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
