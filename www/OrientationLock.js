function OrientationLock(){

}

OrientationLock.prototype.lock = function(success, fail){
  this.success = success;
  this.fail = fail;
  cordova.exec(success, fail, "OrientationLock", "lock", [false]);
}

OrientationLock.prototype.unlock = function(success, fail){
  this.success = success;
  this.fail = fail;
  cordova.exec(success, fail, "OrientationLock", "unlock", [false]);
}

OrientationLock.prototype.success = function(currentOri){
  if(this.success){
    this.success(currentOri);
  }
}

cordova.addConstructor(function() {
    if(!window.plugins)        {
        window.plugins = {};
    }

    window.plugins.orientationLock = new OrientationLock();
});



