select order_id+floor(rand()*100) as random_order_id
from orders 
where order_id+floor(rand()*100) <= (select max(order_id) max_id from orders);
limit (select floor(count(*)*0.02) from orders);
