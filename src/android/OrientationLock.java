//Inspired by https://github.com/cogitor/PhoneGap-OrientationLock

package com.alexwasner.plugins.orientationlock;

import org.json.JSONArray;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;

import android.content.pm.ActivityInfo;

public class OrientationLock extends CordovaPlugin{
    
  @Override
  public boolean execute(String action, JSONArray arguments, CallbackContext callbackContext) {
    if (action.equals("lock")) {
      this.cordova.getActivity().setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
      callbackContext.success();
      return true;
            
    } else if (action.equals("unlock")) {
      this.cordova.getActivity().setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED);
      callbackContext.success();
      return true;
            
    } else {
      return false;
    }
  }
    
}
