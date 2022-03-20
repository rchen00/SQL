use northwind;
select employee_id, order_id, order_date
from orders
where order_date=str_to_date(concat(year(order_date),'-12-31'),'%Y-%m-%d') or
order_date=date_sub(str_to_date(concat(year(order_date),'-',
case date_format(order_date,'%m') 
       when '01' then '02'
	   when '02' then '03'
	   when '03' then '04'
	   when '04' then '05'
	   when '05' then '06'
	   when '06' then '07'
	   when '07' then '08'
	   when '08' then '09'
	   when '09' then '10'
	   when '10' then '11'
	   when '11' then '12'
	   end, '-01'),'%Y-%m-%d'),interval 1 day);
