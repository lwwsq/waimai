define(function(require) {
	var $ = require("jquery");
	var Model = function() {
		this.callParent();
	};

	Model.prototype.backBtnClick = function(){
		justep.Shell.closePage();
	};

	Model.prototype.modelParamsReceive = function(event){
		var params = event.params;
		if(params.url){
			var url =  params.url;
			var mapFrame = this.getElementByXid("mapFrame");
			$(mapFrame).attr('src',url);
		}
	};
	
	Model.prototype.title2Click = function(event){
		if(document.webkitIsFullScreen === true){
			document.webkitExitFullscreen();
		}else if(document.webkitIsFullScreen === false){
			document.body.webkitRequestFullScreen();
		}
	};
	
	return Model;
});