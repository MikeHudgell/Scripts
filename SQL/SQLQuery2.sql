/****** Script for SelectTopNRows command from SSMS  ******/
SELECT[CustomerID]
  FROM [IndexAssignment].[dbo].[CustomerDimension]
  where  gender = 'Male' and surname like 'Smith%' and carcolour like 'Black' and CarType like 'C%'