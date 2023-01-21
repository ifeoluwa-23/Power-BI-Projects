/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
  p.[ProductKey], 
  p.[ProductAlternateKey] AS ProductItemCode, 
  --,[ProductSubcategoryKey]
  --,[WeightUnitMeasureCode]
  --,[SizeUnitMeasureCode]
  p.[EnglishProductName] AS [Product Name], 
  ps.EnglishProductSubcategoryName As [Sub Category], 
  -- Joined from Sub Category Table
  pc.EnglishProductCategoryName AS [Product Category], 
  -- Joined from Category Table
  --,[SpanishProductName]
  --,[FrenchProductName]
  --,[StandardCost]
  --,[FinishedGoodsFlag]
  p.[Color] AS [Product Color], 
  --,[SafetyStockLevel]
  --,[ReorderPoint]
  --,[ListPrice]
  p.[Size] AS [Product Size], 
  --,[SizeRange]
  --,[Weight]
  --,[DaysToManufacture]
  p.[ProductLine] AS [Product Line], 
  --[DealerPrice]
  --[Class]
  --[Style]
  p.[ModelName] AS [Product Model Name], 
  --,[LargePhoto]
  p.[EnglishDescription] AS [Product Description], 
  
  /*,[FrenchDescription]
        ,[ChineseDescription]
        ,[ArabicDescription]
        ,[HebrewDescription]
        ,[ThaiDescription]
        ,[GermanDescription]
        ,[JapaneseDescription]
        ,[TurkishDescription]
        ,[StartDate]
        ,[EndDate]*/
  ISNULL (p.[Status], 'Outdated') AS [Product Status] 
FROM 
  dbo.DimProduct AS p 
  LEFT JOIN dbo.DimProductSubcategory as ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey 
  LEFT JOIN dbo.DimProductCategory as pc ON ps.ProductCategoryKey = pc.ProductCategoryKey 
ORDER BY 
  p.ProductKey ASC;
