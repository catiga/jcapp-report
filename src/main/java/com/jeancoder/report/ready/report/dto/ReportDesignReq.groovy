package com.jeancoder.report.ready.report.dto;

import java.util.List;

public class ReportDesignReq {
	private Long id;
	private String report_name;
	private String report_no;
	private String sql;
	private List<String> dimensions;
	private List<String> measures;
	private List<ReportCondReq> conds;
	private List<ReportFieldReq> fields;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getReport_name() {
		return report_name;
	}
	public void setReport_name(String report_name) {
		this.report_name = report_name;
	}
	public String getReport_no() {
		return report_no;
	}
	public void setReport_no(String report_no) {
		this.report_no = report_no;
	}
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	public List<String> getDimensions() {
		return dimensions;
	}
	public void setDimensions(List<String> dimensions) {
		this.dimensions = dimensions;
	}
	public List<String> getMeasures() {
		return measures;
	}
	public void setMeasures(List<String> measures) {
		this.measures = measures;
	}
	public List<ReportCondReq> getConds() {
		return conds;
	}
	public void setConds(List<ReportCondReq> conds) {
		this.conds = conds;
	}
	public List<ReportFieldReq> getFields() {
		return fields;
	}
	public void setFields(List<ReportFieldReq> fields) {
		this.fields = fields;
	}
}
