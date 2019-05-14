package com.jeancoder.report.entry.report.aj

import com.jeancoder.app.sdk.JC
import com.jeancoder.app.sdk.source.LoggerSource
import com.jeancoder.app.sdk.source.ResponseSource
import com.jeancoder.core.http.JCResponse
import com.jeancoder.core.log.JCLogger
import com.jeancoder.core.result.Result
import com.jeancoder.core.util.JackSonBeanMapper
import com.jeancoder.report.ready.dto.sys.SysProjectInfo
import com.jeancoder.report.ready.helper.GlobalHolder
import com.jeancoder.report.ready.report.dto.DrawDataReq
import com.jeancoder.report.ready.report.entity.SysReportDesign
import com.jeancoder.report.ready.report.service.SysReportDesignService

JCResponse res = ResponseSource.getResponse();
JCLogger  Logger = LoggerSource.getLogger(this.getClass());
def report_no = JC.request.param('report_no');
def type = JC.request.param('type');
def param = JC.request.param('param');

SysReportDesignService sysReportDesignService = SysReportDesignService.INSTANCE;
try {
	Map<String,Object> syswherevalue = getSyswherevalue();
	DrawDataReq reqobj = (DrawDataReq) JackSonBeanMapper.fromJson(param,DrawDataReq.class);
//	res.setContentType("application/vnd.ms-excel");
//	res.setHeader("Content-Disposition", "attachment;fileName=奥术大师大.xls");
	InputStream ins = sysReportDesignService.executeSqlQuery4Excel(report_no, reqobj, syswherevalue);
	return new Result().setStream(ins, report_no + ".xls")
} catch (Exception e) {
	Logger.error("",e);
}


public Map<String,Object> getSyswherevalue(){
	SysProjectInfo proj = GlobalHolder.proj;
	Map<String,Object> syswherevalue = new HashMap<String,Object>();
	syswherevalue.put("sys_kw_proj_id", proj.getId());
	syswherevalue.put("sys_kw_user_id", GlobalHolder.getAuthToken().user?.getId());
	syswherevalue.put("sys_kw_merch_id", proj.id);
	return syswherevalue;
}

