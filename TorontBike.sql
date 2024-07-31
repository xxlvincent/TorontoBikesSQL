USE TorontoBike;

-- Number of Distinct Trips taken.
SELECT COUNT(DISTINCT [Trip Id]) AS [Total Number of Trips]
FROM [Bike share ridership 2024-01];

-- Display the number of trips made each weekday.
SELECT 
    DATENAME(weekday, [End Time]) AS Weekday,
    COUNT([Trip Id]) AS [Number of Trips]
FROM 
    [Bike share ridership 2024-01]
GROUP BY 
    DATENAME(weekday, [End Time])
ORDER BY
    CASE 
        WHEN DATENAME(weekday, [End Time]) = 'Monday' THEN 1
        WHEN DATENAME(weekday, [End Time]) = 'Tuesday' THEN 2
        WHEN DATENAME(weekday, [End Time]) = 'Wednesday' THEN 3
        WHEN DATENAME(weekday, [End Time]) = 'Thursday' THEN 4
        WHEN DATENAME(weekday, [End Time]) = 'Friday' THEN 5
        WHEN DATENAME(weekday, [End Time]) = 'Saturday' THEN 6
        WHEN DATENAME(weekday, [End Time]) = 'Sunday' THEN 7
    END;

-- Display highest Trip count and Trip Day.
SELECT TOP 1
  COUNT([Trip Id]) AS Most_Trips,
  DAY([End Time]) AS Day,
  DATENAME(WEEKDAY, [End Time]) AS WeekDay
FROM 
  [Bike share ridership 2024-01]
GROUP BY 
  DAY([End Time]), DATENAME(WEEKDAY, [End Time])
ORDER BY 
  COUNT([Trip Id]) DESC;

 -- Number of Casual Members
SELECT [User Type], COUNT(*) AS [Member Count]
FROM [Bike share ridership 2024-01]
GROUP BY [User Type];

-- what is the average trip duration in minutes
SELECT ROUND(AVG([Trip  Duration] / 60),2) AS [Average Trip Minutes]
FROM [Bike share ridership 2024-01]


-- Number of start trips and end trip from Union Station
SELECT 
  [Start Station Name],
  COUNT([Trip Id]) AS 'Number of Start Trips',
  (SELECT COUNT([Trip Id]) 
   FROM [Bike share ridership 2024-01] 
   WHERE ([End Station Name]) = 'Union Station') AS 'Number of End Trips'
FROM 
  [Bike share ridership 2024-01]
WHERE
  ([Start Station Name]) = 'Union Station'
GROUP BY 
  [Start Station Name];
