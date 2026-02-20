select * from sales;

--Total revenue by Gender--
select gender,sum(purchase_amount_usd) from sales
group by gender

--Customer used discount still spent more then average
select customer_id , purchase_amount_usd 
from sales
where discount_applied = 'Yes' and purchase_amount_usd >= (select avg(purchase_amount_usd) from sales)

--Top 5 product with the highest average review rating--
select item_purchased, round(avg(review_rating)::numeric,2) from sales
group by item_purchased
order by avg(review_rating) desc
limit 5

--Average purchase amounts between standard and express shipping--
select shipping_type, round(avg(purchase_amount_usd),2) from sales
where shipping_type in ('Standard','Express')
group by shipping_type

--Average revenue between subscribed vs non-subscribed customers--
select subscription_status, count(customer_id),round(avg(purchase_amount_usd),2) from sales
group by subscription_status

--Top 5 products by % of discount applied--
select item_purchased,
round(100*sum(case when discount_applied = 'Yes' then 1 else 0 end)/count(*),2) as discount_rate
from sales
group by item_purchased
order by discount_rate desc
limit 5


--Segment Customer into New, Returning, Loyal based on their 
--total number of purchases, and show the count of each segment
with Customer_type as (
select	customer_id, previous_purchases,
case 	when previous_purchases=1
		then 'New'
		when previous_purchases between 2 and 10
		then 'Returning'
		else 'Loyal' 
		end as customer_segment
from sales)
select	customer_segment, count(*) as Total_customers from customer_type
group by customer_segment

--Top 3 most purchased orders within each Category
with item_count as (
	select item_purchased, category, count(customer_id) as total_purchases,
	ROW_NUMBER() OVER (PARTITION BY category ORDER BY count(customer_id) desc) as purchase_rank
	from sales
	group by item_purchased, category)
select category, item_purchased, total_purchases from item_count
where purchase_rank <= 3

--Are repeat buyers (more than 5 previous buys) also likely to subscribe?
select subscription_status, count(customer_id) as total_customers
from sales
where previous_purchases > 5
group by subscription_status

--Revenue contribution by age group
select age_group, round(sum(purchase_amount_usd),2) as total_revenue
from sales
group by age_group
order by total_revenue desc