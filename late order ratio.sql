use northwind;
With LateOrders as (
Select
Employee_ID, Count(*) totalLateOrders
From orders
Where
Required_Date <= Shipped_Date
Group By
Employee_ID
),
AllOrders as (
Select
Employee_ID, Count(*) TotalOrders
From orders
Group By
Employee_ID
)
Select
employees.Employee_ID,
Last_Name,
AllOrders.TotalOrders AllOrders,
LateOrders.TotalLateOrders LateOrders,
(LateOrders.TotalLateOrders / AllOrders.TotalOrders)  as lateOrder_Ratio
From employees
Join AllOrders
on AllOrders.Employee_ID = employees.Employee_ID
Join LateOrders
on LateOrders.Employee_ID = employees.Employee_ID
order by lateOrder_Ratio desc
;
