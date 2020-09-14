--*************************************************************************--
-- Title: Create the Data Warehouse
-- Desc:This file will drop and create the [DWCovid19] database, with all its objects. 
--*************************************************************************--

USE [master]
GO
If Exists (SELECT * FROM Sysdatabases WHERE NAME = 'Covid19_NursingHomes')
	BEGIN 
		ALTER DATABASE Covid19_NursingHomes SET SINGLE_USER WITH ROLLBACK IMMEDIATE
		DROP DATABASE Covid19_NursingHomes
	END
GO
CREATE DATABASE Covid19_NursingHomes
Go

--********************************************************************--
-- Create the Tables
--********************************************************************--
USE Covid19_NursingHomes
Go

/****** [dbo].[DimProducts] ******/
IF OBJECT_ID('dbo.BingCovid', 'U') IS NOT NULL 
  DROP TABLE dbo.BingCovid;
GO

CREATE TABLE BingCovid
(
	[Updated] date NULL, 
	[Confirmed] int NULL,
	[ConfirmedChange] int NULL,
	[Deaths] int NULL,
	[DeathsChange] int NULL,
	[Recovered] int NULL,
	[RecoveredChange] int NULL,
	[ISO2] [nvarchar](2) NULL,
	[ISO3] [nvarchar](3) NULL,
	[Country_Region] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL
) 
GO

IF OBJECT_ID('dbo.NursingHomes', 'U') IS NOT NULL 
  DROP TABLE dbo.NursingHomes;


CREATE TABLE NursingHomes 
(
	[Week_Ending] date not null
           , WeekNo int not NULL 
		   , StateId char(2) not NULL 
		   , [Residents_Weekly_Confirmed_COVID] int NULL
		   , [Residents_Total_Confirmed_COVID] int NULL
		   , [Residents_Weekly_Deaths_COVID] int NULL
		   , [Residents_Total_Deaths_COVID] int NULL
		   , [Staff_Weekly_Confirmed_COVID] int NULL
		   , [Staff_Total_Confirmed_COVID] int NULL
		   , [Staff_Weekly_Deaths_COVID] int NULL 
		   , [Staff_Total_Deaths_COVID] int NULL 
) 
GO

IF OBJECT_ID('dbo.USA_States', 'U') IS NOT NULL 
  DROP TABLE dbo.USA_States;

CREATE TABLE USA_States
(
	[stateID] [nvarchar](2) NULL, 
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[StateName] [nvarchar](255) NULL 
) 
GO

IF OBJECT_ID('dbo.DimDate', 'U') IS NOT NULL 
  DROP TABLE dbo.DimDate;

CREATE TABLE DimDate
(
[Date] date not null
,[DateInt]  int not null
,TheDayName nvarchar(50) not null
,TheWeek int not null
,TheISOWeek int not null
,TheDayOfWeek int not null
,TheMonth int not null
,TheMonthName nvarchar(50) not null
,TheQuarter int not null
,TheYear int not null
,TheFirstOfTheMonth nvarchar(50) not null
,TheLastOfTheMonth nvarchar(50) not null
,DayofTheYear nvarchar(50) not null
,WeekStartDate date not null
,WeekEndDate date not null
)
GO


Select 'Database Created'
Select Name, xType, CrDate from SysObjects 
Where xType in ('u', 'PK', 'F')
Order By xType desc, Name

