package com.jeancoder.report.entry.report.aj

import com.jeancoder.app.sdk.JC
import com.jeancoder.report.ready.common.SimpleAjax
import com.jeancoder.report.ready.report.dto.SelectItemRes
import com.jeancoder.report.ready.report.service.SysReportDesignService

SysReportDesignService sysReportDesignService = SysReportDesignService.INSTANCE;

def sql = JC.request.param('sql');
try {
	List<SelectItemRes> resbody = sysReportDesignService.analysis_sql(sql);
	
	return SimpleAjax.available('', resbody);
} catch (Exception e) {
//	return AvailabilityStatus.notAvailable(e.getCause().toString());
	e.printStackTrace();
	return SimpleAjax.notAvailable(e.getCause().toString());
}
