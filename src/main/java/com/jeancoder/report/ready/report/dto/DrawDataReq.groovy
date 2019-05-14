package com.jeancoder.report.ready.report.dto;

import java.util.List;
import java.util.Map;

public class DrawDataReq {
	private Map<String,String> wheres;
	List<String> dimensions;
	List<String> measure;
	private Integer noPageMaxSize = 100;
	private Integer pageSize = 25;
	private Integer pageNo = 1;
	private String sortBy;
	public Map<String, String> getWheres() {
		return wheres;
	}
	public void setWheres(Map<String, String> wheres) {
		this.wheres = wheres;
	}
	public List<String> getDimensions() {
		return dimensions;
	}
	public void setDimensions(List<String> dimensions) {
		this.dimensions = dimensions;
	}
	public List<String> getMeasure() {
		return measure;
	}
	public void setMeasure(List<String> measure) {
		this.measure = measure;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public String getSortBy() {
		return sortBy;
	}
	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}
	public Integer getNoPageMaxSize() {
		return noPageMaxSize;
	}
	public void setNoPageMaxSize(Integer noPageMaxSize) {
		this.noPageMaxSize = noPageMaxSize;
	}
}
