define([ 'require', (function() {
	var isWeChat = navigator.userAgent.indexOf("MicroMessenger") >= 0;
	if (isWeChat) {
		return "//res.wx.qq.com/open/js/jweixin-1.0.0.js";
	}
})(), '$UI/system/lib/base/url', './sha1', '$UI/system/lib/base/observable', '$UI/system/lib/base/object', 'text!$UI/system/config/config.json', './utils' ], function(require, wx, URL, Sha1,
		Observable, Object, configFromFile, Utils) {
	/*
	 * do not delete require("./sha1"); require("./utils");
	 * require("$UI/system/lib/base/observable");
	 * require("text!$UI/system/config/config.json");
	 * require("$UI/system/lib/base/object");
	 * require("cordova!cordova-plugin-app-version");
	 */
	var configFromFile = JSON.parse(configFromFile);
	var userInfo = null;
	var config = {
		jsApiList : [],
		signature : null,
		nonceStr : null,
		timestamp : null,
		appName : "x5app",
		wxUserInfoUrl : configFromFile.wxUserInfoUrl,
		weixinJSApiUrl : configFromFile.wxJSApiUrl,
		debug : typeof (configFromFile.debug) != "undefined" ? configFromFile.debug : window.__justep.isDebug,
		wxAppId : configFromFile.wxAppId,
		wxShareHintMsg : configFromFile.wxShareHintMsg,
		uploadActionUrl : configFromFile.uploadActionUrl,
		mchId : configFromFile.mchId
	};
	var Base = Object.extend({
		mixins : Observable,
		constructor : function() {
			this.callParent();
			Observable.prototype.constructor.call(this);
			this.initNum = 0;
			this.readyFired = false;
			this.config = config;
			this.debug = config.debug;
			this.user = userInfo;
			var self = this;
			if (wx) {
				self.signPromise = this.sign(location.href.split('#')[0]);
				wx.ready(function() {
					self.__checkReady();
				});
			} else {
				document.addEventListener('deviceReady', function(event) {
					self.fireEvent("deviceReady");
					self.readyFired = true;
				});
				document.addEventListener('deviceReady', function(event) {
					if (window.cordova && cordova.getAppVersion) {
						cordova.getAppVersion.getAppName(function(name) {
							self.config.appName = name;
						});
					}
				});
			}
		},

		ready : function(callback) {
			if (this.readyFired) {
				callback && callback();
			} else {
				var self = this;
				var deviceReadyFunc = function() {
					callback.call(self);
					self.off('deviceReady', deviceReadyFunc);
				};
				callback && this.on("deviceReady", deviceReadyFunc);
			}
			;

		},
		checkJsApi : function(param) {
			if (wx) {
				wx.checkJsApi.call(this, param);
			}
		},
		init : function(jsApiList) {
			if (wx) {
				var self = this;
				for ( var index in jsApiList) {
					config.jsApiList.push(jsApiList[index]);
				}
				if (this.timer) {
					clearTimeout(this.timer);
				}
				this.timer = setTimeout(function() {
					self.timer = null;
					self._init();
				}, 1000);
			}
		},
		_init : function() {
			var self = this;
			self.signPromise.done(function() {
				wx.config({
					debug : config.debug,
					appId : config.wxAppId,
					timestamp : config.timestamp,
					nonceStr : config.nonceStr,
					signature : config.signature,
					jsApiList : config.jsApiList
				});
			}).fail(function(res) {
				Utils.logCallback('_init()', false)(JSON.stringify(res));
			});
		},
		__checkReady : function() {
			this.fireEvent("deviceReady");
			this.readyFired = true;
		},
		getWx : function() {
			return wx;
		},
		getTicket : function() {
			if (this.jsapiTicket) {
				var dtd = $.Deferred();
				dtd.resolve(this.jsapiTicket);
				return dtd.promise();
			}
			;

			return $.ajax({
				method : "GET",
				url : config.weixinJSApiUrl,
				cache : false,
				data : {
					action : "getTicket"
				}
			});
		},
		getUserInfo : function() {
			var self = this;
			var dtd = $.Deferred();
			var promise = dtd.promise();
			var code = new URL(location.href).getParam('code');
			if (self.userInfo) {
				dtd.resolve(self.userInfo);
				return promise;
			}
			;
			if (!code) {
				dtd.reject("no code");
				return promise;
			}
			;
			$.ajax({
				method : "GET",
				url : config.wxUserInfoUrl,
				cache : false,
				data : {
					code : code
				}
			}).done(function(weixinUser) {
				self.userInfo = weixinUser;
				dtd.resolve(self.userInfo);
			}).fail(function(err) {
				dtd.reject(err);
			});
			return dtd.promise();

		},
		sign : function(url) {
			var ticketDtd = $.Deferred();
			this.getTicket().done(function(jsapiTicket) {
				if (!config.nonceStr) {
					config.nonceStr = Math.random().toString(36).substr(2, 15);
					;
				}
				;
				if (!config.timestamp) {
					config.timestamp = parseInt(new Date().getTime() / 1000) + '';
				}
				;
				var ret = {
					jsapi_ticket : jsapiTicket,
					nonceStr : config.nonceStr,
					timestamp : config.timestamp,
					url : url
				};
				var result = Utils.raw(ret);
				ret.signature = Sha1.hash(result);
				ret.appId = config.wxAppId;
				config.signature = ret.signature;
				delete ret.jsapi_ticket;
				delete ret.url;
				ticketDtd.resolve(ret);
			}).fail(function(data) {
				ticketDtd.reject(data);
			});
			return ticketDtd.promise();
		}
	});
	return new Base();
});
