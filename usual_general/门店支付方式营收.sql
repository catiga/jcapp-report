SELECT
	si.store_name AS 门店,
	DATE_FORMAT(tor.a_time  , '%Y-%m-%d') AS 交易时间,
	CAST(
		sum(
			CASE
			WHEN ti.pay_type = '001001'
			THEN
				tor.total_amount / 100
			ELSE
				0
			END
		) AS DECIMAL (18  , 2)
	) AS 现金,
	CAST(
		sum(
			CASE
			WHEN ti.pay_type IN (
				'201101',
				'201102',
				'201001',
				'201002'
			)
			THEN
				tor.total_amount / 100
			ELSE
				0
			END
		) AS DECIMAL (18  , 2)
	) AS 微信,
	
	CAST(
		sum(
			CASE
			WHEN ti.pay_type = '101001'
			THEN
				tor.total_amount / 100
			ELSE
				0
			END
		) AS DECIMAL (18  , 2)
	) AS 会员卡,
	CAST(
		sum(
			CASE
			WHEN tp.pref_code = '200'
			THEN
				tp.real_deduct / 100
			ELSE
				0
			END
		) AS DECIMAL (18  , 2)
	) AS 券,
	CAST(
		sum(
			CASE
			WHEN ti.pay_type = '90009000weixin'
			THEN
				tor.total_amount / 100
			ELSE
				0
			END
		) AS DECIMAL (18  , 2)
	) AS 其他
FROM
	`c_trade`.trade_info ti join `c_trade`.trade_order tor on ti.id 

=tor.t_id
	left join `c_trade`.trade_preferential tp on ti.id 

=tp.t_id
	left join `c_project`.store_info si on tor.storeid=si.id 

WHERE
	ti.tss IN (
	'1000',
	'1010',
	'1020',
	'2000',
	'3000'
)
AND tor.a_time >= '"${start_time}" 00:00:00'
AND tor.a_time <= '"${end_time}" 23:59:59'
GROUP BY
	tor.storeid,
	tor.a_time
ORDER BY
	tor.a_time DESC
