package com.jeancoder.report.entry.report

import com.jeancoder.app.sdk.JC
import com.jeancoder.core.result.Result
import com.jeancoder.jdbc.JcPage
import com.jeancoder.report.ready.helper.GlobalHolder
import com.jeancoder.report.ready.report.entity.SysReportDesign
import com.jeancoder.report.ready.report.service.SysReportDesignService

//if(pn == null){
//	pn = 1;
//}
//if(ps == null){
//	ps = 20;
//}
//Page<SysReportDesign> page = sysReportDesignService.getDesignPage(proj.getId(), ps, pn);
//model.addAttribute("page", page);
//return TemplateUtil.admin_view(this.getSysProj()) + "detail/pdrreport/pdrreport_index";
//



def pn = JC.request.param('pn')?.toString();
def ps = JC.request.param('ps')?.toString();
try {
	pn = Integer.valueOf(pn);
} catch(any) { pn = 1;}

try {
	ps = Integer.valueOf(ps);
} catch(any) { ps = 20;}

SysReportDesignService sysReportDesignService = SysReportDesignService.INSTANCE;
JcPage<SysReportDesign> page = sysReportDesignService.getDesignPage(GlobalHolder.proj.id.toLong(), ps, pn);

Result result = new Result().setView("report/pdrreport_index");
result.addObject('page', page);

return result;
