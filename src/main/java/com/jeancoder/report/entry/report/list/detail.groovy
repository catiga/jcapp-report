package com.jeancoder.report.entry.report.list

import com.jeancoder.app.sdk.JC
import com.jeancoder.core.result.Result
import com.jeancoder.report.ready.report.entity.SysReportDesign
import com.jeancoder.report.ready.report.service.SysReportDesignService

def report_no = JC.request.param('report_no');

SysReportDesignService sysReportDesignService = SysReportDesignService.INSTANCE;

Result result = new Result().setView('report/list/detail');

String err_msg = null;
SysReportDesign design = sysReportDesignService.getDesignByNo(report_no);
if(design == null){
	err_msg = "报表不存在";
}
result.addObject("report", design);
result.addObject("err_msg", err_msg);

return result;