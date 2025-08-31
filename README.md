# international_Debt_Analysis
This project will analyze international debt data collected by the World Bank. The dataset covers information on the total debt in USD from the year 1970 to 2015. The main goal is to extract meaningful insights and financial questions using SQL in PostgreSQL.  
# INTERNATIONAL DEBT ANALYSIS REPORT 
**Author** Faybeth Robina
**Date** August 31,2025
## Introduction
This project will analyze international debt data collected by the World Bank.The World Bank provides debt financing to developing countries to support their economic development. The dataset covers information on the total debt in USD from the year 1970 to 2015. The main goal is to extract meaningful insights and financial questions using SQL in PostgreSQL. 
This analysis uses the international debt dataset which contains  the following columns ;
**country_name** :Name of the country

**country_code**: Code of the different countries

**indicator_name**: Indicates the type of debt

**indicator_code**: Short code for the debt type

**debt**: Debt amount in USD

## Steps Followed for Loading Data into PostgreSQL
1.Install DBeaver and PostgreSQL and ensure that you have connected PostgreSQL to DBeaver.

2.Download the ```.cvs``` file from GitHub.

3.Open DBeaver and connect to your PostgreSQL database.

4.Open a new script.

5.Create a new schema ```create schema international_debt_with_missing_values;```.

6.Set search path to the schema ```set search_path to international_debt_with_missing_values;```.

7.In the database navigator ,expand your connection to database then to schema and find the schema you created.

8.Right click your schema and select import data.

9.Then choose CSV as the source.

10. Select you ```.csv``` file
    
11. Map columns then click finish
 
12. Verify if your CVS has been imported as new table inside the schema by running
 ```select * from international_debt_with_missing_values;```

## SQL Queries For The Dataset
```sql
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
```

## Summary Findings.

## 1. Total debt.
The total amount of debt owed by all countries is approximately  2.82 trillion USD based on the sum of the debt column.
## 2. Unique countries.
There are 125 distinct countries recorded in the dataset.
## 3.Debt indicators.
In our data there are different types of debt indicators. Using the indicators name and code we have 25 distinct debt indicators like Principal repayments on external debt,Interest payments on external debt.
The most common indicator is the long-term public and publicly guaranteed (PPG) debt
## 4.Largest debtor.
China  is the country with the highest total debt of 266,455,760,896 USD
## 5.Average debt levels
The average debt varies across the debt indicators where the long-term debt categories have the highest average values
## 6.Principal Repayments
One country has the highest amount of principal repayments which is China. This means that it has either borrowed heavily in the past or is trying to reduce obligations.
## 7.Most common indicator.
The most frequently used indicator is the Long-term external debt, this shows its dominance in global borrowing.
## 8. Key debt trends.
A small group of countries holds the largest share of debt.
Long-term public and publicly guaranteed (PPG) debt is the most common debt indicator across countries.






