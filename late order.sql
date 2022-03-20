use northwind;
Select e.Employee_ID, e.Last_Name, COUNT(*) Total_Late_Orders
From orders o Join employees e
on e.Employee_ID = o.Employee_ID
Where
o.required_date <= o.Shipped_Date
Group By
e.Employee_ID, e.Last_Name
Order by Total_Late_Orders desc;
