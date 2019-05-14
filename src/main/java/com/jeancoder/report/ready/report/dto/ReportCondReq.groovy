package com.jeancoder.report.ready.report.dto;

public class ReportCondReq {
	private String keyword;
	private String condname;
	private String type;
	private String expression;
	private String expression_type;
	private String key;
	private String value;
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getCondname() {
		return condname;
	}
	public void setCondname(String condname) {
		this.condname = condname;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getExpression() {
		return expression;
	}
	public void setExpression(String expression) {
		this.expression = expression;
	}
	public String getExpression_type() {
		return expression_type;
	}
	public void setExpression_type(String expression_type) {
		this.expression_type = expression_type;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
}
