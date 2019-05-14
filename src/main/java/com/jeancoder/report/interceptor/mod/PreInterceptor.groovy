package com.jeancoder.report.interceptor.mod

import java.util.List
import java.util.Map

import com.jeancoder.annotation.urlmapped
import com.jeancoder.annotation.urlpassed
import com.jeancoder.app.sdk.JC
import com.jeancoder.core.http.JCRequest
import com.jeancoder.core.util.JackSonBeanMapper
import com.jeancoder.report.ready.dto.sys.AppFunction
import com.jeancoder.report.ready.dto.sys.SysFunction
import com.jeancoder.report.ready.dto.sys.SysProjectInfo
import com.jeancoder.report.ready.helper.GlobalHolder
import com.jeancoder.report.ready.util.FuncUtil
import com.jeancoder.report.ready.util.NativeUtil

@urlmapped("/")


def mod_g = FuncUtil.build(1, '报表管理', null, '', 'fa-shopping-cart');
def mod_g1 = FuncUtil.build(101, '会员充值报表', 1, 'index', 'fa-shopping-cart',2);
def mod_g2 = FuncUtil.build(102, '商品网售售卖报表', 1, 'online_goods/index', 'fa-shopping-cart',2);
def mod_g3 = FuncUtil.build(103, '商品收银台报表', 1, 'commodity_register/index', 'fa-shopping-cart',2);
def mod_g4 = FuncUtil.build(104, '票务网售售卖报表', 1, 'ticketing_online/index', 'fa-shopping-cart',2);
def mod_g5 = FuncUtil.build(105, '票务收银台报表', 1, 'ticketing_counter/index', 'fa-shopping-cart',2);
def mod_g6 = FuncUtil.build(106, '会员购买报表', 1, 'members_buy/index', 'fa-shopping-cart',2);
def mod_g7 = FuncUtil.build(107, '票务预约报表', 1, 'ticketing_reserve/index', 'fa-shopping-cart',2);
def mod_2 = FuncUtil.build(2, '报表', null, 'cashier', 'fa-money');
def mod_2_1 = FuncUtil.build(201, '报表工具', 2, 'report/mgr', '', 2);
def mod_2_2 = FuncUtil.build(202, '报表列表', 2, 'report/list/list', '', 2);



def result = [mod_g,mod_g1,mod_g2,mod_g3,mod_g4,mod_g5,mod_g6,mod_g7,mod_2,mod_2_1,mod_2_2];
AppFunction mod_g_main = new AppFunction();
mod_g_main.func_name = '报表管理';
mod_g1.func_info = '可查看会员充值报表的详细信息';
mod_g2.func_info = '可查看商品网售售卖报表的详细信息';
mod_g3.func_info = '可查看商品收银台报表的详细信息';
mod_g4.func_info = '可查看票务网售售卖报表的详细信息';
mod_g5.func_info = '可查看票务收银台报表的详细信息';
mod_g6.func_info = '可查看会员购买报表的详细信息';
mod_g7.func_info = '可查看票务预约报表的详细信息';
def appFun=[];
appFun.addAll([mod_g]);
def appFunChild=[];
appFunChild.addAll([mod_g1, mod_g2,mod_g3,mod_g4,mod_g5,mod_g6,mod_g7]);
JCRequest request = JC.request.get();
request.setAttribute("appMain", mod_g_main);
request.setAttribute('appFun', appFun);
request.setAttribute("appFunChild", appFunChild);
def uri = request.getRequestURI();
def context = request.getContextPath();

def uri_without_code = uri[context.length()+1..-1];
if(uri_without_code.endsWith("/"))
	uri_without_code = uri_without_code[0..-2];
request.setAttribute("__now_uri_", uri_without_code);
List<AppFunction> functions = NativeUtil.connectAsArray(AppFunction.class, 'project', '/incall/mod/mods', [pid:GlobalHolder.getProj().id,user_id:GlobalHolder.getAuthToken().user.id,app_code:'report', accept:URLEncoder.encode(JackSonBeanMapper.listToJson(result), 'UTF-8')]);
Map<AppFunction, List<AppFunction>> my_funcs = my_funcs(functions);
request.setAttribute("user_roles_functions", my_funcs);
return true;

def get_by_id(def id, List<AppFunction> functions) {
	for(AppFunction f : functions) {
		if(f.id==id) {
			return f;
		}
	}
	return null;
}

def Map<AppFunction, List<AppFunction>> my_funcs(List<AppFunction> functions) {
	Map<AppFunction, List<AppFunction>> parent_functions = new LinkedHashMap<AppFunction, List<AppFunction>>();
	SysProjectInfo project = GlobalHolder.getProj();
	if(functions!=null&&!functions.isEmpty()) {
		for(AppFunction f : functions) {
			AppFunction parent_f = null;
			List<AppFunction> result_f = new ArrayList<AppFunction>();
			
			//只取两级的判断
			if(f.getLevel().equals(1)) {
				//表示当前这个为一级模块
				parent_f = f;
				for(AppFunction f_2 : functions) {
					if('0000'.equals(f_2.getFunc_type())){
						continue;
					}
					if(f_2.getParent_id()!=null&&f_2.getParent_id().equals(parent_f.getId())) {
						if(f_2.getLimpro().equals("0")&&!project.root) {
							continue;
						}
						result_f.add(f_2);
					}
				}
			} else if(f.getLevel().equals(2)) {
				//表示当前这个为二级模块
				parent_f = get_by_id(f.getParent_id(), functions);
				if(parent_f==null) {
					continue;
				}
				for(AppFunction f_2 : functions) {
					if('0000'.equals(f_2.getFunc_type())){
						continue;
					}
					if(f_2.getParent_id()!=null&&f_2.getParent_id().equals(parent_f.getId())) {
						if(f_2.getLimpro().equals("0")&&!project.root) {
							continue;
						}
						result_f.add(f_2);
					}
				}
			}
			parent_functions.put(parent_f, result_f);
		}
	}
	return parent_functions;
}