create schema international_debt_with_missing_values;
set search_path to international_debt_with_missing_values;
show search_path ;
select * from international_debt_with_missing_values;

--i.What is the total amount of debt owed by all countries in the dataset?
select sum(debt) as total_debt 
from international_debt_with_missing_values 
where debt is not null; 
--2823894597632

--ii.How many distinct countries are recorded in the dataset?
select count(distinct country_name) as unique_countries
from international_debt_with_missing_values
where country_name is not null;
--125

-- iii.	What are the distinct types of debt indicators, and what do they represent?
select distinct indicator_name,indicator_code 
from  international_debt_with_missing_values 
where indicator_name is not null and indicator_name <>''
and indicator_code is not null and indicator_code <>'';


-- iv.Which country has the highest total debt, and how much does it owe?
select country_name,sum (debt) as total_debt
from international_debt_with_missing_values
where country_name is not null and country_name <>''
group by country_name
order by total_debt desc 
limit 1;


--v.What is the average debt across different debt indicators?
select distinct indicator_name, avg(debt)  as avg_debt
from international_debt_with_missing_values intd
group by indicator_name
order by avg_debt desc;

--vi.Which country has made the highest amount of principal repayments?
 select country_name,country_code,sum(debt) as total_repayment
 from international_debt_with_missing_values intd
 where indicator_name like '%Principal repayments%' and debt > 0
 group by country_name,country_code
 order by total_repayment desc limit 1;

--vii.What is the most common debt indicator across all countries? 
select indicator_name,indicator_code,count(*) as common_debt
from international_debt_with_missing_values intd
where indicator_name is not null and indicator_name <>''
and indicator_code is not null and indicator_code <>''
group by indicator_name,indicator_code 
order by common_debt desc;

--viii.	Identify any other key debt trends and summarize your findings
--Top 5 HIGHEST DEBT
select country_name,sum (debt) as total_debt
from international_debt_with_missing_values 
where country_name is not null and country_name <>''
group by country_name
order by total_debt desc limit 5;
--LEAST DEBT
select country_name,sum (debt) as total_debt
from international_debt_with_missing_values 
where country_name is not null and country_name <>''
group by country_name
order by total_debt asc limit 5;
--TOTAL DEBT PER INDICATOR
select distinct indicator_name,sum(debt) as highest_debt
from international_debt_with_missing_values 
group by indicator_name 
order by highest_debt desc limit 5;
