# international_Debt_Analysis
This project will analyze international debt data collected by the World Bank. The dataset covers information on the total debt in USD from the year 1970 to 2015. The main goal is to extract meaningful insights and financial questions using SQL in PostgreSQL.  
# INTERNATIONAL DEBT ANALYSIS REPORT 
**Author** Faybeth Robina
**Date** August 31,2025
## Introduction
This project will analyze international debt data collected by the World Bank.The World Bank provides debt financing to developing countries to support their economic development. The dataset covers information on the total debt in USD from the year 1970 to 2015. The main goal is to extract meaningful insights and financial questions using SQL in PostgreSQL. 
This analysis uses the international debt dataset which contains  the following columns ;
**country_name** Name of the country
**country_code** Code of the different countries
**indicator_name** Indicates the type of debt
**indicator_code** Short code for the debt type
**debt** Debt amount in USD

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

##SQL Queries For The Dataset




