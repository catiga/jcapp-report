package com.jeancoder.report.ready.dto.sys

import java.sql.Timestamp

class SysFunction {

	BigInteger id;
	
	String func_name;
	
	String func_ss;
	
	String func_type;
	
	String func_info;
	
	BigInteger parent_id;
	
	Timestamp c_time;
	
	Timestamp a_time;
	
	Integer flag = 0;
	
	Integer level;
	
	String click_url;
	
	Boolean whole;
	
	Boolean hasson;
	
	Integer sort;
	
	String limpro;

}
