/**
 * 票务座位销售报表
 * 支持退票合计统计
 */
select 
o.store_name as 影城  , 
o.hall_name as 影厅  , 
o.film_name as 影片  , 
o.plan_date as 场次日期  , 
o.plan_time as 场次时间  , 

concat(s.seat_sr, '排', s.seat_sc, '座') as 座位,

CASE WHEN o.pay_type = '001001' THEN '现金' WHEN o.pay_type = '101001' THEN '会员' WHEN o.pay_type = '201001' THEN '微信支付被扫'
 WHEN o.pay_type = '201002' THEN '微信支付主扫' WHEN o.pay_type = '201101' THEN '微信公众号支付' WHEN o.pay_type = '201102' THEN '微信小程序支付'
 WHEN o.pay_type = '202001' THEN '支付宝被扫' WHEN o.pay_type = '202002' THEN '支付宝主扫' WHEN o.pay_type = '301001' THEN '现在POS' 
 WHEN o.pay_type = '90009000weixin' THEN '某自定义支付方式'
 ELSE o.pay_type END AS 其他,

SUM(CASE WHEN o.order_status='8200' THEN -1*CAST(s.sale_fee/100 AS DECIMAL(10,2)) ELSE CAST(s.sale_fee/100 AS DECIMAL(10,2))
END) AS 票价,

o.a_time as 时间  , 

CASE WHEN o.order_status = '8200' THEN '退票' ELSE '售票' END AS 类型,

tclass.schema_name as 票类,
log.uname
from 
`hp_ticketingsys`.data_tc_ss_sale_order_seat s 
left join `hp_ticketingsys`.data_tc_ss_sale_order_info o on s.order_id = o.id
join `hp_trade`.trade_order tro on s.order_id=tro.order_id
join `hp_trade`.trade_info tra on tro.t_id=tra.id 
join `hp_trade`.cashier_doer_log log on tra.log_id=log.id 
join `hp_ticketingsys`.ticket_price_schema tclass on tclass.id=s.tclass_id

where o.order_status in ('1000'  , '2000'  , '3000', '8200')
AND o.a_time >= '"${start_time}"'
AND o.a_time <= '"${end_time}"'
AND s.tclass_id='"${tclass_id}"'
AND log.uid='"${uid}"'

