package com.jeancoder.report.entry.common

import com.jeancoder.app.sdk.JC
import com.jeancoder.app.sdk.source.LoggerSource
import com.jeancoder.core.log.JCLogger
import com.jeancoder.core.result.Result
import com.jeancoder.report.ready.common.AvailabilityStatus
import com.jeancoder.report.ready.dto.sys.SysProjectInfo
import com.jeancoder.report.ready.helper.GlobalHolder

JCLogger Logger = LoggerSource.getLogger(this.getClass().getName());
Result result = new Result();
try {
	def list = JC.internal.call(SysProjectInfo, 'project', '/incall/project_list', [pid:GlobalHolder.proj.id]);
	result.setData(AvailabilityStatus.available(list));
} catch (Exception e) {
	Logger.error("查询项目失败", e);
	result.setData(AvailabilityStatus.notAvailable("查询项目列表失败"));
}
return result;