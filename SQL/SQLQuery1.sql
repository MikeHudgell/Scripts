

SELECT Left([Surname],3) AS XXX, Count([Surname]) AS CountOfSurname
FROM [IndexAssignment].[dbo].[CustomerDimension]
GROUP BY Left([Surname],3) order by Left([Surname],3) asc


SELECT *
FROM [IndexAssignment].[dbo].[CustomerDimension]
WHERE (CustomerDimension.Surname)like'Smith'

select count(*) from [IndexAssignment].[dbo].[CustomerDimension]