--**************************************************************************--
-- Title:Create Views
--**************************************************************************--

USE Covid19_NursingHomes
Go
Set NoCount On;
Go

/************************************************************************************************
---CREATE VIEW FOR TABLE [DimDate]
************************************************************************************************/
IF Exists(SELECT * from Sys.objects WHERE Name = 'vDimDate')
   DROP VIEW vDimDate;
GO

CREATE VIEW vDimDate
AS
SELECT [Date], [DateInt], [TheDayName]
	, [TheWeek], [TheISOWeek], [TheDayOfWeek]
	, [TheMonth], [TheMonthName]
	, [TheQuarter], [TheYear], [TheFirstOfTheMonth], [TheLastOfTheMonth]
	, [DayofTheYear], [WeekStartDate], [WeekEndDate]
FROM DimDate
GO


/************************************************************************************************
---CREATE VIEW FOR TABLE [BinCovid]
************************************************************************************************/
IF Exists(SELECT * from Sys.objects WHERE Name = 'vBingCOVID')
   DROP VIEW vBingCOVID;
GO
CREATE VIEW [dbo].[vBingCOVID]
AS 
SELECT [ReportingDate]=cast([Updated] as date)
	, [Confirmed]=cast([Confirmed] as int)
	, [ConfirmedChange]=cast([ConfirmedChange] as int)
	, [Deaths]=cast([Deaths] as int)
	, [DeathsChange]=cast([DeathsChange] as int)
	, [Recovered]=cast([Recovered] as int)
	, [RecoveredChange]=cast([RecoveredChange] as int)
	, [ISO2]
	, [ISO3]
	, [Country_Region]
	, [State]
	, [TotalConfirmed]=iif([State] is null, [Confirmed], (select [Confirmed] from BingCovid as BC where BC.Updated=BingCovid.Updated and State is null))
	, [TotalDeaths]=iif([State] is null, [Deaths], (select [Deaths] from BingCovid as BC where BC.Updated=BingCovid.Updated and State is null))
FROM [BingCovid] 
GO

/************************************************************************************************
---CREATE VIEW FOR TABLE [NursingHomes]
************************************************************************************************/
IF (Object_ID('vNursingHomes') is not null) 
	DROP VIEW vNursingHomes;
GO

CREATE VIEW vNursingHomes
AS
SELECT [ReportingWeekEndDate]=cast([Week_Ending] as date)
	, [ReportingISOWeek]=[WeekNo]
	, [ProviderStateAbv]=[StateId]
	, [ResidentsConfirmedWeeklyChange]= [Residents_Weekly_Confirmed_COVID]
	, [ResidentsConfirmedTotal]= [Residents_Total_Confirmed_COVID]
	, [ResidentsDeathsWeeklyChange]= [Residents_Weekly_Deaths_COVID]
	, [ResidentsDeathsTotal]= [Residents_Total_Deaths_COVID]
	, [StaffConfirmedWeeklyChange]= [Staff_Weekly_Confirmed_COVID]
	, [StaffConfirmedTotal]= [Staff_Total_Confirmed_COVID]
	, [StaffDeathsWeeklyChange]= [Staff_Weekly_Deaths_COVID]
	, [StaffDeathsTotal]= [Staff_Total_Deaths_COVID]
FROM [NursingHomes]
GO

/************************************************************************************************
---CREATE VIEW FOR TABLE [States]
************************************************************************************************/

IF Exists(SELECT * from Sys.objects WHERE Name = 'vStates')
   DROP VIEW vStates;
GO

CREATE VIEW vStates
AS
SELECT  [StateAbv]=[stateID]
	, [StateLatitude]=[latitude]
	, [StateLongitude]=[longitude]
	, [StateName]
FROM [USA_States]
GO
