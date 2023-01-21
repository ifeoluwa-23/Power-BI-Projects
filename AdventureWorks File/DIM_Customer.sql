/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
  c.customerkey AS CustomerKey, 
  --,[GeographyKey]
  --,[CustomerAlternateKey]
  --,[Title]
  c.firstname AS [First Name], 
  --,[MiddleName]
  c.[LastName] AS [Last Name], 
  --,[NameStyle]
  --[BirthDate]
  --,[MaritalStatus]
  --,[Suffix]
  --[Gender]
  case c.[Gender] when 'M' then 'Male' when 'F' then 'Female' end as Gender, 
  
  /*,[EmailAddress]
        ,[YearlyIncome]
        ,[TotalChildren]
        ,[NumberChildrenAtHome]
        ,[EnglishEducation]
        ,[SpanishEducation]
        ,[FrenchEducation]
        ,[EnglishOccupation]
        ,[SpanishOccupation]
        ,[FrenchOccupation]
        ,[HouseOwnerFlag]
        ,[NumberCarsOwned]
        ,[AddressLine1]
        ,[AddressLine2]
        ,[Phone] */
  c.[DateFirstPurchase] AS DateFirstPurchase, 
  --,[CommuteDistance]
  g.city as [Customer City] --Joined from Geography Table
FROM 
  dbo.DimCustomer AS c 
  LEFT JOIN dbo.DimGeography as g ON g.GeographyKey = c.GeographyKey 
ORDER BY 
  CustomerKey ASC;
