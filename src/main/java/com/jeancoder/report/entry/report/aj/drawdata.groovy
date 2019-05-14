package com.jeancoder.report.entry.report.aj

import com.jeancoder.app.sdk.JC
import com.jeancoder.app.sdk.source.LoggerSource
import com.jeancoder.core.log.JCLogger
import com.jeancoder.jdbc.JcPage
import com.jeancoder.report.ready.common.SimpleAjax
import com.jeancoder.report.ready.dto.sys.SysProjectInfo
import com.jeancoder.report.ready.helper.GlobalHolder
import com.jeancoder.report.ready.report.dto.DrawDataReq
import com.jeancoder.report.ready.report.service.SysReportDesignService
import com.jeancoder.report.ready.util.JackSonBeanMapper

def report_no = JC.request.param('report_no');
def reqbody = JC.request.param('reqbody');

JCLogger logger = LoggerSource.getLogger();

SysReportDesignService sysReportDesignService = SysReportDesignService.INSTANCE;

logger.info('report_no=' + report_no);
logger.info(reqbody);
try {
	reqbody = URLDecoder.decode(reqbody, 'UTF-8');
	Map<String,Object> syswherevalue = getSyswherevalue();
	DrawDataReq reqobj = (DrawDataReq) JackSonBeanMapper.fromJson(reqbody,DrawDataReq.class);
	JcPage<Object> resdata = sysReportDesignService.executeSqlQuery(report_no, reqobj, syswherevalue);
	
	return SimpleAjax.available('', resdata);
} catch (Exception e) {
	e.printStackTrace();
	return SimpleAjax.notAvailable(e.getMessage());
}

Map<String,Object> getSyswherevalue(){
	SysProjectInfo proj = GlobalHolder.proj;
	Map<String,Object> syswherevalue = new HashMap<String,Object>();
	syswherevalue.put("sys_kw_proj_id", proj.id);
	syswherevalue.put("sys_kw_user_id", GlobalHolder.getAuthToken().user?.id);
	syswherevalue.put("sys_kw_merch_id", proj.id);
	return syswherevalue;
}