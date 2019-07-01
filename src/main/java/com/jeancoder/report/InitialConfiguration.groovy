package com.jeancoder.report;

import com.jeancoder.app.sdk.JC
import com.jeancoder.jdbc.JcTemplate
import com.jeancoder.report.ready.dto.sys.AppFunction
import com.jeancoder.report.ready.helper.GlobalHolder
import com.jeancoder.report.ready.report.entity.SysReportDesign
import com.jeancoder.report.ready.util.FuncUtil
import com.jeancoder.report.ready.util.JackSonBeanMapper
import com.jeancoder.report.ready.util.NativeUtil

JC.interceptor.add("project/PreInterceptor", null);
JC.interceptor.add('token/PreInterceptor', null);
JC.interceptor.add("mod/PreInterceptor", null);

//def mod_g = FuncUtil.build(1, '报表管理', null, '', 'fa-shopping-cart');
//def mod_g1 = FuncUtil.build(101, '会员充值报表', 1, 'index', 'fa-shopping-cart',2);
//def mod_g2 = FuncUtil.build(102, '商品网售售卖报表', 1, 'online_goods/index', 'fa-shopping-cart',2);
//def mod_g3 = FuncUtil.build(103, '商品收银台报表', 1, 'commodity_register/index', 'fa-shopping-cart',2);
//def mod_g4 = FuncUtil.build(104, '票务网售售卖报表', 1, 'ticketing_online/index', 'fa-shopping-cart',2);
//def mod_g5 = FuncUtil.build(105, '票务收银台报表', 1, 'ticketing_counter/index', 'fa-shopping-cart',2);
//def mod_g6 = FuncUtil.build(106, '会员购买报表', 1, 'members_buy/index', 'fa-shopping-cart',2);
//def mod_g7 = FuncUtil.build(107, '票务预约报表', 1, 'ticketing_reserve/index', 'fa-shopping-cart',2);
//def mod_2 = FuncUtil.build(2, '报表', null, 'cashier', 'fa-money');
//def mod_2_1 = FuncUtil.build(201, '报表工具', 2, 'report/mgr', '', 2);
//def mod_2_2 = FuncUtil.build(202, '报表列表', 2, 'report/list/list', '', 2);
//
//
//def result = [mod_g,mod_g1,mod_g2,mod_g3,mod_g4,mod_g5,mod_g6,mod_g7,mod_2,mod_2_1,mod_2_2];

def mod_g1 = FuncUtil.build(1, '报表管理', null, 'cashier', 'fa-money');
def mod_g1_1 = FuncUtil.build(101, '报表工具', 1, 'report/mgr', '', 2);
def mod_g1_2 = FuncUtil.build(102, '报表预览', 1, 'report/list/list', '', 2);


def result = [mod_g1, mod_g1_1,mod_g1_2];
AppFunction mod_g_main = new AppFunction();
mod_g_main.func_name = '报表管理';
mod_g1_1.func_info = '快速制作业务报表工具';
mod_g1_2.func_info = '已制作报表预览';

def appFun=[];
appFun.addAll([mod_g1]);
def appFunChild=[];
appFunChild.addAll([mod_g1_1, mod_g1_2]);


//获取当前项目可用系统报表
def mod_g2 = FuncUtil.build(2, '报表列表', null, 'cashier', 'fa-money');
result.add(mod_g2)
List<SysReportDesign> all_reports = JcTemplate.INSTANCE().find(SysReportDesign, 'select * from SysReportDesign where flag!=? and proj_id=?', -1, GlobalHolder.proj.id);
if(all_reports) {
	def i = 200;
	for(x in all_reports) {
		i++;
		def mod_g2_tmp = FuncUtil.build(i, x.report_name, 2, 'report/list/detail/?report_no=' + x.report_no, '', 2);
		result.add(mod_g2_tmp);
	}
}

NativeUtil.connect( 'project', '/incall/mod/mods', [app_code:'report', accept:URLEncoder.encode(JackSonBeanMapper.listToJson(result), 'UTF-8')]);
 