/**
 * 库存变动明细报表
 */
select 
opbatchsn as 批次编号,
goods_no as 商品内码,
goods_name as 商品名称,

CASE
 WHEN cost_price is null THEN '未设置'
 ELSE cost_price/100
END AS 成本价,

CASE
 WHEN tax_fee is null THEN '未设置'
 ELSE tax_fee
END AS 税率,

stock as 库存变动,

store_name as 门店,
wh_name as 仓库,
a_time as 变动日期,
CASE
 WHEN in_house=1 THEN '入库'
 WHEN in_house=2 THEN '出库'
 ELSE in_house
END AS 变动类型,

CASE WHEN op_type='1000' THEN '进货入库'
 WHEN op_type='1001' THEN '调拨入库'
 WHEN op_type='2001' THEN '销售退单'
 WHEN op_type='3001' THEN '报溢入库'
 WHEN op_type='9001' THEN '其他入库'
 WHEN op_type='2000' THEN '销售出库'
 WHEN op_type='3001' THEN '调拨出库'
 WHEN op_type='4000' THEN '报损出库'
 WHEN op_type='5000' THEN '领用出库'
 WHEN op_type='9001' THEN '其他出库' ELSE op_type
END AS 变动描述

from `c_scm`.data_goods_stock

WHERE
a_time >= '"${start_time}" 00:00:00'
AND a_time <= '"${end_time}" 23:59:59'
AND wh_id="${wh_id}"