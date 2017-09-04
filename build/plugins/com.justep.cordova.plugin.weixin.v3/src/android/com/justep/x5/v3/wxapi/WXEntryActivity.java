package com.justep.x5.v3.wxapi;

import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

import com.justep.cordova.Config;
import com.justep.cordova.plugin.weixin.WeixinV3;
import com.tencent.mm.sdk.constants.ConstantsAPI;
import com.tencent.mm.sdk.modelbase.BaseReq;
import com.tencent.mm.sdk.modelbase.BaseResp;
import com.tencent.mm.sdk.modelmsg.SendAuth;
import com.tencent.mm.sdk.openapi.IWXAPI;
import com.tencent.mm.sdk.openapi.IWXAPIEventHandler;

public class WXEntryActivity extends Activity implements IWXAPIEventHandler {

	private static final String TAG = "Weixin";

	private IWXAPI api;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		Log.e("Weixin", "WXPayEntryActivity onCreate");
		Config.init();
		if (api == null && WeixinV3.api == null) {
			startMainActivity();
		}else if (api == null) {
			api = WeixinV3.api;
		}
		if(api != null)
		api.handleIntent(getIntent(), this);
	}

	@Override
	protected void onNewIntent(Intent intent) {
		super.onNewIntent(intent);
		Log.e("Weixin", "WXPayEntryActivity onNewIntent");
		setIntent(intent);
		api.handleIntent(intent, this);
	}

	@Override
	public void onReq(BaseReq req) {
		Log.e("Weixin", "WXPayEntryActivity onReq");
	}

	@Override
	public void onResp(BaseResp resp) {
		Log.d(WeixinV3.TAG, resp.toString());

		if (WeixinV3.instance.getCurrentCallbackContext() == null) {
			startMainActivity();
			return;
		}

		switch (resp.errCode) {
		case BaseResp.ErrCode.ERR_OK:
			switch (resp.getType()) {
			case ConstantsAPI.COMMAND_SENDAUTH:
				auth(resp);
				break;

			case ConstantsAPI.COMMAND_PAY_BY_WX:
			default:
				WeixinV3.instance.getCurrentCallbackContext().success();
				break;
			}
			break;
		case BaseResp.ErrCode.ERR_USER_CANCEL:
			WeixinV3.instance.getCurrentCallbackContext().error(WeixinV3.ERROR_WECHAT_RESPONSE_USER_CANCEL);
			break;
		case BaseResp.ErrCode.ERR_AUTH_DENIED:
			WeixinV3.instance.getCurrentCallbackContext().error(WeixinV3.ERROR_WECHAT_RESPONSE_AUTH_DENIED);
			break;
		case BaseResp.ErrCode.ERR_SENT_FAILED:
			WeixinV3.instance.getCurrentCallbackContext().error(WeixinV3.ERROR_WECHAT_RESPONSE_SENT_FAILED);
			break;
		case BaseResp.ErrCode.ERR_UNSUPPORT:
			WeixinV3.instance.getCurrentCallbackContext().error(WeixinV3.ERROR_WECHAT_RESPONSE_UNSUPPORT);
			break;
		case BaseResp.ErrCode.ERR_COMM:
			WeixinV3.instance.getCurrentCallbackContext().error(WeixinV3.ERROR_WECHAT_RESPONSE_COMMON);
			break;
		default:
			WeixinV3.instance.getCurrentCallbackContext().error(WeixinV3.ERROR_WECHAT_RESPONSE_UNKNOWN);
			break;
		}

		finish();
	}

	protected void auth(BaseResp resp) {
		SendAuth.Resp res = ((SendAuth.Resp) resp);

		Log.d(TAG, res.toString());

		JSONObject response = new JSONObject();
		try {
			Bundle bundle=new Bundle();
			res.toBundle(bundle);
			response.put("code", res.code);
			response.put("state", res.state);
		} catch (JSONException e) {
			Log.e(TAG, e.getMessage());
		}

		WeixinV3.instance.getCurrentCallbackContext().success(response);

	}

	protected void startMainActivity() {
		Intent intent = new Intent();
		intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		intent.setPackage(getApplicationContext().getPackageName());
		getApplicationContext().startActivity(intent);
	}
}
