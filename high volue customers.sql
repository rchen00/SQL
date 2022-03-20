use northwind;
select x.order_id, o.customer_id, sum(x.unit_price * x.quantity) total_order 
from customers c inner join orders o on c.customer_id = o.customer_id 
	inner join order_details x on o.order_id = x.order_id
	where date_format(o.order_date, '%Y') = '1998'
group by 1,2
having sum(x.unit_price * x.quantity) > 10000
order by 3 desc;

select c.company_name, sum(x.unit_price * x.quantity) order_total 
from customers c inner join orders o on c.customer_id = o.customer_id 
	inner join order_details x on o.order_id = x.order_id
	where date_format(o.order_date, '%Y')='1998'
group by 1
having sum(x.unit_price * x.quantity) > 15000
order by 2 desc;

select c.company_name, sum(x.unit_price * x.quantity * (1-x.discount)) order_total 
from customers c inner join orders o on c.customer_id = o.customer_id 
	inner join order_details x on o.order_id = x.order_id
	where date_format(o.order_date, '%Y')='1998'
group by 1
having sum(x.unit_price * x.quantity * (1-x.discount)) > 15000
order by 2 desc;


select date_format(order_date, '%Y') from orders;
select * from orders order by order_date desc;