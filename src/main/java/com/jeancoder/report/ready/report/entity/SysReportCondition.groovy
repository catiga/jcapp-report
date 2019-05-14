package com.jeancoder.report.ready.report.entity;

import java.beans.Transient;
import java.sql.Timestamp;

import com.jeancoder.jdbc.bean.JCBean;
import com.jeancoder.jdbc.bean.JCForeign
import com.jeancoder.jdbc.bean.JCID
import com.jeancoder.jdbc.bean.JCNotColumn
import com.jeancoder.report.ready.util.JackSonBeanMapper

@JCBean(tbname = "sys_report_condition")
public class SysReportCondition {
	
	@JCID
	BigInteger id;
	
	@JCForeign
	BigInteger design_id;
	
	String cond_keyword;
	
	String cond_name;
	
	String cond_type;
	
	String cond_expression;
	
	String cond_expression_type;
	
	String cond_where_value;
	
	String cond_view_value;
	
	@JCNotColumn
	SysReportDesign design;
	
	Date a_time = new Date();
	Timestamp c_time = new Timestamp(Calendar.getInstance().getTimeInMillis());
	Integer flag = 0;
	
	
	@Transient
	public SysReportCondition.CondExpression getCondExpressionObj(){
		return (SysReportCondition.CondExpression) JackSonBeanMapper.fromJson(this.cond_expression, SysReportCondition.CondExpression.class);
	}
	
	public static class CondExpression{
		private String orgExpression;
		private List<String> where;
		public String getOrgExpression() {
			return orgExpression;
		}
		public void setOrgExpression(String orgExpression) {
			this.orgExpression = orgExpression;
		}
		public List<String> getWhere() {
			return where;
		}
		public void setWhere(List<String> where) {
			this.where = where;
		}
	}
}
