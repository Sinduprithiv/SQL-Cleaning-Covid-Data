# SQL-Cleaning-Covid-Data

This is my first Portfolio project where I trim down and clean the covid data set using SQL. 

## Source

https://ourworldindata.org/covid-deaths

## Steps - Excel

- Downloaded data set is opened in Excel workbook format
- I do some basic formatting that includes giving meaningful column names, remove some columns which I will not require for my intended work. 
- Perform data validation by ensuring the data is correct. Eg: Data in date field should be date and Location field has only country names.
- Load the data in a oracle db to use SQL queries to perfom some more cleansing. The reason I chose to use a DB at this point is becasue it is easier as we are dealing with a large dataset. 


## Steps - Oracle DB

- Created a Table with 13 columns to match the excel data with appropriate data-type and length. 
- Data is imported into the DB directly using the import option in Oracle SQL Developer
- Replaced number fields with 0 where it was null to keep it meaningful. 
- I chose to see and edit data for Country "Canada" and added in columns to include some percentage values for Affected, Death and Full-Vaccinated among the whole country population.
- Identify incorrect records - Eg. If the percentage of "fully vaccinated" for any given day is lower than the previous day it means the data is inconsistent. Used self join statements to identify these issue.
