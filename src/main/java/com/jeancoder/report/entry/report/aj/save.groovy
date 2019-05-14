package com.jeancoder.report.entry.report.aj

import com.jeancoder.app.sdk.JC
import com.jeancoder.app.sdk.source.LoggerSource
import com.jeancoder.core.log.JCLogger
import com.jeancoder.report.ready.common.SimpleAjax
import com.jeancoder.report.ready.dto.sys.AuthUser
import com.jeancoder.report.ready.dto.sys.SysProjectInfo
import com.jeancoder.report.ready.helper.GlobalHolder
import com.jeancoder.report.ready.report.dto.ReportDesignReq
import com.jeancoder.report.ready.report.service.SysReportDesignService
import com.jeancoder.report.ready.util.JackSonBeanMapper

SysReportDesignService sysReportDesignService = SysReportDesignService.INSTANCE;

SysProjectInfo proj = GlobalHolder.proj;

AuthUser user = GlobalHolder.getAuthToken().user;
JCLogger Logger = LoggerSource.getLogger();

def reqbody = JC.request.param('reqbody');

try {
	reqbody = URLDecoder.decode(reqbody, 'UTF-8');
	reqbody = reqbody.replace("&lt;", "<");
	reqbody = reqbody.replace("&gt;", ">");
	ReportDesignReq design = (ReportDesignReq) JackSonBeanMapper.fromJson(reqbody, ReportDesignReq.class);
	sysReportDesignService.saveReport(design,proj.id.toLong(),user.id.toLong());
	
	return SimpleAjax.available();
} catch (Exception e) {
	e.printStackTrace();
	return SimpleAjax.notAvailable(e.message);
}
