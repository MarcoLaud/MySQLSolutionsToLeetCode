/*Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.

Department table:
+------+---------+-------+
| id   | revenue | month |
+------+---------+-------+
| 1    | 8000    | Jan   |
| 2    | 9000    | Jan   |
| 3    | 10000   | Feb   |
| 1    | 7000    | Feb   |
| 1    | 6000    | Mar   |
+------+---------+-------+

Result table:
+------+-------------+-------------+-------------+-----+-------------+
| id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
+------+-------------+-------------+-------------+-----+-------------+
| 1    | 8000        | 7000        | 6000        | ... | null        |
| 2    | 9000        | null        | null        | ... | null        |
| 3    | null        | 10000       | null        | ... | null        |
+------+-------------+-------------+-------------+-----+-------------+

Note that the result table has 13 columns (1 for the department id + 12 for the months).*/


/*--------------------------------*/

Select id,
Sum(Case month When 'Jan' Then revenue Else Null end) As Jan_Revenue,
Sum(Case month When 'Feb' Then revenue Else Null end) As Feb_Revenue,
Sum(Case month When 'Mar' Then revenue Else Null end) As Mar_Revenue,
Sum(Case month When 'Apr' Then revenue Else Null end) As Apr_Revenue,
Sum(Case month when 'May' Then revenue Else Null end) As May_Revenue,
Sum(Case month When 'Jun' Then revenue Else Null end) As Jun_Revenue,
Sum(Case month When 'Jul' Then revenue Else Null end) As Jul_Revenue,
Sum(Case month When 'Aug' Then revenue Else Null end) As Aug_Revenue,
Sum(Case month When 'Sep' Then revenue Else Null end) As Sep_Revenue,
Sum(Case month When 'Oct' Then revenue Else Null end) As Oct_Revenue,
Sum(Case month When 'Nov' Then revenue Else Null end) As Nov_Revenue,
Sum(Case month When 'Dec' Then revenue Else Null end) As Dec_Revenue
From Department
Group By id
Order By id

/*--------------------------------*/


/*Create table If Not Exists Department (id int, revenue int, month varchar(5))
Truncate table Department
insert into Department (id, revenue, month) values ('1', '8000', 'Jan')
insert into Department (id, revenue, month) values ('2', '9000', 'Jan')
insert into Department (id, revenue, month) values ('3', '10000', 'Feb')
insert into Department (id, revenue, month) values ('1', '7000', 'Feb')
insert into Department (id, revenue, month) values ('1', '6000', 'Mar')*/