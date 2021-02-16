/*Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Id is the primary key column for this table.*/


/*----------------------------*/

Delete From deleteduplicatemails
Where Id = (
	Select e1.Id From deleteduplicatemails As e1
	Inner Join deleteduplicatemails As e2
	On e1.email = e2.email
	Where e1.Id > e2.Id
)
And email = (
	Select e1.email From deleteduplicatemails As e1
	Inner Join deleteduplicatemails As e2
	On e1.email = e2.email
	Where e1.Id > e2.Id
)

/*----------------------------*/

/*
Create Table If Not Exists Person
Truncate table Person
insert into Person (Id, Email) values ('1', 'john@example.com')
insert into Person (Id, Email) values ('2', 'bob@example.com')
insert into Person (Id, Email) values ('3', 'john@example.com')*/