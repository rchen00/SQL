use northwind;
SELECT c.Customer_ID
FROM customers c
WHERE NOT EXISTS (SELECT 1
                  FROM orders o 
                  WHERE o.Customer_ID = c.Customer_ID AND
                        o.Employee_ID = 4
                 );
