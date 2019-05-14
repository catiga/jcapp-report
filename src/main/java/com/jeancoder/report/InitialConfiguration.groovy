package com.jeancoder.report;

import com.jeancoder.app.sdk.JC
import com.jeancoder.report.ready.dto.sys.SysFunction
import com.jeancoder.report.ready.util.FuncUtil
import com.jeancoder.report.ready.util.JackSonBeanMapper
import com.jeancoder.report.ready.util.NativeUtil

JC.interceptor.add("project/PreInterceptor", null);
JC.interceptor.add('token/PreInterceptor', null);
JC.interceptor.add("mod/PreInterceptor", null);



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

NativeUtil.connect( 'project', '/incall/mod/mods', [app_code:'report', accept:URLEncoder.encode(JackSonBeanMapper.listToJson(result), 'UTF-8')]);
 