package com.jeancoder.report.ready.helper

import com.jeancoder.report.ready.dto.sys.AuthToken
import com.jeancoder.report.ready.dto.sys.SysProjectInfo

class GlobalHolder {

	private static ThreadLocal<SysProjectInfo> _sys_project_ = new ThreadLocal<SysProjectInfo>();
	
	private static ThreadLocal<AuthToken> _auth_tokens_ = new ThreadLocal<AuthToken>();
	
	public static void setProj(SysProjectInfo e) {
		_sys_project_.set(e);
	}
	
	public static SysProjectInfo getProj() {
		SysProjectInfo current = _sys_project_.get();
		return current;
	}
	
	public static void setAuthToken(AuthToken at) {
		_auth_tokens_.set(at);
	}
	
	public static AuthToken getAuthToken() {
		
		AuthToken current = _auth_tokens_.get();
		return current;
	}
	
	public static void  remove() {
		_auth_tokens_.remove();
		_sys_project_.remove();
	}
	
}
