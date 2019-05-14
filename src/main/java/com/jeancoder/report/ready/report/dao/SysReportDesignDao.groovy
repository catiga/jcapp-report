package com.jeancoder.report.ready.report.dao;

import com.jeancoder.jdbc.JcTemplate
import com.jeancoder.report.ready.report.entity.SysReportCondition
import com.jeancoder.report.ready.report.entity.SysReportDesign;

public class SysReportDesignDao {
	
	public final static SysReportDesignDao INSTANCE = new SysReportDesignDao();
	
	public SysReportDesign findByNo(String reportNo){
		String hql = "SELECT * FROM SysReportDesign WHERE report_no = ? AND flag <> ?";
//		return this.findUnique(hql,reportNo,-1);
		SysReportDesign design = JcTemplate.INSTANCE().get(SysReportDesign, hql, reportNo, -1);
		
		if(design) {
			hql = 'select * from SysReportCondition where design_id=? order by id asc';
			def result = JcTemplate.INSTANCE().find(SysReportCondition, hql, design.id);
			design.conditions = result;
		}
		
		return design;
	}
}
