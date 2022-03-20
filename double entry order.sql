use northwind;

Select o.order_id, od.quantity, o.employee_id
From order_details od
join orders o
on od.order_id = o.order_id  
where employee_id = 3 and quantity > 60
Group By o.order_id, od.quantity, o.employee_id
;

Select count(*), od.quantity, o.employee_id
From order_details od
join orders o
on od.order_id = o.order_id 
where employee_id = 3 and quantity > 60
Group By od.quantity, o.employee_id
Having Count(*) > 1
;