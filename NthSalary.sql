CREATE TABLE Employees
(
	Id INT,
	Name NVARCHAR(50),
	Email NVARCHAR(50),
	Salary NUMERIC (8,2)
)
INSERT INTO Employees VALUES(1,'Shailu','shail@gmail.com',21000)
INSERT INTO Employees VALUES(1,'Shailu1','Shailu1@gmail.com',20000)
INSERT INTO Employees VALUES(2,'Shailu2','shailu2@gmail.com',27000)
INSERT INTO Employees VALUES(3,'Shailu3','shailu3@gmail.com',30000)
INSERT INTO Employees VALUES(4,'Shailu4','shailu4@gmail.com',46000)
INSERT INTO Employees VALUES(5,'Shailu5','shailu5@gmail.com',21000)
INSERT INTO Employees VALUES(6,'Shailu6','shailu6@gmail.com',60000)
INSERT INTO Employees VALUES(6,'Shailu6','shailu6@gmail.com',60000)
INSERT INTO Employees VALUES(6,'Shailu6','shailu6@gmail.com',60000)
INSERT INTO Employees VALUES(7,'Shailu7','shailu7@gmail.com',15000)
INSERT INTO Employees VALUES(8,'Shailu8','shailu8@gmail.com',40000)
INSERT INTO Employees VALUES(9,'Shailu9','shailu9@gmail.com',40000)
INSERT INTO Employees VALUES(10,'Shailu10','shailu10@gmail.com',21000)
INSERT INTO Employees VALUES(11,'Shailu11','shailu11@gmail.com',50000)
INSERT INTO Employees VALUES(11,'Shailu11','shailu11@gmail.com',52000)
INSERT INTO Employees VALUES(12,'Shailu12','shailu12@gmail.com',60000)
INSERT INTO Employees VALUES(12,'Shailu12','shailu12@gmail.com',80000)

select  * from Employees

 SELECT TOP 1 Salary FROM
(SELECT DISTINCT TOP 5  Salary AS Salary FROM Employees ORDER BY Salary DESC)
AS nThSalary ORDER BY Salary asc

-- find duplicate values from list 
SELECT Id AS EmpId, Name AS EmpName FROM Employees 
GROUP BY Id, Name HAVING COUNT(Id)>1

-- what is result of (null=null)??
IF(null = null)
BEGIN
	PRINT 'TRUE HA BHAI'
END
ELSE
BEGIN
	PRINT 'FALSE HA BHAI'
END
-- how to delete duplicate records from list
DELETE FROM Employees WHERE Email IN
(SELECT Id from Employees 
GROUP BY Id 
HAVING COUNT(Id)>2);

-- how to delete duplicate records but keet one from list

WITH Delete_Dplicate_CTE
AS
(
SELECT 
	Id AS EmpId, 
	ROW_NUMBER() OVER (PARTITION BY Id ORDER BY Id ASC) AS GenRowNumber 
FROM Employees
)
DELETE FROM Delete_Dplicate_CTE WHERE GenRowNumber >1

----------------------SORT by one country alway at top and other in accesding order
	SELECT * FROM CountrieS 
	ORDER BY 
	(CASE 
		WHEN [Name]='India' THEN 0 
	ELSE 1 END), [Name] asc


	SELECT * FROM CountrieS 
	ORDER BY 
	(CASE 
		WHEN [Name]='India' THEN 0 
		WHEN name ='Croatia' THEN 1 
	ELSE 2 END), [Name] asc




	
--Select top 1 * from 
--(SELECT  TOP 6 ColumName FROM TABLEName order by desc SalryColumnName)



--	With CTC_Delete_Duplecate
--	(
--	SELECT  
--	ColumnName(Id),
--	RANK	Over(Partition Order by Id asc) as createNewColumn
--	ColumName FROM TABLEName order by desc SalryColumnName)
--	from CTC_Delete_Duplecate where createNewColumn.count>1

--select ColumnNameSalaryName, EmpName from TableName group By ColumnNameSalaryName ,EMpName


--------------------------
select * from users
1	shailendra	3	40000
2	shail	2	23000
6	shail	6	19000
5	shail	2	15000
8	shail	2	13000
-------------------------
1	shailendra	3	40000
2	shail	2	23000
3	shail	6	19000
4	shail	2	15000
5	shail	2	13000
select * from users
DECLARE @sortID int
SET     @sortID = 0
UPDATE  users
SET     @sortID = id = @sortID + 1