<!DOCTYPE HTML>
<html style="width:100%;height:100%" class="no-js">
    <head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
        <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <script src="../system/lib/base/modernizr-2.8.3.min.js"></script>
		<script id="__varReplace">
    	
    	    	window.__justep = window.__justep || {};
				window.__justep.isDebug = false;
				window.__justep.__packageMode = "1";
				window.__justep.__isPackage = true;;
				window.__justep.url = location.href;
				window.__justep.versionInfo = {};
		 
    	</script>
        <script id="__updateVersion">
        
				(function(url, mode){
					if (("@"+"mode@") === mode) mode = "3";
					if (("@"+"versionUrl@") === url) url = "system/service/common/app.j";
					if ((mode!=="1" && (mode!="2") && (mode!="3"))) return;
					var async = (mode=="1");
					var x5Version = "noApp";
					var x5AppAgents = /x5app\/([0-9.]*)/.exec(navigator.userAgent);
					if(x5AppAgents && x5AppAgents.length > 1){
					   	x5Version = x5AppAgents[1] || "";
					} 
					function createXhr(){
						try {	
							return new XMLHttpRequest();
						}catch (tryMS) {	
							var version = ["MSXML2.XMLHttp.6.0",
							               "MSXML2.XMLHttp.3.0",
							               "MSXML2.XMLHttp",
							               "Miscrosoft.XMLHTTP"];
							for(var i = 0; i < version.length; i++){
								try{
							    	return new ActiveXObject(version[i]);
								}catch(e){}
							}
						}
						throw new Error("您的系统或浏览器不支持XHR对象！");
					}
					
					function createGuid(){	
						var guid = '';	
						for (var i = 1; i <= 32; i++){		
							var n = Math.floor(Math.random()*16.0).toString(16);		
							guid += n;		
							if((i==8)||(i==12)||(i==16)||(i==20))			
								guid += '-';	
						}	
						return guid;
					}
					
					function parseUrl(href){
						href = href.split("#")[0];
						var items = href.split("?");
						href = items[0];
						var query = items[1] || "";
						items = href.split("/");
						var baseItems = [];
						var pathItems = [];
						var isPath = false;
						for (var i=0; i<items.length; i++){
							if (mode == "3"){
								if (items[i] && (items[i].indexOf("v_") === 0) 
										&& (items[i].indexOf("l_") !== -1)
										&& (items[i].indexOf("s_") !== -1)
										&& (items[i].indexOf("d_") !== -1)
										|| (items[i]=="v_")){
									isPath = true;
									continue;
								}
							}else{
								if (items[i] && (items[i].indexOf("v-")===0) && (items[i].charAt(items[i].length-1)=="-") ){
									isPath = true;
									continue;
								}
							}
							if (isPath){
								pathItems.push(items[i]);
							}else{
								baseItems.push(items[i]);	
							}
							
						}
						var base = baseItems.join("/");
						if (base.charAt(base.length-1)!=="/") base += "/";
						
						var path = pathItems.join("/");
						if (path.charAt(0) !== "/") path = "/" + path;
						return [base, path, query];
					}
					
					
					var items = parseUrl(window.location.href);
					var base = items[0];
					var path = items[1];
					var query = items[2];
					var xhr = createXhr();
					url += ((url.indexOf("?")!=-1) ? "&" : "?") +"_=" + createGuid();
					if (mode === "3"){
						url += "&url=" + path;
						if (query)
							url += "&" + query;
					}
					xhr.open('GET', base + url, async);
					
					if (async){
						xhr.onreadystatechange=function(){
							if((xhr.readyState == 4) && (xhr.status == 200) && xhr.responseText){
								var versionInfo = JSON.parse(xhr.responseText);
								window.__justep.versionInfo = versionInfo;
								window.__justep.versionInfo.baseUrl = base;
								if (query){
									path = path + "?" + query;
								}
								path = versionInfo.resourceInfo.indexURL || path; /* 如果返回indexPath则使用indexPath，否则使用当前的path */
								var indexUrl = versionInfo.baseUrl + versionInfo.resourceInfo.version + path;
								versionInfo.resourceInfo.indexPageURL = indexUrl;
								if(versionInfo.resourceInfo.resourceUpdateMode != "md5"){
									if (window.__justep.url.indexOf(versionInfo.resourceInfo.version) == -1){
										versionInfo.resourceInfo.isNewVersion = true;
									};
								}
							}
						}
					}
					
					try{
						xhr.send(null);
						if (!async && (xhr.status == 200) && xhr.responseText){
							var versionInfo = JSON.parse(xhr.responseText);
							window.__justep.versionInfo = versionInfo;
							window.__justep.versionInfo.baseUrl = base;
							if ((mode==="3") && window.__justep.isDebug){
								/* 模式3且是调试模式不重定向 */
							}else{
								if (query){
									path = path + "?" + query;
								}
								if(versionInfo.resourceInfo.resourceUpdateMode == "md5"){
									path = versionInfo.resourceInfo.indexURL || path; /* 如果返回indexPath则使用indexPath，否则使用当前的path */
									var indexUrl = versionInfo.baseUrl + versionInfo.resourceInfo.version + path;
									versionInfo.resourceInfo.indexPageURL = indexUrl; 
								}else if (versionInfo.resourceInfo && versionInfo.resourceInfo.version && (window.__justep.url.indexOf(versionInfo.resourceInfo.version) == -1)){
									path = versionInfo.resourceInfo.indexURL || path; /* 如果返回indexPath则使用indexPath，否则使用当前的path */
									var indexUrl = versionInfo.baseUrl + versionInfo.resourceInfo.version + path;
									window.location.href = indexUrl;
								}
							}
						}
					}catch(e2){}
				}("appMetadata_in_server.json", "1"));
                 
        </script>
    <link rel="stylesheet" href="../system/components/bootstrap.min.css" include="$model/UI2/system/components/bootstrap/lib/css/bootstrap,$model/UI2/system/components/bootstrap/lib/css/bootstrap-theme"><link rel="stylesheet" href="../system/components/comp.min.css" include="$model/UI2/system/components/justep/lib/css2/dataControl,$model/UI2/system/components/justep/input/css/datePickerPC,$model/UI2/system/components/justep/messageDialog/css/messageDialog,$model/UI2/system/components/justep/lib/css3/round,$model/UI2/system/components/justep/input/css/datePicker,$model/UI2/system/components/justep/row/css/row,$model/UI2/system/components/justep/attachment/css/attachment,$model/UI2/system/components/justep/barcode/css/barcodeImage,$model/UI2/system/components/bootstrap/dropdown/css/dropdown,$model/UI2/system/components/justep/dataTables/css/dataTables,$model/UI2/system/components/justep/contents/css/contents,$model/UI2/system/components/justep/common/css/forms,$model/UI2/system/components/justep/locker/css/locker,$model/UI2/system/components/justep/menu/css/menu,$model/UI2/system/components/justep/scrollView/css/scrollView,$model/UI2/system/components/justep/loadingBar/loadingBar,$model/UI2/system/components/justep/dialog/css/dialog,$model/UI2/system/components/justep/bar/css/bar,$model/UI2/system/components/justep/popMenu/css/popMenu,$model/UI2/system/components/justep/lib/css/icons,$model/UI2/system/components/justep/lib/css4/e-commerce,$model/UI2/system/components/justep/toolBar/css/toolBar,$model/UI2/system/components/justep/popOver/css/popOver,$model/UI2/system/components/justep/panel/css/panel,$model/UI2/system/components/bootstrap/carousel/css/carousel,$model/UI2/system/components/justep/wing/css/wing,$model/UI2/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/UI2/system/components/justep/titleBar/css/titleBar,$model/UI2/system/components/justep/lib/css1/linear,$model/UI2/system/components/justep/numberSelect/css/numberList,$model/UI2/system/components/justep/list/css/list,$model/UI2/system/components/justep/dataTables/css/dataTables"></head>
	
    <body style="width:100%;height:100%;margin: 0;">
        <script src="./intro.js"></script>
    	<div id="applicationHost" class="applicationHost" style="width:100%;height:100%;" __component-context__="block"><div xid="window" class="window takeout cJVvymi" component="$model/UI2/system/components/justep/window/window" design="device:m;" data-bind="component:{name:'$model/UI2/system/components/justep/window/window'}" __cid="cJVvymi" components="$model/UI2/system/components/justep/model/model,$model/UI2/system/components/justep/loadingBar/loadingBar,$model/UI2/system/components/justep/button/button,$model/UI2/system/components/justep/scrollView/scrollView,$model/UI2/system/components/justep/input/input,$model/UI2/system/components/justep/list/list,$model/UI2/system/components/justep/select/radioGroup,$model/UI2/system/components/bootstrap/row/row,$model/UI2/system/components/justep/panel/child,$model/UI2/system/components/justep/windowDialog/windowDialog,$model/UI2/system/components/justep/panel/panel,$model/UI2/system/components/justep/contents/content,$model/UI2/system/components/justep/row/row,$model/UI2/system/components/justep/output/output,$model/UI2/system/components/justep/titleBar/titleBar,$model/UI2/system/components/justep/contents/contents,$model/UI2/system/components/justep/button/radio,$model/UI2/system/components/justep/data/data,$model/UI2/system/components/bootstrap/inputGroup/inputGroup,$model/UI2/system/components/justep/window/window,$model/UI2/system/components/justep/data/baasData,$model/UI2/system/components/bootstrap/panel/panel,$model/UI2/system/components/justep/button/buttonGroup,">
  <style>.takeout.cJVvymi .x-col.cJVvymi{padding: 0px} .takeout.cJVvymi .takeout-list-row.cJVvymi{border-bottom: 1px solid rgb(229, 229, 229)} .takeout.cJVvymi .x-titlebar.cJVvymi{background-color: rgb(53, 179, 228)}</style>  
  <div component="$model/UI2/system/components/justep/model/model" xid="model" style="display:none" data-bind="component:{name:'$model/UI2/system/components/justep/model/model'}" data-events="onLoad:modelLoad" __cid="cJVvymi" class="cJVvymi"></div>  
  <span component="$model/UI2/system/components/justep/windowDialog/windowDialog" xid="mapDialog" style="left:63px;top:16px;" data-bind="component:{name:'$model/UI2/system/components/justep/windowDialog/windowDialog'}" data-config="{&#34;routable&#34;:true,&#34;src&#34;:&#34;$model/UI2/takeout/mapActivity.w&#34;}" __cid="cJVvymi" class="cJVvymi">
    <div class="x-dialog-overlay cJVvymi" __cid="cJVvymi"></div>
    <div class="x-dialog cJVvymi" style="display:none;" __cid="cJVvymi">
      <div class="x-dialog-title cJVvymi" __cid="cJVvymi">
        <button class="close cJVvymi" __cid="cJVvymi">
          <span __cid="cJVvymi" class="cJVvymi">×</span>
        </button>
        <div class="x-dialog-title-text cJVvymi" __cid="cJVvymi"></div>
      </div>
      <div class="x-dialog-body cJVvymi" __cid="cJVvymi"></div>
    </div>
  </span>  
  <div component="$model/UI2/system/components/justep/panel/panel" class="x-panel x-full pcbuiu22-iosstatusbar cJVvymi" xid="panel1" data-bind="component:{name:'$model/UI2/system/components/justep/panel/panel'}" __cid="cJVvymi"> 
    <div class="x-panel-top cJVvymi" xid="top1" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cJVvymi"> 
      <div component="$model/UI2/system/components/justep/titleBar/titleBar" class="x-titlebar cJVvymi" xid="titleBar1" data-bind="component:{name:'$model/UI2/system/components/justep/titleBar/titleBar'}" data-config="{&#34;title&#34;:&#34;WeX5 外卖&#34;}" __cid="cJVvymi"> 
        <div class="x-titlebar-left cJVvymi" xid="div1" __cid="cJVvymi"> 
          <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-only-icon cJVvymi" style="display:none" xid="backBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'},visible:justep.Portal.getPortal()" data-events="onClick:{&#34;operation&#34;:&#34;window.close&#34;}" data-config="{&#34;icon&#34;:&#34;icon-chevron-left&#34;,&#34;label&#34;:&#34;&#34;}" __cid="cJVvymi"> 
            <i xid="i11" class="icon-chevron-left cJVvymi" __cid="cJVvymi"></i>  
            <span xid="span18" __cid="cJVvymi" class="cJVvymi"></span> 
          </a> 
        </div>  
        <div class="x-titlebar-title cJVvymi" xid="div2" __cid="cJVvymi">WeX5 外卖</div>  
        <div class="x-titlebar-right  cJVvymi" xid="div3" __cid="cJVvymi">
          <div class="empty cJVvymi" __cid="cJVvymi"></div>
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content cJVvymi" xid="content1" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cJVvymi"> 
      <div component="$model/UI2/system/components/justep/contents/contents" class="x-contents x-full cJVvymi" xid="contents" data-bind="component:{name:'$model/UI2/system/components/justep/contents/contents'}" data-events="onActiveChange:contentsActiveChange" data-config="{&#34;active&#34;:0,&#34;slidable&#34;:true,&#34;swipe&#34;:true}" __cid="cJVvymi"> 
        <div class="x-contents-content active x-scroll-view active cJVvymi" xid="foodContent" component="$model/UI2/system/components/justep/contents/content" data-bind="component:{name:'$model/UI2/system/components/justep/contents/content'}" __cid="cJVvymi"> 
          <div class="x-scroll cJVvymi" component="$model/UI2/system/components/justep/scrollView/scrollView" xid="scrollView2" data-bind="component:{name:'$model/UI2/system/components/justep/scrollView/scrollView'}" __cid="cJVvymi"> 
            <div class="x-content-center x-pull-down container cJVvymi" xid="div4" __cid="cJVvymi"> 
              <i class="x-pull-down-img glyphicon x-icon-pull-down cJVvymi" xid="i1" __cid="cJVvymi"></i>  
              <span class="x-pull-down-label cJVvymi" xid="span2" __cid="cJVvymi">下拉刷新...</span> 
            </div>  
            <div class="x-scroll-content cJVvymi" xid="div5" __cid="cJVvymi"> 
              <div component="$model/UI2/system/components/justep/list/list" class="x-list x-cards cJVvymi" xid="foodList" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;foodData&#34;,&#34;limit&#34;:8}" __cid="cJVvymi"> 
                <ul class="x-list-template list-group hide cJVvymi" xid="listTemplateUl1" __cid="cJVvymi" data-bind="foreach:{data:$model.foreach_foodList($element),afterRender:$model.foreach_afterRender_foodList.bind($model,$element)}"> 
                  <li xid="li1" class="list-group-item cJVvymi" __cid="cJVvymi"> 
                    <div class="media cJVvymi" __cid="cJVvymi"> 
                      <div class="media-left cJVvymi" __cid="cJVvymi"> 
                        <img alt="" xid="image1" style="width:120px;height:89px;width:38vw;height: 25.333333333333vw;max-width:120px;max-height:89px;" class="img-rounded media-object cJVvymi" __cid="cJVvymi" data-bind="attr:{src:val('calcImageURL')}"> 
                      </div>  
                      <div class="media-body cJVvymi" __cid="cJVvymi"> 
                        <a component="$model/UI2/system/components/justep/button/button" style="padding: 0;margin: 10px 10px 0 0;" class="btn x-card btn-link pull-right cJVvymi" xid="addCartBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:addCartBtnClick" data-config="{&#34;label&#34;:&#34;来一份&#34;}" __cid="cJVvymi"> 
                          <i xid="i14" __cid="cJVvymi" class="cJVvymi"></i>  
                          <span xid="span10" __cid="cJVvymi" class="cJVvymi">来一份</span> 
                        </a>  
                        <div component="$model/UI2/system/components/justep/output/output" class="x-output list-group-item-heading cJVvymi" xid="output1" style="font-size:14px;font-weight:bold" data-bind="component:{ref:ref('fName'),name:'$model/UI2/system/components/justep/output/output'}" __cid="cJVvymi"></div>  
                        <div component="$model/UI2/system/components/justep/output/output" class="x-output list-group-item-text cJVvymi" xid="output2" data-bind="component:{ref:ref('fDescription'),name:'$model/UI2/system/components/justep/output/output'}" __cid="cJVvymi"></div>  
                        <div component="$model/UI2/system/components/justep/output/output" class="x-output list-group-item-text cJVvymi" xid="output3" style="font-weight: bold;" data-bind="component:{ref:ref('calcPriceText'),name:'$model/UI2/system/components/justep/output/output'}" __cid="cJVvymi"></div> 
                      </div> 
                    </div> 
                  </li> 
                </ul> 
              </div> 
            </div>  
            <div class="x-content-center x-pull-up cJVvymi" xid="div6" __cid="cJVvymi"> 
              <span class="x-pull-up-label cJVvymi" xid="span5" __cid="cJVvymi">加载更多...</span> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content x-cards cJVvymi" xid="cartContent" component="$model/UI2/system/components/justep/contents/content" data-bind="component:{name:'$model/UI2/system/components/justep/contents/content'}" data-events="onActive:cartContentActive" __cid="cJVvymi"> 
          <div class="panel panel-default panel-default x-card cJVvymi" component="$model/UI2/system/components/bootstrap/panel/panel" xid="panel2" data-bind="component:{name:'$model/UI2/system/components/bootstrap/panel/panel'}" __cid="cJVvymi"> 
            <div class="panel-heading cJVvymi" xid="heading2" __cid="cJVvymi"> 
              <h4 class="panel-title cJVvymi" xid="h42" __cid="cJVvymi">清单</h4> 
            </div>  
            <div class="panel-body cJVvymi" xid="body2" __cid="cJVvymi"> 
              <span style="color:#ddd" __cid="cJVvymi" class="cJVvymi" data-bind="visible:$model.cartData.getCount() == 0">空</span>  
              <div component="$model/UI2/system/components/justep/list/list" class="x-list cJVvymi" xid="carList" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;cartData&#34;}" __cid="cJVvymi"> 
                <ul class="x-list-template hide cJVvymi" xid="listTemplateUl2" __cid="cJVvymi" data-bind="foreach:{data:$model.foreach_carList($element),afterRender:$model.foreach_afterRender_carList.bind($model,$element)}"> 
                  <li xid="li2" __cid="cJVvymi" class="cJVvymi"> 
                    <div component="$model/UI2/system/components/bootstrap/row/row" class="row cJVvymi" xid="row1" data-bind="component:{name:'$model/UI2/system/components/bootstrap/row/row'}" __cid="cJVvymi"> 
                      <div class="col col-xs-5 cJVvymi" xid="col7" __cid="cJVvymi"> 
                        <div component="$model/UI2/system/components/justep/output/output" class="x-output cJVvymi" xid="output4" style="font-weight:bold;" data-bind="component:{ref:ref('fName'),name:'$model/UI2/system/components/justep/output/output'}" __cid="cJVvymi"></div> 
                      </div>  
                      <div class="col col-xs-2 cJVvymi" xid="col8" __cid="cJVvymi"> 
                        <div component="$model/UI2/system/components/justep/output/output" class="x-output cJVvymi" xid="output11" data-bind="component:{ref:ref('fPrice'),name:'$model/UI2/system/components/justep/output/output'}" __cid="cJVvymi"></div> 
                      </div>  
                      <div class="col col-xs-5 cJVvymi" xid="col9" __cid="cJVvymi"> 
                        <a component="$model/UI2/system/components/justep/button/button" class="btn btn-xs btn-only-icon cJVvymi" xid="reduceCountBtn" style="color:white;background-color:#35b3e4;" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:reduceCountBtnClick" data-config="{&#34;icon&#34;:&#34;icon-android-remove&#34;,&#34;label&#34;:&#34;button&#34;}" __cid="cJVvymi"> 
                          <i xid="i3" class="icon-android-remove cJVvymi" __cid="cJVvymi"></i>  
                          <span xid="span3" __cid="cJVvymi" class="cJVvymi"></span> 
                        </a>  
                        <div component="$model/UI2/system/components/justep/output/output" class="x-output cJVvymi" xid="output5" style="text-align:center;margin-right:10px;margin-left:10px;display:inline-block" data-bind="component:{ref:ref('fCount'),name:'$model/UI2/system/components/justep/output/output'}" __cid="cJVvymi"></div>  
                        <a component="$model/UI2/system/components/justep/button/button" class="btn btn-xs btn-only-icon cJVvymi" xid="addCountBtn" style="color:white;background-color:#35b3e4;" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:addCountBtnClick" data-config="{&#34;icon&#34;:&#34;icon-android-add&#34;,&#34;label&#34;:&#34;button&#34;}" __cid="cJVvymi"> 
                          <i xid="i4" class="icon-android-add cJVvymi" __cid="cJVvymi"></i>  
                          <span xid="span4" __cid="cJVvymi" class="cJVvymi"></span> 
                        </a> 
                      </div> 
                    </div> 
                  </li> 
                </ul> 
              </div> 
            </div>  
            <div class="panel-footer cJVvymi" xid="footer2" __cid="cJVvymi"> 
              <div component="$model/UI2/system/components/justep/row/row" class="x-row cJVvymi" xid="row6" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cJVvymi"> 
                <div class="x-col cJVvymi" xid="col14" __cid="cJVvymi"></div>  
                <div xid="col15" __cid="cJVvymi" class="cJVvymi"> 
                  <span xid="span11" style="font-weight:bold;" __cid="cJVvymi" class="cJVvymi">合计：</span> 
                </div>  
                <div xid="col16" __cid="cJVvymi" class="cJVvymi"> 
                  <div component="$model/UI2/system/components/justep/output/output" class="x-output cJVvymi" xid="output6" style="padding-top: 0;margin-right:10px;margin-left:10px;font-weight:bold;" data-bind="component:{ref:statusData.ref('calcCartSumMoneyText'),name:'$model/UI2/system/components/justep/output/output'}" __cid="cJVvymi"></div> 
                </div> 
              </div> 
            </div> 
          </div>  
          <div class="panel panel-default x-card cJVvymi" component="$model/UI2/system/components/bootstrap/panel/panel" xid="panel13" data-bind="component:{name:'$model/UI2/system/components/bootstrap/panel/panel'}" __cid="cJVvymi"> 
            <div class="panel-heading cJVvymi" xid="heading1" __cid="cJVvymi"> 
              <h4 class="panel-title cJVvymi" xid="h41" __cid="cJVvymi">联系方式</h4> 
            </div>  
            <div class="panel-body cJVvymi" xid="body1" __cid="cJVvymi"> 
              <form class="form-horizontal cJVvymi" __cid="cJVvymi"> 
                <div class="form-group cJVvymi" __cid="cJVvymi"> 
                  <label class="col-xs-3 control-label cJVvymi" style="word-spacing:10px;padding-top: 12px;" __cid="cJVvymi">姓名</label>  
                  <div class="col-xs-9 cJVvymi" __cid="cJVvymi"> 
                    <input component="$model/UI2/system/components/justep/input/input" class="form-control x-edit cJVvymi" xid="input1" data-bind="component:{ref:userData.ref('fName'),name:'$model/UI2/system/components/justep/input/input'}" __cid="cJVvymi"> 
                  </div> 
                </div>  
                <div class="form-group cJVvymi" __cid="cJVvymi"> 
                  <label class="col-xs-3 control-label cJVvymi" style="word-spacing:10px;padding-top: 12px;" __cid="cJVvymi">电话</label>  
                  <div class="col-xs-9 cJVvymi" __cid="cJVvymi"> 
                    <input component="$model/UI2/system/components/justep/input/input" class="form-control x-edit cJVvymi" xid="input2" data-bind="component:{ref:userData.ref('fPhoneNumber'),name:'$model/UI2/system/components/justep/input/input'}" __cid="cJVvymi"> 
                  </div> 
                </div>  
                <div class="form-group cJVvymi" __cid="cJVvymi"> 
                  <label class="col-xs-3 control-label cJVvymi" style="word-spacing:20px;padding-top: 12px;" xid="controlLabel1" __cid="cJVvymi">地址</label>  
                  <div class="col-xs-9 cJVvymi" xid="col1" __cid="cJVvymi"> 
                    <div class="input-group cJVvymi" component="$model/UI2/system/components/bootstrap/inputGroup/inputGroup" xid="inputGroup1" data-bind="component:{name:'$model/UI2/system/components/bootstrap/inputGroup/inputGroup'}" __cid="cJVvymi"> 
                      <input type="text" class="form-control cJVvymi" component="$model/UI2/system/components/justep/input/input" xid="input4" data-bind="component:{ref:$model.userData.ref(&#34;fAddress&#34;),name:'$model/UI2/system/components/justep/input/input'}" __cid="cJVvymi">  
                      <div class="input-group-btn cJVvymi" xid="div7" __cid="cJVvymi"> 
                        <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link cJVvymi" xid="button1" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:locationClick" data-config="{&#34;icon&#34;:&#34;icon-android-location&#34;,&#34;label&#34;:&#34; 定位&#34;}" __cid="cJVvymi"> 
                          <i xid="i15" class="icon-android-location cJVvymi" __cid="cJVvymi"></i>  
                          <span xid="span20" __cid="cJVvymi" class="cJVvymi">定位</span> 
                        </a> 
                      </div> 
                    </div> 
                  </div> 
                </div> 
              </form>  
              <div xid="paySection" style="height:40px; padding-top: 5px;" __cid="cJVvymi" class="cJVvymi"> 
                <span component="$model/UI2/system/components/justep/select/radioGroup" class="x-radio-group cJVvymi" xid="payTypeSelect" style="float:right;margin-right:15px;" data-bind="component:{name:'$model/UI2/system/components/justep/select/radioGroup'},foreach:{data:payData.datas,afterRender:$model.comp($element)['_doUpdate'].bind($model.comp($element))}" __cid="cJVvymi">
                  <span component="$model/UI2/system/components/justep/button/radio" class="x-radio cJVvymi" data-config="{&#34;checked&#34;:false,&#34;disabled&#34;:false}" data-bind="component:{name:'$model/UI2/system/components/justep/button/radio',label:ref('fPayTypeLabel'),value:ref('fPayType')}" __cid="cJVvymi">
                    <input type="radio" __cid="cJVvymi" class="cJVvymi">
                    <label __cid="cJVvymi" class="cJVvymi"></label>
                  </span>
                </span> 
              </div> 
            </div>  
            <div class="panel-footer clearfix cJVvymi" xid="footer1" __cid="cJVvymi"> 
              <a component="$model/UI2/system/components/justep/button/button" class="btn btn-warning btn-sm cJVvymi" xid="saveOrderBtn" style="float: right; margin-right:10px;width:100px;" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'},enable:statusData.ref('calcCanSaveOrder')" data-events="onClick:saveOrderBtnClick" data-config="{&#34;label&#34;:&#34;下单&#34;}" __cid="cJVvymi"> 
                <i xid="i9" __cid="cJVvymi" class="cJVvymi"></i>  
                <span xid="span12" __cid="cJVvymi" class="cJVvymi">下单</span> 
              </a>  
              <a component="$model/UI2/system/components/justep/button/button" class="btn card btn-link btn-sm cJVvymi" xid="cleanCartBtn" style="float: right; margin-right:10px;width:100px;" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'},enable:statusData.ref('calcCanClearCart')" data-events="onClick:cleanCartBtnClick" data-config="{&#34;label&#34;:&#34;清空购物车&#34;}" __cid="cJVvymi"> 
                <i xid="i10" __cid="cJVvymi" class="cJVvymi"></i>  
                <span xid="span13" __cid="cJVvymi" class="cJVvymi">清空购物车</span> 
              </a> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content x-content-on-right cJVvymi" xid="orderContent" component="$model/UI2/system/components/justep/contents/content" data-bind="component:{name:'$model/UI2/system/components/justep/contents/content'}" __cid="cJVvymi"> 
          <div class="x-scroll cJVvymi" component="$model/UI2/system/components/justep/scrollView/scrollView" xid="scrollView1" data-bind="component:{name:'$model/UI2/system/components/justep/scrollView/scrollView'}" __cid="cJVvymi"> 
            <div class="x-content-center x-pull-down container cJVvymi" xid="div8" __cid="cJVvymi"> 
              <i class="x-pull-down-img glyphicon x-icon-pull-down cJVvymi" xid="i12" __cid="cJVvymi"></i>  
              <span class="x-pull-down-label cJVvymi" xid="span14" __cid="cJVvymi">下拉刷新...</span> 
            </div>  
            <div class="x-scroll-content cJVvymi" xid="div9" __cid="cJVvymi"> 
              <div component="$model/UI2/system/components/justep/list/list" class="x-list cJVvymi" xid="orderList" style="margin: 5px;" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;autoLoad&#34;:false,&#34;data&#34;:&#34;orderData&#34;,&#34;limit&#34;:10}" __cid="cJVvymi"> 
                <ul class="x-list-template hide cJVvymi" xid="listTemplateUl3" __cid="cJVvymi" data-bind="foreach:{data:$model.foreach_orderList($element),afterRender:$model.foreach_afterRender_orderList.bind($model,$element)}"> 
                  <li xid="li3" class="takeout-list-row cJVvymi" __cid="cJVvymi"> 
                    <div component="$model/UI2/system/components/justep/row/row" class="x-row cJVvymi" xid="row7" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cJVvymi"> 
                      <div xid="col13" __cid="cJVvymi" class="cJVvymi"> 
                        <span xid="span17" style="font-weight:bold;" class="x-output cJVvymi" __cid="cJVvymi">订餐时间：</span> 
                      </div>  
                      <div class="x-col cJVvymi" xid="col18" __cid="cJVvymi"> 
                        <div component="$model/UI2/system/components/justep/output/output" class="x-output cJVvymi" xid="output7" data-bind="component:{ref:ref('fCreateTime'),name:'$model/UI2/system/components/justep/output/output'}" __cid="cJVvymi"></div> 
                      </div> 
                    </div>  
                    <div component="$model/UI2/system/components/justep/row/row" class="x-row cJVvymi" xid="row8" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cJVvymi"> 
                      <div xid="col20" __cid="cJVvymi" class="cJVvymi"> 
                        <span xid="span16" style="margin-left:5px;color:#FF8040;" class="x-output cJVvymi" __cid="cJVvymi">订餐内容：</span> 
                      </div>  
                      <div class="x-col cJVvymi" xid="col21" __cid="cJVvymi"> 
                        <div component="$model/UI2/system/components/justep/output/output" class="x-output cJVvymi" xid="output8" data-bind="component:{ref:ref('fContent'),name:'$model/UI2/system/components/justep/output/output'}" __cid="cJVvymi"></div> 
                      </div> 
                    </div>  
                    <div component="$model/UI2/system/components/justep/row/row" class="x-row cJVvymi" xid="row9" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cJVvymi"> 
                      <div xid="col23" __cid="cJVvymi" class="cJVvymi"> 
                        <span xid="span116" style="margin-left:5px;color:#FF8040;" class="x-output cJVvymi" __cid="cJVvymi">配送信息：</span> 
                      </div>  
                      <div class="x-col cJVvymi" xid="col24" __cid="cJVvymi"> 
                        <div component="$model/UI2/system/components/justep/output/output" class="x-output cJVvymi" xid="output9" data-bind="component:{name:'$model/UI2/system/components/justep/output/output'},text:val('fUserName') + '，' + val('fPhoneNumber') + '，' + val('fAddress')" __cid="cJVvymi"></div> 
                      </div> 
                    </div>  
                    <div component="$model/UI2/system/components/justep/row/row" class="x-row cJVvymi" xid="row10" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cJVvymi"> 
                      <div xid="col26" style="margin-left:5px;color:#FF8040;" __cid="cJVvymi" class="cJVvymi"> 
                        <span xid="span117" class="x-output cJVvymi" __cid="cJVvymi">合计金额：</span> 
                      </div>  
                      <div class="x-col cJVvymi" xid="col27" __cid="cJVvymi"> 
                        <div component="$model/UI2/system/components/justep/output/output" class="x-output cJVvymi" xid="output10" style="color:#FF0000;font-weight:bold;" data-bind="component:{name:'$model/UI2/system/components/justep/output/output'},text:'¥ ' + val('fSum') + '元'" __cid="cJVvymi"></div> 
                      </div> 
                    </div>  
                    <div component="$model/UI2/system/components/justep/row/row" class="x-row cJVvymi" xid="row11" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cJVvymi"> 
                      <div xid="col28" style="margin-left:5px;color:#FF8040;" __cid="cJVvymi" class="cJVvymi"> 
                        <span xid="span119" class="x-output cJVvymi" __cid="cJVvymi">支付状态：</span> 
                      </div>  
                      <div class="x-col cJVvymi" xid="col29" __cid="cJVvymi"> 
                        <span xid="span120" class="x-output cJVvymi" __cid="cJVvymi" data-bind="text:(val('fPayState') &gt; 0 &amp;&amp; val('fPayState') < 100) ? '已支付' : '货到付款'"></span> 
                      </div> 
                    </div>  
                    <div component="$model/UI2/system/components/justep/row/row" class="x-row cJVvymi" xid="row13" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cJVvymi"> 
                      <div class="x-col cJVvymi" xid="col31" __cid="cJVvymi"></div>  
                      <div class="x-col cJVvymi" xid="col32" __cid="cJVvymi"></div>  
                      <div class="x-col cJVvymi" xid="col33" __cid="cJVvymi"></div> 
                    </div> 
                  </li> 
                </ul> 
              </div> 
            </div>  
            <div class="x-content-center x-pull-up cJVvymi" xid="div10" __cid="cJVvymi"> 
              <span class="x-pull-up-label cJVvymi" xid="span15" __cid="cJVvymi">加载更多...</span> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content x-cards cJVvymi" xid="ownContent" component="$model/UI2/system/components/justep/contents/content" data-bind="component:{name:'$model/UI2/system/components/justep/contents/content'}" data-events="onActive:ownContentActive" __cid="cJVvymi"> 
          <div xid="photoDiv" style="height:128px;width:128px;margin:5px auto;" __cid="cJVvymi" class="cJVvymi"> 
            <img alt="" xid="photoImage" height="100%" style="width:100%;" __cid="cJVvymi" class="cJVvymi"> 
          </div>  
          <div class="panel panel-default x-card cJVvymi" __cid="cJVvymi"> 
            <div class="panel-heading clearfix cJVvymi" __cid="cJVvymi"> 
              <h3 class="panel-title pull-left cJVvymi" __cid="cJVvymi">默认联系方式</h3> 
            </div>  
            <div class="modal-body cJVvymi" __cid="cJVvymi"> 
              <form class="form-horizontal cJVvymi" __cid="cJVvymi"> 
                <div class="form-group cJVvymi" __cid="cJVvymi"> 
                  <label class="col-xs-3 control-label cJVvymi" style="word-spacing:20px;padding-top: 12px;" __cid="cJVvymi">姓名</label>  
                  <div class="col-xs-9 cJVvymi" __cid="cJVvymi"> 
                    <input component="$model/UI2/system/components/justep/input/input" class="form-control x-edit cJVvymi" xid="input9" data-bind="component:{ref:userData.ref('fName'),name:'$model/UI2/system/components/justep/input/input'}" __cid="cJVvymi"> 
                  </div> 
                </div>  
                <div class="form-group cJVvymi" __cid="cJVvymi"> 
                  <label class="col-xs-3 control-label cJVvymi" style="word-spacing:20px;padding-top: 12px;" __cid="cJVvymi">电话</label>  
                  <div class="col-xs-9 cJVvymi" __cid="cJVvymi"> 
                    <input component="$model/UI2/system/components/justep/input/input" class="form-control x-edit cJVvymi" xid="input8" data-bind="component:{ref:userData.ref('fPhoneNumber'),name:'$model/UI2/system/components/justep/input/input'}" __cid="cJVvymi"> 
                  </div> 
                </div>  
                <div class="form-group cJVvymi" __cid="cJVvymi"> 
                  <label class="col-xs-3 control-label cJVvymi" style="word-spacing:20px;padding-top: 12px;" __cid="cJVvymi">地址</label>  
                  <div class="col-xs-9 cJVvymi" __cid="cJVvymi"> 
                    <input type="text" class="form-control x-edit cJVvymi" component="$model/UI2/system/components/justep/input/input" xid="input5" data-bind="component:{ref:$model.userData.ref(&#34;fAddress&#34;),name:'$model/UI2/system/components/justep/input/input'}" __cid="cJVvymi"> 
                  </div> 
                </div> 
              </form> 
            </div>  
            <div class="panel-footer clearfix cJVvymi" __cid="cJVvymi"> 
              <a component="$model/UI2/system/components/justep/button/button" class="btn btn-success btn-sm cJVvymi" xid="saveUserBtn" style="float: right;width:100px;" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:saveUserBtnClick" data-config="{&#34;label&#34;:&#34;保存用户信息&#34;}" __cid="cJVvymi"> 
                <i xid="i2" __cid="cJVvymi" class="cJVvymi"></i>  
                <span xid="span1" __cid="cJVvymi" class="cJVvymi">保存用户信息</span> 
              </a> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom cJVvymi" xid="bottom1" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cJVvymi"> 
      <div component="$model/UI2/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified cJVvymi" xid="buttonGroup1" data-bind="component:{name:'$model/UI2/system/components/justep/button/buttonGroup'}" data-config="{&#34;selected&#34;:&#34;foodBtn&#34;,&#34;tabbed&#34;:true}" __cid="cJVvymi"> 
        <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-icon-top cJVvymi" xid="foodBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;icon-beer&#34;,&#34;label&#34;:&#34;菜单&#34;,&#34;target&#34;:&#34;foodContent&#34;}" __cid="cJVvymi"> 
          <i xid="i5" class="icon-beer cJVvymi" __cid="cJVvymi"></i>  
          <span xid="span6" __cid="cJVvymi" class="cJVvymi">菜单</span> 
        </a>  
        <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-icon-top cJVvymi" xid="cartBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;icon-ios7-cart&#34;,&#34;label&#34;:&#34;购物车&#34;,&#34;target&#34;:&#34;cartContent&#34;}" __cid="cJVvymi"> 
          <i xid="i6" class="icon-ios7-cart cJVvymi" __cid="cJVvymi"></i>  
          <span xid="span7" __cid="cJVvymi" class="cJVvymi" data-bind="text:statusData.ref('calcCartCountText')">购物车</span> 
        </a>  
        <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-icon-top cJVvymi" xid="orderBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;icon-ios7-copy&#34;,&#34;label&#34;:&#34;订单&#34;,&#34;target&#34;:&#34;orderContent&#34;}" __cid="cJVvymi"> 
          <i xid="i7" class="icon-ios7-copy cJVvymi" __cid="cJVvymi"></i>  
          <span xid="span8" __cid="cJVvymi" class="cJVvymi">订单</span> 
        </a>  
        <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-icon-top cJVvymi" xid="ownBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;icon-person&#34;,&#34;label&#34;:&#34;我的&#34;,&#34;target&#34;:&#34;ownContent&#34;}" __cid="cJVvymi"> 
          <i xid="i8" class="icon-person cJVvymi" __cid="cJVvymi"></i>  
          <span xid="span9" __cid="cJVvymi" class="cJVvymi">我的</span> 
        </a> 
      </div> 
    </div>  
    <style __cid="cJVvymi" class="cJVvymi">.x-panel.pcbuiu22-iosstatusbar >.x-panel-top {height: 48px;}.x-panel.pcbuiu22-iosstatusbar >.x-panel-content { top: 48px;bottom: nullpx;}.x-panel.pcbuiu22-iosstatusbar >.x-panel-bottom {height: nullpx;}.iosstatusbar .x-panel.pcbuiu22-iosstatusbar >.x-panel-top,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcbuiu22-iosstatusbar >.x-panel-top {height: 68px;}.iosstatusbar .x-panel.pcbuiu22-iosstatusbar >.x-panel-content,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcbuiu22-iosstatusbar >.x-panel-content { top: 68px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcbuiu22-iosstatusbar >.x-panel-top {height: 48px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcbuiu22-iosstatusbar >.x-panel-content {top: 48px;}</style>
  </div>  
  <span component="$model/UI2/system/components/justep/windowDialog/windowDialog" xid="windowDialog1" data-bind="component:{name:'$model/UI2/system/components/justep/windowDialog/windowDialog'}" data-config="{&#34;src&#34;:&#34;$model/UI2/takeout/mapActivity.w&#34;}" __cid="cJVvymi" class="cJVvymi">
    <div class="x-dialog-overlay cJVvymi" __cid="cJVvymi"></div>
    <div class="x-dialog cJVvymi" style="display:none;" __cid="cJVvymi">
      <div class="x-dialog-title cJVvymi" __cid="cJVvymi">
        <button class="close cJVvymi" __cid="cJVvymi">
          <span __cid="cJVvymi" class="cJVvymi">×</span>
        </button>
        <div class="x-dialog-title-text cJVvymi" __cid="cJVvymi"></div>
      </div>
      <div class="x-dialog-body cJVvymi" __cid="cJVvymi"></div>
    </div>
  </span>
</div></div>
        
        <div id="downloadGCF" style="display:none;padding:50px;">
        	<span>您使用的浏览器需要下载插件才能使用, </span>
        	<a id="downloadGCFLink" href="#">下载地址</a>
        	<p>(安装后请重新打开浏览器)</p>
        </div>
    	<script>
    	
    	            //判断浏览器, 判断GCF
    	 			var browser = {
    			        isIe: function () {
    			            return navigator.appVersion.indexOf("MSIE") != -1;
    			        },
    			        navigator: navigator.appVersion,
    			        getVersion: function() {
    			            var version = 999; // we assume a sane browser
    			            if (navigator.appVersion.indexOf("MSIE") != -1)
    			                // bah, IE again, lets downgrade version number
    			                version = parseFloat(navigator.appVersion.split("MSIE")[1]);
    			            return version;
    			        }
    			    };
    				function isGCFInstalled(){
    			      try{
    			        var i = new ActiveXObject('ChromeTab.ChromeFrame');
    			        if (i) {
    			          return true;
    			        }
    			      }catch(e){}
    			      return false;
    				}
    	            //判断浏览器, 判断GCF
    	            var __continueRun = true;
    				if (browser.isIe() && (browser.getVersion() < 10) && !isGCFInstalled()) {
    					document.getElementById("applicationHost").style.display = 'none';
    					document.getElementById("downloadGCF").style.display = 'block';
    					var downloadLink = "/" + location.pathname.match(/[^\/]+/)[0] + "/v8.msi";
    					document.getElementById("downloadGCFLink").href = downloadLink; 
    					__continueRun = false;
    	            }
		 	
    	</script>
        
        <script id="_requireJS" src="../system/lib/require/require.2.1.10.js"> </script>
        <script src="../system/core.min.js"></script><script src="../system/common.min.js"></script><script src="../system/components/comp.min.js"></script><script src="../system/components/comp2.min.js"></script><script id="_mainScript">
        
			if (__continueRun) {
                window.__justep.cssReady = function(fn){
                	var promises = [];
                	for (var p in window.__justep.__ResourceEngine.__loadingCss){
                		if(window.__justep.__ResourceEngine.__loadingCss.hasOwnProperty(p))
                			promises.push(window.__justep.__ResourceEngine.__loadingCss[p].promise());
                	}
                	$.when.apply($, promises).done(fn);
                };
                
            	window.__justep.__ResourceEngine = {
            		readyRegExp : navigator.platform === 'PLAYSTATION 3' ? /^complete$/ : /^(complete|loaded)$/,
            		url: window.location.href,	
            		/*contextPath: 不包括语言 */
            		contextPath: "",
            		serverPath: "",
            		__loadedJS: [],
            		__loadingCss: {},
            		onLoadCss: function(url, node){
            			if (!this.__loadingCss[url]){
            				this.__loadingCss[url] = $.Deferred();	
                			if (node.attachEvent &&
                                    !(node.attachEvent.toString && node.attachEvent.toString().indexOf('[native code') < 0) &&
                                    !(typeof opera !== 'undefined' && opera.toString() === '[object Opera]')) {
                                node.attachEvent('onreadystatechange', this.onLinkLoad.bind(this));
                            } else {
                                node.addEventListener('load', this.onLinkLoad.bind(this), false);
                                node.addEventListener('error', this.onLinkError.bind(this), false);
                            }
            			}
            		},
            		
            		onLinkLoad: function(evt){
            	        var target = (evt.currentTarget || evt.srcElement);
            	        if (evt.type === 'load' ||
                                (this.readyRegExp.test(target.readyState))) {
            	        	var url = target.getAttribute("href");
            	        	if (url && window.__justep.__ResourceEngine.__loadingCss[url]){
            	        		window.__justep.__ResourceEngine.__loadingCss[url].resolve(url);
            	        	}
                        }
            		},
            		
            		onLinkError: function(evt){
            	        var target = (evt.currentTarget || evt.srcElement);
        	        	var url = target.getAttribute("href");
        	        	if (url && window.__justep.__ResourceEngine.__loadingCss[url]){
        	        		window.__justep.__ResourceEngine.__loadingCss[url].resolve(url);
        	        	}
            		},
            		
            		initContextPath: function(){
            			var baseURL = document.getElementById("_requireJS").src;
            			var before = location.protocol + "//" + location.host;
            			var after = "/system/lib/require/require.2.1.10";
            			var i = baseURL.indexOf(after);
            			if (i !== -1){
    	        			var middle = baseURL.substring(before.length, i);
    						var items = middle.split("/");
    						
    						
    						if ((items[items.length-1].indexOf("v_") === 0) 
    								&& (items[items.length-1].indexOf("l_") !== -1)
    								&& (items[items.length-1].indexOf("s_") !== -1)
    								&& (items[items.length-1].indexOf("d_") !== -1)
    								|| (items[items.length-1]=="v_")){
    							items.splice(items.length-1, 1);
    						}
    						
    						
    						if (items.length !== 1){
    							window.__justep.__ResourceEngine.contextPath = items.join("/");
    						}else{
    							window.__justep.__ResourceEngine.contextPath = before;
    						}
    						var index = window.__justep.__ResourceEngine.contextPath.lastIndexOf("/");
    						if (index != -1){
    							window.__justep.__ResourceEngine.serverPath = window.__justep.__ResourceEngine.contextPath.substr(0, index);
    						}else{
    							window.__justep.__ResourceEngine.serverPath = window.__justep.__ResourceEngine.contextPath;
    						}
            			}else{
            				throw new Error(baseURL + " hasn't  " + after);
            			}
            		},
            	
            		loadJs: function(urls){
            			if (urls && urls.length>0){
            				var loadeds = this._getResources("script", "src").concat(this.__loadedJS);
    	       				for (var i=0; i<urls.length; i++){
								var url = urls[i];
    	        				if(!this._isLoaded(url, loadeds)){
    	        					this.__loadedJS[this.__loadedJS.length] = url;
    	        					/*
    	        					var script = document.createElement("script");
    	        					script.src = url;
    	        					document.head.appendChild(script);
    	        					*/
    	        					//$("head").append("<script  src='" + url + "'/>");
									var url = require.toUrl("$UI" + url);
    	        					$.ajax({
    	        						url: url,
    	        						dataType: "script",
    	        						cache: true,
    	        						async: false,
    	        						success: function(){}
    	        						});
    	        				} 
    	       				}
            			}
            		},
            		
            		loadCss: function(styles){
           				var loadeds = this._getResources("link", "href");
            			if (styles && styles.length>0){
            				for (var i=0; i<styles.length; i++){
    	       					var url = window.__justep.__ResourceEngine.contextPath + styles[i].url
    	        				if(!this._isLoaded(url, loadeds)){
    	        					var include = styles[i].include || "";
    	        					var link = $("<link type='text/css' rel='stylesheet' href='" + url + "' include='" + include + "'/>");
    	        					this.onLoadCss(url, link[0]);
    	        					$("head").append(link);
    	        				} 
            				}
            			}
            			
            		},
            		
            		
            		_isLoaded: function(url, loadeds){
            			if (url){
            				var newUrl = "";
            				var items = url.split("/");
            				var isVls = false;
            				for (var i=0; i<items.length; i++){
            					if (isVls){
                					newUrl += "/" + items[i];
            					}else{
                					if (items[i] && (items[i].indexOf("v_")===0)
            								&& (items[i].indexOf("l_")!==-1)
            								&& (items[i].indexOf("s_")!==-1)
            								&& (items[i].indexOf("d_")!==-1)
            								|| (items[i]=="v_")){
                						isVls = true;
                					}
            					}
            				}
            				if (!newUrl)
            					newUrl = url;
            				
            				for (var i=0; i<loadeds.length; i++){
								var originUrl = this._getOriginUrl(loadeds[i]);
								if (originUrl && (originUrl.indexOf(newUrl)!==-1)){
									return true;
								}
    						}
            			}
    					return false;
            		},

					_getOriginUrl: function(url){
						var result = "";
						if (url && (url.indexOf(".md5_")!==-1)){
							url = url.split("#")[0];
							url = url.split("?")[0];
							var items = url.split(".");
							for (var i=0; i<items.length; i++){
								if ((i===items.length-2) && (items[i].indexOf("md5_")!==-1)){
									continue;
								}else{
									if (i>0) result += ".";
									result += items[i];
								}
							}
						}else{
							result = url;
						}
						return result;
					},
            		
            		_getResources: function(tag, attr){
    					var result = [];
    					var scripts = $(tag);
    					for (var i=0; i<scripts.length; i++){
    						var v = scripts[i][attr];
    						if (v){
    							result[result.length] = v;
    						}
    					}
    					return result;
            		}
            	};
            	
            	window.__justep.__ResourceEngine.initContextPath();
    			requirejs.config({
    				baseUrl: window.__justep.__ResourceEngine.contextPath + '/takeout',
    			    paths: {
    			    	/* 解决require.normalizeName与require.toUrl嵌套后不一致的bug   */
    			    	'$model/UI2/v_': window.__justep.__ResourceEngine.contextPath + '',
    			    	'$model/UI2': window.__justep.__ResourceEngine.contextPath + '',
    			    	'$model': window.__justep.__ResourceEngine.serverPath,
    			        'text': window.__justep.__ResourceEngine.contextPath + '/system/lib/require/text.2.0.10',
    			        'bind': window.__justep.__ResourceEngine.contextPath + '/system/lib/bind/bind',
    			        'jquery': window.__justep.__ResourceEngine.contextPath + '/system/lib/jquery/jquery-1.11.1.min'
    			    },
    			    map: {
    				        '*': {
    				            res: '$model/UI2/system/lib/require/res',
    				            cordova: '$model/UI2/system/lib/require/cordova',
    				            w: '$model/UI2/system/lib/require/w',
    				            css: '$model/UI2/system/lib/require/css'
    				        }
    				},
    				waitSeconds: 300
    			});
    			
    			requirejs(['require', 'jquery', '$model/UI2/system/lib/base/composition', '$model/UI2/system/lib/base/url', '$model/UI2/system/lib/route/hashbangParser', '$model/UI2/system/components/justep/versionChecker/versionChecker', '$model/UI2/system/components/justep/loadingBar/loadingBar', '$model/UI2/system/lib/jquery/domEvent',  '$model/UI2/system/lib/cordova/cordova'],  function (require, $, composition, URL, HashbangParser,versionChecker) { 
    				document.addEventListener('deviceready', function() {
    	                if (navigator && navigator.splashscreen && navigator.splashscreen.hide) {
    	                	/*延迟隐藏，视觉效果更理想*/
    	                	setTimeout(function() {navigator.splashscreen.hide();}, 800);
    	                }
    	            }, false);
					setTimeout(function(){
						versionChecker.check();
					},2000);
    				var context = {};
    				context.model = '$model/UI2/takeout/index.w' + (document.location.search || "");
    				context.view = $('#applicationHost').children()[0];
    				var element = document.getElementById('applicationHost');

					    				
    				
    				var ownerid = new URL(window.__justep.__ResourceEngine.url).getParam("$ownerid");
    				var pwindow = opener;
    				if (!pwindow && window.parent && window.parent.window){
    					pwindow = window.parent.window;
    				}
    				if(ownerid && pwindow 
    						&& pwindow.__justep && pwindow.__justep.windowOpeners
    						&& pwindow.__justep.windowOpeners[ownerid]
    						&& $.isFunction(pwindow.__justep.windowOpeners[ownerid].sendToWindow)){
    					window.__justep.setParams = function(params){
    						/* 给windowOpener提供再次传参数的接口  */
    						params = params || {};
    						composition.setParams(document.getElementById('applicationHost'), params);
    					};
    					var winOpener = pwindow.__justep.windowOpeners[ownerid];
    					if(winOpener) winOpener.window = window;
    					$(window).unload(function(event){
    						if(winOpener && winOpener.dispatchCloseEvent) winOpener.dispatchCloseEvent();
    					});
    					var params = winOpener.sendToWindow();
						context.owner = winOpener;
						context.params = params || {};
	        			composition.compose(element, context);
    				}else{
        				var params =  {};
    					var state = new HashbangParser(window.location.hash).parse().__state;
    					if (state){
    						params = state.get("");
    						try{
    							params = JSON.parse(params);
    							if (params.hasOwnProperty("__singleValue__")){
    								params = params.__singleValue__;
    							}
    						}catch(e1){}
    					}
    					context.noUpdateState = true;
        				context.params = params;
        				composition.compose(element, context);
    				}
    			});    
            }
		 	
        </script>
    </body>
</html>
