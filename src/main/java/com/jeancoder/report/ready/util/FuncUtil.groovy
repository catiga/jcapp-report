package com.jeancoder.report.ready.util

import com.jeancoder.report.ready.dto.sys.AppFunction
import com.jeancoder.report.ready.dto.sys.SysFunction;


class FuncUtil {

	public static SysFunction build_old(def id, def name, def parent, def url, def icon = 'fa-cubese', def lev = 1) {
		SysFunction fun = new SysFunction();
		fun.id = id;
		fun.func_name = name;
		fun.parent_id = parent;
		fun.click_url = url;
		fun.func_type = '1000';
		fun.level = lev;
		fun.func_ss = icon;
		return fun;
	}
	
	public static def build(def id, def name, def parent, def url, def icon = 'fa-cubese', def lev = 1) {
		def fun = new AppFunction();
		fun.id = id;
		fun.func_name = name;
		fun.parent_id = parent;
		fun.click_url = url;
		fun.func_type = '1000';
		fun.level = lev;
		fun.func_ss = icon;
		return fun;
	}
}
