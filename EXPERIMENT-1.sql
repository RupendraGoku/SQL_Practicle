CREATE DATABASE amber_corporation;
USE amber_corporation;

CREATE TABLE founder(company_code varchar(20), 
founder char(20)); 
insert into founder values("C1", "Rahul");
insert into founder values("C2", "Mayank");
select * from founder;


create table Lead_manager(Lead_manager_id varchar(20),
  Company_code varchar(20));
insert into Lead_manager values("LM1", "C1");
insert into Lead_manager values("LM2", "C2");
select * from Lead_manager;

create table Senior_Manager(Senior_manager_id varchar(20),
  Lead_manager_id varchar(20) , 
  company_code varchar(20));
insert into Senior_Manager values("SM1","LM1", "C1");
insert into senior_manager values("SM2","LM1", "C1");
insert into senior_manager values("SM3","LM2", "C2");
select * from Senior_Manager;

create table manager(manager_id varchar(20),
Senior_manager_id varchar(20),
Lead_manager_id varchar(20) ,
company_code varchar(20));
insert into manager values("M1","SM1","LM1", "C1");
insert into manager values("M2","SM3","LM2", "C2");
insert into manager values("M3","SM3","LM2", "C2");
select * from manager;

create table Employee(Employee_id varchar(10),
manager_id varchar(20),
Senior_manager_id varchar(20),
Lead_manager_id varchar(20) , 
company_code varchar(20));
insert into employee values("E1","M1","SM1","LM1", "C1");
insert into employee values("E2","M1","SM1","LM1", "C1");
insert into employee values("E3","M2","SM3","LM2", "C2");
insert into employee values("E4","M3","SM3","LM2", "C2");
select * from employee;


SELECT DISTINCT 
    founder.company_code,
    founder.founder,
    COUNT(DISTINCT Lead_Manager.lead_manager_id), 
    COUNT(DISTINCT SENIOR_Manager.senior_manager_id),
    COUNT(DISTINCT Manager.manager_id), 
    COUNT(DISTINCT Employee.employee_id)
FROM founder
JOIN Lead_Manager ON founder.company_code = Lead_Manager.company_code
JOIN Senior_Manager ON founder.company_code = Senior_Manager.company_code
JOIN Manager ON founder.company_code = Manager.company_code
JOIN Employee ON founder.company_code = Employee.company_code
GROUP BY founder.Company_code, founder.founder;