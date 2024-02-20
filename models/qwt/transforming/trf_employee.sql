{{
    config(
        materialized='table', schema='Transforming'
    )
}}
 
WITH Employee AS
(SELECT
EMPID, LAST_NAME, FIRST_NAME, TITLE, HIRE_DATE, OFFICE, REPORTS_TO, YEAR_SALARY
FROM {{ ref('stg_employees')}}
)
, Office AS
(
    SELECT OFFICEID, OFFICECITY
    from {{ ref('stg_offices')}}
)
, employeedetails AS
(
   
select e.EMPID, e.LAST_NAME, e.FIRST_NAME, e.TITLE, e.HIRE_DATE, o.OFFICECITY,
 e1.LAST_NAME||','||e1.FIRST_NAME as REPORTS_TO, e.YEAR_SALARY
 from Employee e
JOIN Office o ON o.officeid = e.office
LEFT JOIN Employee e1 on e1.empid =nvl(e.REPORTS_TO,e.empid)

)
select * from employeedetails order by 1

{# {{
    config(
        materialized='table', schema='Transforming'
    )
}}
 
WITH Employee AS
(SELECT
EMPID, LASTNAME, FIRSTNAME, TITLE, HIREDATE, OFFICE, REPORTSTO, YEARSALARY
FROM {{ ref('stg_employee')}}
)
, Office AS
(
    SELECT officeid, city
    from {{ ref('stg_office')}}
)
, employeedetails AS
(
   
select e.EMPID, e.LASTNAME, e.FIRSTNAME, e.TITLE, e.HIREDATE, o.city,
 e1.LASTNAME||','||e1.FIRSTNAME as REPORTSTO, e.YEARSALARY
 from Employee e
JOIN Office o ON o.officeid = e.office
LEFT JOIN Employee e1 on e1.empid =e.REPORTSTO
 
)
select * from employeedetails order by 1

--from
{{ ref('stg_employees') }} e1 join
{{ ref('stg_employees') }} e2
on nvL(e1.REPORTS_TO,e1.empid)=e2.empid#}