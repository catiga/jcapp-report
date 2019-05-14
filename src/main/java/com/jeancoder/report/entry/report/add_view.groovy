package com.jeancoder.report.entry.report

import com.jeancoder.app.sdk.JC
import com.jeancoder.core.result.Result
import com.jeancoder.report.ready.report.entity.SysReportDesign
import com.jeancoder.report.ready.report.service.SysReportDesignService

//if(report_id != null){
//	SysReportDesign detail = sysReportDesignService.getDesignById(report_id);
//	model.addAttribute("edit_report", detail);
//}
//return TemplateUtil.admin_view(this.getSysProj()) + "detail/pdrreport/pdrreport_update";


Result result = new Result().setView('report/pdrreport_update');

def report_id = JC.request.param('report_id');
SysReportDesign report = new SysReportDesign();
if(report_id) {
	report = SysReportDesignService.INSTANCE.getDesignById(report_id);
}
result.addObject('edit_report', report);

return result;


