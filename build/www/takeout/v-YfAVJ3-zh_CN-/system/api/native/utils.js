define(function(require) {
	var Browser = require('$UI/system/lib/base/browser');
	var Utils = {
		raw : function(args) {
			var keys = Object.keys(args);
			keys = keys.sort();
			var newArgs = {};
			keys.forEach(function(key) {
				newArgs[key.toLowerCase()] = args[key];
			});
			var result = '';
			for ( var k in newArgs) {
				if (newArgs.hasOwnProperty(k)) {
					result += '&' + k + '=' + newArgs[k];
				}
			}
			result = result.substr(1);
			return result;
		},
		log : function(debug, value) {
			debug && console.log(value);
		},
		logCallback : function(apiName, success) {
			return function() {
				Utils.log(true, 'Call to ' + apiName + (success ? ' success: ' : ' failed: ') + JSON.stringify([].slice.call(arguments)));
			};
		},
		getCacheDirectoryPath : function(fileName) {
			var os = cordova && cordova.file.cacheDirectory;
			var ext = cordova && cordova.file.externalCacheDirectory;
			var dirc = (ext) ? ext : (os ? os : "");
			return (dirc+fileName);
		},
		successCallback : function(context, param, data) {
			param && param.success && param.success(data);
			param && param.complete && param.complete(data);
		},
		errorCallback : function(context, param, data) {
			Utils.log(true, JSON.stringify(data));
			param && param.fail && param.fail(data);
			param && param.complete && param.complete(data);
		},
		cancelCallback : function(context, param, data) {
			param && param.cancel && param.cancel(data);
		},
	};
	return Utils;
});