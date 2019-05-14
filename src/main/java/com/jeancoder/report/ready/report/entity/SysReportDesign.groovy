package com.jeancoder.report.ready.report.entity;

import java.beans.Transient;
import java.sql.Timestamp;

import com.jeancoder.jdbc.bean.JCBean;
import com.jeancoder.jdbc.bean.JCForeign
import com.jeancoder.jdbc.bean.JCID
import com.jeancoder.jdbc.bean.JCNotColumn
import com.jeancoder.report.ready.util.JackSonBeanMapper

@JCBean(tbname = "sys_report_design")
public class SysReportDesign {
	
	@JCID
	BigInteger id;
	
	String report_no;
	String report_name;
	String report_desc;
	String report_sql;
	String report_field;
	String report_from;
	String report_where;
	String report_dimension;
	String report_measure;
	
	@JCForeign
	Long proj_id;
	
	@JCForeign
	Long user_id;
	
	@JCNotColumn
	List<SysReportCondition> conditions;
	
	Date a_time = new Date();
	Timestamp c_time = new Timestamp(Calendar.getInstance().getTimeInMillis());
	Integer flag = 0;
	
	@Transient
	public List<ReportField> getReportDimensionObj(){
		try {
			return JackSonBeanMapper.jsonToList(this.report_dimension, SysReportDesign.ReportField.class);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Transient
	public List<ReportField> getReportMeasureObj(){
		try {
			return JackSonBeanMapper.jsonToList(this.report_measure, SysReportDesign.ReportField.class);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Transient
	public List<ReportField> getReportFieldObj(){
		try {
			return JackSonBeanMapper.jsonToList(this.report_field, SysReportDesign.ReportField.class);
		} catch (Exception e) {
			return null;
		}
	}
	
	@Transient
	public List<String> getReportWhereObj(){
		if(this.report_where == null || "".equals(this.report_where)){
			return null;
		}
		try {
			return JackSonBeanMapper.jsonToList(this.report_where,String.class);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static class ReportField{
		private String key;
		private String expression;
		private String alias;
		private String view_name;
		public String getKey() {
			return key;
		}
		public void setKey(String key) {
			this.key = key;
		}
		public String getExpression() {
			return expression;
		}
		public void setExpression(String expression) {
			this.expression = expression;
		}
		public String getAlias() {
			return alias;
		}
		public void setAlias(String alias) {
			this.alias = alias;
		}
		public String getView_name() {
			if(this.view_name != null && !"".equals(this.view_name)){
				return view_name;
			}
			if(this.alias != null && !"".equals(this.alias)){
				return alias;
			}
			return expression;
		}
		public String getOrgViewName(){
			return view_name;
		}
		public void setView_name(String view_name) {
			this.view_name = view_name;
		}
	}
}
