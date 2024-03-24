SELECT 
TOP (1001) *
FROM 
(

SELECT [t2].[EnglishMonthName] AS [c30],[t2].[MonthNumberOfYear] AS [c33],SUM([t0].[Amount])
 AS [a0]
FROM 
(
((
select [$Table].[FinanceKey] as [FinanceKey],
    [$Table].[DateKey] as [DateKey],
    [$Table].[OrganizationKey] as [OrganizationKey],
    [$Table].[DepartmentGroupKey] as [DepartmentGroupKey],
    [$Table].[ScenarioKey] as [ScenarioKey],
    [$Table].[AccountKey] as [AccountKey],
    [$Table].[Amount] as [Amount],
    [$Table].[Date] as [Date]
from [dbo].[FactFinance] as [$Table]
) AS [t0]

 LEFT OUTER JOIN 

(
select [$Table].[DateKey] as [DateKey],
    [$Table].[FullDateAlternateKey] as [FullDateAlternateKey],
    [$Table].[DayNumberOfWeek] as [DayNumberOfWeek],
    [$Table].[EnglishDayNameOfWeek] as [EnglishDayNameOfWeek],
    [$Table].[SpanishDayNameOfWeek] as [SpanishDayNameOfWeek],
    [$Table].[FrenchDayNameOfWeek] as [FrenchDayNameOfWeek],
    [$Table].[DayNumberOfMonth] as [DayNumberOfMonth],
    [$Table].[DayNumberOfYear] as [DayNumberOfYear],
    [$Table].[WeekNumberOfYear] as [WeekNumberOfYear],
    [$Table].[EnglishMonthName] as [EnglishMonthName],
    [$Table].[SpanishMonthName] as [SpanishMonthName],
    [$Table].[FrenchMonthName] as [FrenchMonthName],
    [$Table].[MonthNumberOfYear] as [MonthNumberOfYear],
    [$Table].[CalendarQuarter] as [CalendarQuarter],
    [$Table].[CalendarYear] as [CalendarYear],
    [$Table].[CalendarSemester] as [CalendarSemester],
    [$Table].[FiscalQuarter] as [FiscalQuarter],
    [$Table].[FiscalYear] as [FiscalYear],
    [$Table].[FiscalSemester] as [FiscalSemester]
from [dbo].[DimDate] as [$Table]
) AS [t2] on 
(
[t0].[DateKey] = [t2].[DateKey]
)
)


 LEFT OUTER JOIN 

(
select [$Table].[ScenarioKey] as [ScenarioKey],
    [$Table].[ScenarioName] as [ScenarioName]
from [dbo].[DimScenario] as [$Table]
) AS [t5] on 
(
[t0].[ScenarioKey] = [t5].[ScenarioKey]
)
)

WHERE 
(
[t5].[ScenarioName] = N'Budget'
)

GROUP BY [t2].[EnglishMonthName],[t2].[MonthNumberOfYear]
)
 AS [MainTable]
WHERE 
(

NOT(
(
[a0] IS NULL 
)
)

)

ORDER BY 
COALESCE([c33], 0)

ASC

, (CASE WHEN [c33] IS NULL THEN 0 ELSE 1 END)

ASC
,[c30]
ASC