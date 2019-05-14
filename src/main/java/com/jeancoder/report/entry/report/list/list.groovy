package com.jeancoder.report.entry.report.list

import com.jeancoder.app.sdk.JC
import com.jeancoder.core.result.Result
import com.jeancoder.jdbc.JcPage
import com.jeancoder.report.ready.helper.GlobalHolder
import com.jeancoder.report.ready.report.entity.SysReportDesign
import com.jeancoder.report.ready.report.service.SysReportDesignService

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

Result result = new Result().setView("report/list/list");
result.addObject('page', page);

return result;
