package com.jeancoder.report.entry.report.aj

import com.jeancoder.app.sdk.JC
import com.jeancoder.report.ready.common.SimpleAjax
import com.jeancoder.report.ready.dto.sys.SysProjectInfo
import com.jeancoder.report.ready.helper.GlobalHolder
import com.jeancoder.report.ready.report.entity.SysReportCondition
import com.jeancoder.report.ready.report.entity.SysReportDesign
import com.jeancoder.report.ready.report.service.SysReportDesignService
import com.jeancoder.report.ready.util.JackSonBeanMapper

def report_no = JC.request.param('report_no');
def keyword = JC.request.param('keyword');

SysReportDesignService sysReportDesignService = SysReportDesignService.INSTANCE;

Map<String,Object> syswherevalue = getSyswherevalue();
try {
	List<Map<String,Object>> resbody = new ArrayList<Map<String,Object>>();
	SysReportDesign design = sysReportDesignService.getDesignByNo(report_no);
	for(SysReportCondition cond : design.getConditions()){
		if(keyword.equals(cond.getCond_keyword())){
			if("JSON".equalsIgnoreCase(cond.getCond_expression_type())){
				List<Map<String,Object>> expdatas = JackSonBeanMapper.jsonToList(cond.getCondExpressionObj().getOrgExpression());
				for(Map<String,Object> expdata : expdatas){
					Map<String,Object> item = new HashMap<String,Object>();
					if(expdata.containsKey(cond.getCond_where_value())){
						item.put("id", expdata.get(cond.getCond_where_value()));
					}
					if(expdata.containsKey(cond.getCond_view_value())){
						item.put("name", expdata.get(cond.getCond_view_value()));
					}
					resbody.add(item);
				}
			}else if("SQL".equalsIgnoreCase(cond.getCond_expression_type())){
				String exp = cond.getCondExpressionObj().getOrgExpression();
				List<Map<String,Object>> expdatas = sysReportDesignService.executeSqlQuery(exp,syswherevalue);
				for(Map<String,Object> expdata : expdatas){
					Map<String,Object> item = new HashMap<String,Object>();
					if(expdata.containsKey(cond.getCond_where_value())){
						item.put("id", expdata.get(cond.getCond_where_value()));
					}
					if(expdata.containsKey(cond.getCond_view_value())){
						item.put("name", expdata.get(cond.getCond_view_value()));
					}
					resbody.add(item);
				}
			}
		}
	}
//	return AvailabilityStatus.available(new String[]{},new RetObj(){
//		@Override
//		public Object getObj() {
//			return resbody;
//		}
//	});
	return SimpleAjax.available('', resbody);
} catch (Exception e) {
	e.printStackTrace();
//	return AvailabilityStatus.notAvailable(e.getMessage());
	return SimpleAjax.notAvailable(e.getMessage());
}


public Map<String,Object> getSyswherevalue(){
	SysProjectInfo proj = GlobalHolder.proj;
	Map<String,Object> syswherevalue = new HashMap<String,Object>();
	syswherevalue.put("sys_kw_proj_id", proj.getId());
	syswherevalue.put("sys_kw_user_id", GlobalHolder.getAuthToken().user?.getId());
	syswherevalue.put("sys_kw_merch_id", proj.id);
	return syswherevalue;
}





