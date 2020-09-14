# Covid19_NursingHomes
This is a Report that shows current Covid-19 situation in USA (overall and by states) and Covid-19 impact on Nursing Homes in USA.

## Source Datasets
<a href="https://github.com/microsoft/Bing-COVID-19-Data"><b>Bing Covid dataset</b></a>: Bing COVID-19 data includes confirmed, fatal, and recovered cases from all regions, updated daily in a .csv file. 

<a href="https://data.cms.gov/Special-Programs-Initiatives-COVID-19-Nursing-Home/COVID-19-Nursing-Home-Dataset/s2uc-8wxp"><b>COVID-19 Nursing Home Dataset</b></a>: The file contains an individual record for each certified Medicare skilled nursing facility/Medicaid nursing facility and the ending date for each collection week, and is updated weekly. It lists detailed weekly confirmed and death cases reported by nursing homes for their residence and staff in United States.

## Database
Database is created on local instance of SQL Server. It has two dimension tables (USA_States, DimDates) and two measure tables (BingCovid, NursingHomes).

## ETL
ETL process is created using Jupyter Notebook. Separate scripts for each datasource.

## PowerBI report
5 page report: USA, USA States, Nursing Homes, Admin and Info
