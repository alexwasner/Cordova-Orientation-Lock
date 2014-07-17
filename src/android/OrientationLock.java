//Inspired by after https://github.com/cogitor/PhoneGap-OrientationLock

package com.alexwasner.plugins.orientationlock;

import org.json.JSONArray;
import org.json.JSONException;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.CordovaInterface;

import android.content.pm.ActivityInfo;

public class OrientationLock extends CordovaPlugin{
    
    public String lock(String pOri){
        this.cordova.getActivity().setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
    }
    
    public String unlock(String pOri){
        this.cordova.getActivity().setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED);
    }
    
	@Override
	public boolean execute(String action, JSONArray arguments, CallbackContext callbackContext) {
		if (action.equals("lock")) {
            this.lock();
            callbackContext.success();
            return true;
            
		} else if (action.equals("unlock")) {
			this.unlock();
			callbackContext.success();
			return true;
            
		} else {
			return false;
		}
	}
    
}
