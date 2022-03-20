select order_id, count(order_id) from order_details 
group by 1
order by count(order_id) desc
limit 10;