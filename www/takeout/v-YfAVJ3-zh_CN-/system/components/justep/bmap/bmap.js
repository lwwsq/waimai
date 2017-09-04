define(function(require){
	require("w!./bmapActivity.w");
	var Browser = require('$UI/system/lib/base/browser');
	require("cordova!com.justep.cordova.plugin.bmap");
	
	var BMap = function(){
		this.init();
	};

	BMap.prototype = {
		/**
		 * <a href="bdapp://map/marker?location=40.047669,116.313082&title=我的位置&content=百度奎科大厦&src=yourCompanyName|yourAppName">地图标点</a>
		 * 
		 * location lat<纬度>,lng<经度> 必选 
		 * title 标注点显示标题 必选 
		 * content 标注点显示内容 必选 
		 * coord_type 坐标类型，可选参数，默认为百度经纬度坐标。 可选 默认为bd09经纬度坐标。允许的值为bd09ll、gcj02、wgs84。bd09ll表示百度经纬度坐标， gcj02表示经过国测局坐标，wgs84表示gps获取的坐标。 
		 * zoom 展现地图的级别，默认为视觉最优级别。 可选 
		 * src 调用来源，规则：companyName|appName。 必选 此参数不传值，不保证服务。
		 */	
		marker:function(params){
			var parameterStr = this.paramsToStr(params);
			this.exec({service:"marker",parameterStr:parameterStr});
		},
		/*
		 * <a href="bdapp://map/geocoder?address=北京市海淀区上地信息路9号奎科科技大厦&src=yourCompanyName|yourAppName">地理编码</a>
		 * 方式1
		 * address 地址名称 必选 
		 * zoom 展现地图的级别，默认为视觉最优级别。 可选 
		 * src 调用来源，规则：companyName|appName。 必选 此参数丌传值，丌保证服务。
		 * 
		 * 方式2
		 * location lat<纬度>,lng<经度> 必选 
		 * coord_type 坐标类型，可选参数，默认为bd09经纬度坐标。 可选 允许的值为bd09ll、gcj02、wgs84。bd09ll表示百度经纬度坐标， gcj02表示经过国测局加密的坐标，wgs84表示gps获取的坐标。 
		 * zoom 展现地图的级别，默认为视觉最优级别。 可选 
		 * src 调用来源，规则：companyName|appName。 必选 此参数丌传值，丌保证服务。
		 * 
		 */
		geocoder:function(params){
			var parameterStr = this.paramsToStr(params);
			this.exec({service:"geocoder",parameterStr:parameterStr});
		},
		
		/*
		 * <a href="bdapp://map/place/search?query=海底捞&location=31.204055632862,121.41117785465&radius=1000&region=上海&src=yourCompanyName|yourAppName">周边检索</a>
		 * query 关键词 必选 
		 * region 城市名戒县名 选择方式：地点搜索限定范围可以由region、bounds和location + radius方式进行，其中bounds优先级最高、region优先级最低（不web服务保持一致）。 
		 * location 中心点经纬度，戒中心点经纬度和名称描述，注意，名称丌参不检索，只负责显示。 同上   1、39.9761<纬度>,116.3282<经度> 2、39.9761<纬度>,116.3282<经度>| 中关村<名称> radius 检索半径 同上 bounds 视野范围 同上 lat,lng<左下觊>,lat,lng<右上觊> coord_type 坐标类型，可选参数，默认为bd09经纬度坐标。 可选 允许的值为bd09ll、gcj02、wgs84。bd09ll表示百度经纬度坐标， gcj02表示经过国测局加密的坐标，wgs84表示gps获取的坐标。 zoom 展现地图的级别，默认为视觉最优级别。 可选 src 调用来源，规则：companyName|appName。 必选 此参数丌传值，丌保证服务。
		 * */
		placeSearch:function(params){
			var parameterStr = this.paramsToStr(params);
			this.exec({service:"place",action:"search",parameterStr:parameterStr});
		},
		/**
		 * uid POI的ID 必选 zoom 展现地图的级别，默认为视觉最优级别。 可选 src 调用来源，规则：companyName|appName。 必选 此参数丌传值，丌保证服务。
		 */
		placeDetail:function(params){
			var parameterStr = this.paramsToStr(params);
			this.exec({service:"place",action:"detail",parameterStr:parameterStr});
		},
		/**
		 * region 城市名戒县名 必选 name 线路名称 必选 zoom 展现地图的级别，默认为视觉最优级别。 可选 src 调用来源，规则：companyName|appName。 必选 此参数丌传值，丌保证服务。
		 */
		line:function(params){
			var parameterStr = this.paramsToStr(params);
			this.exec({service:"line",parameterStr:parameterStr});
		},
		/**
		 * origin 起点名称戒经纬度，戒者可同时提供名称和经纬度，此时经纬度优先级高，将作为导航依据，名称只负责展示。 必选 1、名称：天安门 2、经纬度：39.98871<纬度>,116.43234<经度>。 3、名称和经纬度：name:天安门|latlng:39.98871,116.43234 destination 终点名称戒经纬度，戒者可同时提供名称和经纬度，此时经纬度优先级高，将作为导航依据，名称只负责展示。 必选 同上 mode 导航模式，固定为transit、driving、walking，分别表示公交、驾车和步行 必选 region 城市名戒县名 当给定region时，认为起点和终点都在同一城市，除非单独给定起点戒终点的城市。 origin_region 起点所在城市戒县 同上
		 */
		direction:function(params){
			var parameterStr = this.paramsToStr(params);
			this.exec({service:"direction",parameterStr:parameterStr});
		},
		/**
		 * scheme,product,service,action,parameters
		 * 
		 */
		exec:function(params){
			var url = this.scheme + '://'+ this.product + '/'+ params.service + (params.action?("/" + params.action):"") +'?' + params.parameterStr;
			if(this.openType === "_system"){
				window.open(url,this.openType);
			}else if(this.openType === "_web"){
				justep.Shell.showPage("$UI/system/components/justep/bmap/bmapActivity.w",{url:url});
			}
		},
		paramsToStr:function(params){
			var parameterStr = "";
			for(var param in params){
				if(this.openType === "_web" && param === "src"){
					//忽略src否则容易白屏
				}else{
					parameterStr += param + "=" + params[param] +"&";
				}
			}
			if(this.openType === "_web"){
				parameterStr += "output=html";
			}else if(this.openType === "_system"){
				justep.Util.hint("正在启动百度地图中...(如果没有安装百度地图请先安装百度地图应用)");
			}
			return parameterStr;
		},
		init:function(){
			if(Browser.isMobileFromUserAgent){
				if(Browser.isWeChat){
					this.scheme = "http";
					this.product = "api.map.baidu.com";
					this.openType = "_web";
				}else{
					if(Browser.isAndroid){
						this.scheme = "bdapp";
					}else if(Browser.isIOS){
						this.scheme = "baidumap";
					}
					this.product = "map";
					this.openType = "_system";
				}
			}else{
				this.scheme = "http";
				this.product = "api.map.baidu.com";
				this.openType = "_web";
			}
		}
	};
	return new BMap();
});