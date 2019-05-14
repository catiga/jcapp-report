package com.jeancoder.report.entry.ticketing_counter

import com.jeancoder.app.sdk.JC
import com.jeancoder.app.sdk.source.LoggerSource
import com.jeancoder.app.sdk.source.RequestSource
import com.jeancoder.core.http.JCRequest
import com.jeancoder.core.log.JCLogger
import com.jeancoder.core.result.Result
import com.jeancoder.report.ready.dto.common.GetMcPayTypeDto
import com.jeancoder.report.ready.dto.ticket.TicketGatherDto
import com.jeancoder.report.ready.dto.ticket.TicketSalePage
import com.jeancoder.report.ready.dto.ticket.TicketSeatDto
import com.jeancoder.report.ready.helper.GlobalHolder
import com.jeancoder.report.ready.util.DateUtil
import com.jeancoder.report.ready.util.JackSonBeanMapper
import com.jeancoder.report.ready.util.MoneyUtil
import com.jeancoder.report.ready.util.NativeUtil
import com.jeancoder.report.ready.util.OrderConstants
import com.jeancoder.report.ready.util.RemoteUtil
import com.jeancoder.report.ready.util.StringUtil

Result result = new Result();
JCRequest request = RequestSource.getRequest();
JCLogger Logger = LoggerSource.getLogger(this.getClass().getName());
String pid_parent = StringUtil.trim(request.getParameter("pid"));
def pid;
boolean parent_flag = false;
def start_data = StringUtil.trim(request.getParameter("start_data"));
def end_data = StringUtil.trim(request.getParameter("end_data"));
def pn = StringUtil.trim(request.getParameter("pn"));
def ps = StringUtil.trim(request.getParameter("ps"));
String order_status = "'"+OrderConstants._order_status_payed_+"',"+"'"+OrderConstants._order_status_payed_pub_failed_+"',"+"'"+OrderConstants._order_status_delivering_+"',"+
"'"+OrderConstants._order_status_taked_tcss_by_payer_+"',"+"'"+OrderConstants._order_status_delivering_nopub_+"'";

try {
	if (StringUtil.isEmpty(pn)) {
		pn = "1";
	}
	pn = Integer.parseInt(pn);
	if (StringUtil.isEmpty(ps)) {
		ps = "10";
	}
	ps = Integer.parseInt(ps);
	if (pn < 1) {
		pn = 1;
	}
	if (ps < 1) {
		ps = 10;
	}
//	def list = RemoteUtil.connect('trade', '/incall/allow_pt', null);
	def list = JC.internal.call('trade', '/incall/allow_pt', [pid:GlobalHolder.proj.id]);
	def list_temp= JackSonBeanMapper.fromJson(list, GetMcPayTypeDto);
	Map<String,String> map_trans=new HashMap<String,String>();
	for (def map : list_temp.data) {
		String code=map.code;
		String name=map.name;
		map_trans.put(code,name)
	}
	result.addObject("list", map_trans);
	/*
	 * if: 集团项目或者子项目初始化页面
	 * else: 集团项目再次或者多次进入项目
	 */
	if(StringUtil.isEmpty(pid_parent)){
		pid = RemoteUtil.proj.id;
	}else{
		pid = new BigInteger(pid_parent);
	}
	/*
	 * 如果是集团项目来的，永久显示下拉框
	 */
	if(RemoteUtil.proj.id == 1){
		parent_flag = true;
	}
	/*
	 * 集团 项目看所有，子集团项目只看自己的
	 *
	 */
	if(StringUtil.isEmpty(pid_parent) && pid == 1){
		pid = "";
	}
	if (StringUtil.isEmpty(start_data)) {
		start_data = "";
	}
	if (StringUtil.isEmpty(end_data)) {
		end_data = "";
	}
	TicketSalePage page = NativeUtil.connect(TicketSalePage, "ticketingsys", "ticketing/ticketing_counter", ["pn":pn,"ps":ps,"pid":pid,"start_data":start_data,"end_data":end_data,"order_status":order_status])
	if (!page.available) {
		page.pn = 1;
		page.ps = 10;
		page.setResult(new ArrayList<>())
		page.totalCount = 1;
		result.addObject("page", page);
		result.addObject("error_msg",page.msg);
	} else {
		for(TicketGatherDto tgdto:page.result){
			String seat_no="";
			for(TicketSeatDto tseat: tgdto.ticketSeat){
				seat_no+=tseat.seat_sr+"排"+tseat.seat_sc+"座,";
			}
			if(seat_no!=null){
				tgdto.seat_no = seat_no.substring(0, seat_no.length()-1);
			}
		}
		result.addObject("page", page);
	}
	
	TicketSalePage page_csv = NativeUtil.connect(TicketSalePage, "ticketingsys", "ticketing/ticketing_counter", ["pn":"1","ps":"10000","pid":pid,"start_data":start_data,"end_data":end_data,"order_status":order_status])
	if (!page_csv.available) {
		page.pn = 1;
		page.ps = 10;
		page.setResult(new ArrayList<>());
		page.totalCount = 1;
		result.addObject("page1", page_csv);
		result.addObject("error_msg",page.msg);
	} else {
		result.addObject("page1", page_csv);
	}
} catch (e) {
	Logger.info("查询票务收银台报表失败",e)
	TicketSalePage page = new TicketSalePage();
	page.pn = 1;
	page.ps = 10;
	page.setResult(new ArrayList<>())
	page.totalCount = 0;
	result.addObject("page",page);
	result.addObject("error_msg","查询票务收银台报表失败");
}
result.addObject("start_data", start_data);
result.addObject("end_data", end_data);
result.addObject("pid", pid == "" ? null : pid);
result.addObject("parent_flag", parent_flag);
result.addObject("ps", ps.toString());
result.addObject("data", new DateUtil());
result.addObject("moneyUtil", new MoneyUtil());
return result.setView("ticketing_counter/index");
