/*
       Licensed to the Apache Software Foundation (ASF) under one
       or more contributor license agreements.  See the NOTICE file
       distributed with this work for additional information
       regarding copyright ownership.  The ASF licenses this file
       to you under the Apache License, Version 2.0 (the
       "License"); you may not use this file except in compliance
       with the License.  You may obtain a copy of the License at

         http://www.apache.org/licenses/LICENSE-2.0

       Unless required by applicable law or agreed to in writing,
       software distributed under the License is distributed on an
       "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
       KIND, either express or implied.  See the License for the
       specific language governing permissions and limitations
       under the License.
 */

package com.wex5.takeout;

import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.preference.PreferenceManager;
import android.webkit.WebView;
import android.widget.Toast;

import com.tencent.smtt.sdk.QbSdk;
import com.tencent.smtt.sdk.TbsDownloader;

import org.apache.cordova.Config;
import org.apache.cordova.CordovaActivity;
import org.apache.cordova.engine.SystemWebViewEngine;

import java.io.File;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MainActivity extends CordovaActivity
{
    public static String TAG = "CordovaActivity";
    private void createPicturesDir() {
        File storageDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES);
        storageDir.mkdirs();
    }

    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        String className = preferences.getString("webviewEngine", "system");
        if(className.equals("auto")){
            createBySmartWebView();
        }else if(className.equals("tencent")){
            createByTencentWebView();
        }else if(className.equals("system")){
            createBySystemWebView();
        }else if(className.equals("crossWalk")){
            createByCrossWalkWebView();
        }else{
            createBySystemWebView();
        }
        createPicturesDir();
    }

    private void startLoadUrl(String url) {
        //动态设置启动页面
        String versionName = "5.3.0";
        try {
            PackageManager packageManager = this.getPackageManager();
            versionName = packageManager.getPackageInfo(this.getPackageName(), 0).versionName;
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }

        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(this);
        try{
            String versionNameKey = "__currentVersionName";
            if (sharedPrefs.contains(versionNameKey)) {
                String curVersionName = (String)sharedPrefs.getAll().get(versionNameKey);
                if(!versionName.equals(curVersionName)){
                    //版本更新后首次启动
                    File wwwDir = new File(this.getApplicationContext().getFilesDir() + "/www");
                    if(wwwDir.isDirectory() && wwwDir.exists()){
                        wwwDir.renameTo(new File(this.getApplicationContext().getFilesDir() + "/www_bak"));
                    }
                }
            }
            SharedPreferences.Editor editor = sharedPrefs.edit();
            editor.putString(versionNameKey, versionName);
            editor.commit();
        }catch(Exception e){
            e.printStackTrace();
        }

        String indexPageKey = "indexPage_" + versionName;
        if (sharedPrefs.contains(indexPageKey)) {
            Object obj = sharedPrefs.getAll().get(indexPageKey);
            loadUrl(obj.toString());
        } else {
            loadUrl(Config.getStartUrl());
        }
    }

    private void createBySmartWebView(){
        int chromeVersion = 37;
        String userAgent = new WebView(getApplicationContext()).getSettings().getUserAgentString();
        Pattern chromePattern = Pattern.compile("chrome\\/([\\d]+)", Pattern.CASE_INSENSITIVE);
        Matcher matcher = chromePattern.matcher(userAgent);
        if(matcher.find())
        {
            chromeVersion = Integer.parseInt(matcher.group(1));
        }
        if(chromeVersion >= 39){
            createBySystemWebView();
        }else{
            createByTencentWebView();
        }
    }

    private void createByTencentWebView(){
    	preferences.set("webview","com.justep.cordova.plugin.engine.tencent.TencentWebViewEngine");
        TbsDownloader.needDownload(this.getApplicationContext(), false);
        if(QbSdk.isTbsCoreInited()){
            startLoadUrl(launchUrl);
        }else{
            Toast.makeText(this.getApplicationContext(), "正在进行首次启动的初始化,请稍候...",Toast.LENGTH_LONG).show();
            new Handler().postDelayed(new Runnable() {
                public void run() {
                    startLoadUrl(launchUrl);
                }
            }, 3000);
        }
    }

    private void createBySystemWebView(){
        preferences.set("webview",SystemWebViewEngine.class.getCanonicalName());
        startLoadUrl(launchUrl);
    }

    private void createByCrossWalkWebView(){
        preferences.set("webview","org.crosswalk.engine.XWalkWebViewEngine");
        startLoadUrl(launchUrl);
    }
}
