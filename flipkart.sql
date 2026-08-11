create database flipkart_dataset;

use flipkart_dataset;

select * from flipkart;

# view specific columns
select OrderID,
CustomerID, Product, `Sale Price`
from flipkart;

# Count total orders
select count(*) as Total_Orders
from flipkart;

# Total sales
select avg(`Sale Price`) as Average_Order_Value
from flipkart;

# Highest sales
select max(`Sale Price`) as Highest_Sale
from flipkart; 

# Lowest sales
select min(`Sale Price`) as Highest_Sale
from flipkart; 

# Top 10 products by revenue
select product, sum(`Sale Price`) as Revenue
from flipkart
group by Product
order by Revenue desc
limit 10;

# count total rows
select count(*)
from flipkart;

# count unique customers
select count(distinct customerid)
from flipkart;

# delivered orders
select * from flipkart 
where status = "delivered";

# high value orders
select * from flipkart 
where `sale price` >= 300;

describe flipkart;

# Orders from Express delivery
select * from flipkart 
where `delivery type` = "Express";

# Products between 500 and 1000
select * from flipkart 
where `sale price` between 200 and 300;

# Multiple Categories using in
select * from flipkart 
where `product category`
in ("fashion", "electronics");

# Sales by product category
select `product category`, 
sum(`sale price`) as Total_Sales
from flipkart 
group by `product category`
order by Total_sales desc;

# Top 5 location by Sales
select location, 
sum(`sale price`) as Total_Sales
from flipkart 
group by location
order by Total_Sales desc
limit 5;

# Average rating by delivery type
select `delivery type`,
avg(rating) as Average_Rating
from flipkart
group by `delivery type`
order by Average_Rating desc; 

# Categories with sales greater than 1000000
select `product category`,
sum(`sale price`) as Total_Sales
from flipkart 
group by `product category`
having Total_Sales > 1000000
order by Total_Sales desc;

# case when kay hota hai
select Orderid, `sale price`,
case 
when `sale price` >= 300 then "High Value"
else "Low Value"
end as Order_Type 
from flipkart;

# Customer age segmentation
select customerid, `customer age`,
case
	when `customer age` < 18 then "Teen"
	when `customer age` between 18 and 35
then "Young Adult"
	when `customer age` between 36 and 60
then "Adult"
		else "Senior"
    end as Age_Group
from flipkart;

# Delivery performance
select orderid, Status, 
case
	when Status = "delivered" then
"successful"
		else "unsuccessful"
    end as Delivery_Result
from flipkart;

# Count high and low value orders
select
	case
		when `sale price` >= 300 then "High Value"
        else "Low value"
	end as Order_Type,
    count(*) as Total_Orders
from flipkart 
group by Order_Type;

# Row_Numeric()
 select product, `sale price`,
	row_number() over(order by `sale price`
desc) as Row_Num
from flipkart;

# Rank()
select product, `sale price`,
	rank() over(order by `sale price`
desc) as Rank_No
from flipkart;

# Dense_rank()
select product, `sale price`,
	dense_rank() over(order by `sale price`
desc) as Den_Ran
from flipkart;

# product category by high cost
select `product category`, `product`, `sale price`,
	row_number() over(partition by `product category`
    order by `sale price` desc)
    as Rank_In_Category
from flipkart;

# Average sale price
select avg(`sale price`)
from flipkart;

# show sale from Average sale price
select * from flipkart 
where `sale price` > 2;

#  top 5 products by total revenue
select product,
sum(`sale price`) as Total_Revenue
from flipkart 
group by product
order by Total_Revenue desc
limit 5;

# top 5 product category by revenue
select `product category`,
sum(`sale price`) as Total_Revenue
from flipkart 
group by `product category`
order by Total_revenue desc
limit 5;

# top 5 customer by total revenue
select customerid,
sum(`sale price`) as Total_Revenue
from flipkart 
group by customerid
order by Total_Revenue desc
limit 5;

# top 5 location by revenue
select location,
sum(`sale price`) as Total_Revenue
from flipkart 
group by location
order by Total_Revenue desc
limit 5;

# total sales for each month
SELECT
    MONTHNAME(STR_TO_DATE(ï»¿OrderDate,'%m/%d/%Y')) AS Month,
    SUM(`Sale Price`) AS Total_Sales
FROM flipkart
GROUP BY
    MONTH(STR_TO_DATE(ï»¿OrderDate,'%m/%d/%Y')),
    MONTHNAME(STR_TO_DATE(ï»¿OrderDate,'%m/%d/%Y'))
ORDER BY
    MONTH(STR_TO_DATE(ï»¿OrderDate,'%m/%d/%Y'));
    
#  total order in each month  
SELECT
    MONTHNAME(STR_TO_DATE(ï»¿OrderDate,'%m/%d/%Y')) AS Month,
    SUM(orderid) AS Total_Orders
FROM flipkart
GROUP BY
    MONTH(STR_TO_DATE(ï»¿OrderDate,'%m/%d/%Y')),
    MONTHNAME(STR_TO_DATE(ï»¿OrderDate,'%m/%d/%Y'))
ORDER BY
    MONTH(STR_TO_DATE(ï»¿OrderDate,'%m/%d/%Y'));
    
# Average rating of each product category
select `product category`,
avg(Rating) as Average_Rating
from flipkart 
group by `product category`
order by Average_Rating desc;

# number of order by status
select status,
count(*) as Total_Orders
from flipkart 
group by status
order by Total_Orders desc;

# top 5 highest rated products
select product,
avg(Rating) as Average_Rating
from flipkart 
group by product
order by Average_Rating desc
limit 5;

# Average sale price by delivery type
select `delivery type`,
avg(`sale price`) as Average_sale_Price
from flipkart 
group by `delivery type`
order by Average_sale_Price;

# Return rate(%)
select
round(
sum(case when status = "Returned" then 1 else 0 end)
* 100.0 / count(*),2) as return_rate
from flipkart; 

# Cancellation rate(%)
select
round(
sum(case when status = "Canellation" then 1 else 0 end)
* 100.0 / count(*),2)  as canellation_rate
from flipkart;

# Calculate net sales
select 
sum(`sale price`) as Nat_Sales
from flipkart 
where status = "Delivered";

# Calculate Gross Sales
select
sum(`sale price`) as Gross_Sales
from flipkart;

# Calculate Revenue loss due to returns and canellation
select sum(case
when status in ("Returned", "Cancelled")
then `sale price`
else 0 end) as Revenue_Loss
from flipkart;
