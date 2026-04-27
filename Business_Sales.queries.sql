
CREATE TABLE public.sales_data (
    Row_ID INT,
    Order_ID VARCHAR(255),
    Order_Date VARCHAR(255),
    Ship_Date VARCHAR(255),
    Ship_Mode VARCHAR(255),
    Customer_ID VARCHAR(255),
    Customer_Name VARCHAR(255),
    Segment VARCHAR(255),
    Country VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    Postal_Code VARCHAR(255),
    Region VARCHAR(255),
    Product_ID VARCHAR(255),
    Category VARCHAR(255),
    Sub_Category VARCHAR(255),
    Product_Name VARCHAR(255),
    Sales NUMERIC,
    Quantity INT,
    Discount NUMERIC,
    Profit NUMERIC
);


DROP TABLE IF EXISTS public.sales_data;
SELECT * FROM public.sales_data LIMIT 5;
SELECT 
    "Category", 
    SUM("Sales") as revenue, 
    SUM("Profit") as net_profit,
    ROUND(((SUM("Profit") / SUM("Sales")) * 100)::numeric, 2) as profit_margin_pct
FROM public.sales_data
GROUP BY "Category"
ORDER BY net_profit DESC;
SELECT 
    "Customer Name", 
    SUM("Sales") as total_spent,
    COUNT("Order ID") as total_orders
FROM public.sales_data
GROUP BY "Customer Name"
ORDER BY total_spent DESC
LIMIT 10;
SELECT 
    "Product Name", 
    SUM("Sales") as revenue,
    SUM("Profit") as total_loss
FROM public.sales_data
GROUP BY "Product Name"
HAVING SUM("Profit") < 0
ORDER BY total_loss ASC
LIMIT 5;
SELECT 
    EXTRACT(YEAR FROM TO_DATE("Order Date", 'MM/DD/YYYY')) as sale_year,
    SUM("Sales") as annual_revenue
FROM public.sales_data
GROUP BY sale_year
ORDER BY sale_year;
SELECT 
    EXTRACT(MONTH FROM TO_DATE("Order Date", 'MM/DD/YYYY')) as sale_month,
    SUM("Sales") as monthly_revenue
FROM public.sales_data
GROUP BY sale_month
ORDER BY sale_month;






