cordova.define("com.justep.cordova.plugin.baidulocation.BaiduLocation", function(require, exports, module) { var baidulocation = {
		execute: function(action, successCallback, errorCallback) {
			cordova.exec(
				function(pos) {
					var errcode = pos.code;
					if (errcode == 61 || errcode == 65 || errcode == 161) {
						successCallback(pos);
					} else {
						if (typeof(errorCallback) != "undefined") {
							if (errcode >= 162) {
								errcode = 162;
							}
							errorCallback(pos);
						};
					}
				}, 
				function(err){},
				"BaiduLocation",
				action,
				[]
			)
		},
		realCurrentPosition: function(successCallback, errorCallback) {
			this.execute("getCurrentPosition", successCallback, errorCallback);
		},
		stop: function(action, successCallback, errorCallback) {
			this.execute("stop", successCallback, errorCallback);
		}
};
//if(navigator.geolocation){
//	navigator.geolocation.getCurrentPosition = function(){
//		return navigator.baiduLocation.getCurrentPosition.apply(navigator.baiduLocation,arguments);
//	};
//}
module.exports =  baidulocation;
});
