package com.jeancoder.report.interceptor.project

import com.jeancoder.annotation.urlmapped
import com.jeancoder.app.sdk.JC
import com.jeancoder.app.sdk.source.ResultSource
import com.jeancoder.core.http.JCRequest
import com.jeancoder.core.http.JCThreadLocal
import com.jeancoder.core.result.Result
import com.jeancoder.report.ready.dto.sys.SysProjectInfo
import com.jeancoder.report.ready.helper.GlobalHolder
import com.jeancoder.report.ready.util.NativeUtil

@urlmapped("/")
JCRequest req = JC.request.get();
GlobalHolder.remove();
String domain = req.getServerName();
//domain = "jcloudapp.pdr365.com";
SysProjectInfo project = NativeUtil.connect(SysProjectInfo.class, 'project', '/incall/project', ["domain":domain]);
GlobalHolder.setProj(project);
req.setAttribute("current_project", project)
req.setAttribute('pub_bucket', 'https://cdn.iplaysky.com/static/');
return true;
