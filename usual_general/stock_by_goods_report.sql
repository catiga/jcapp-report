/**
 * 按照商品库存汇总表
 */
select 
store_name as 门店,
wh_name as 仓库,
goods_no as 商品内码,
goods_name as 商品名称,

CAST(
	sum(
		CASE
		WHEN stock is null THEN 0
		ELSE stock
		END
	) AS DECIMAL (18  , 2)
) AS 库存余量

from `c_scm`.data_goods_stock

WHERE
a_time >= '"${start_time}" 00:00:00'
AND a_time <= '"${end_time}" 23:59:59'
AND wh_id="${wh_id}"

group by goods_id
