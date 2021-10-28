create table location (
location_id int not null,
street_address varchar(10),
city varchar(15),
primary key(location_id));

insert into location(location_id,street_address,city)values (&location_id ,'&street_address','&city');
insert into location(location_id,street_address,city)values (&location_id ,'&street_address','&city');
insert into location(location_id,street_address,city)values (&location_id ,'&street_address','&city');


create table Departments(
Department_id int not null,
Department_name varchar(15),
primary key(Department_id));
alter table Departments
add location_id int REFERENCES location(location_id);

insert into Departments values (25,'Programming',1);
insert into Departments values (26,'engineering',2);
insert into Departments values (27,'Analysis ',3);
insert into Departments values (28,'maintenance',2);



CREATE TABLE jobs(
job_id number not null ,
job_title VARCHAR(20) ,
min_salary int,
max_salary int ,
 PRIMARY KEY (job_id));
 
insert into jobs(job_id,job_title,min_salary,max_salary) values (&job_id,'&job_title',&min_salary,&max_salary);
insert into jobs(job_id,job_title,min_salary,max_salary) values (&job_id,'&job_title',&min_salary,&max_salary);
insert into jobs(job_id,job_title,min_salary,max_salary) values (&job_id,'&job_title',&min_salary,&max_salary);

create table emp(
emp_id INT not null ,
emp_name VARCHAR(20) ,
hiredate date,
salary int ,
 PRIMARY KEY (emp_id));
 alter table emp
 add Department_id int REFERENCES Departments (Department_id );
 alter table emp
 add job_id int REFERENCES jobs(job_id );
 
 insert into emp(emp_id,emp_name,hiredate,job_id,Department_id,salary ) values (120,'Ali','5-Mar-2012',11,25,15000);
insert into emp(emp_id,emp_name,hiredate,job_id,Department_id,salary ) values (130,'Mohammad','12-Apr-2017',12,26,10000 );
insert into emp(emp_id,emp_name,hiredate,job_id,Department_id,salary ) values (140,'Ahmad','15-May-2020',13,27,9000);

commit;

 select * from emp 
 where hiredate between '12/Apr/2017' and '15/May/2020' ;
 
 select emp.emp_name,emp.emp_id,
 Departments.Department_name,  Departments.Department_id
from emp, Departments 
where  emp.Department_id = Departments.Department_id and Departments.Department_name = 'engineering';

SELECT * FROM emp where salary > 9000;


select emp.emp_name , emp.emp_id , 
 Departments.Department_name , Departments.Department_id ,
 location.street_address , location.city
from emp , Departments , location 
where Departments.Department_id = emp.Department_id  and  Departments.location_id = location.location_id  ;

SELECT * FROM emp where emp_name like '%a_';

select  Departments.Department_name , location.street_address
FROM location, Departments
where  Departments.location_id = location.location_id;


 show user;
Alter session set "_oracle_script" = True;




CREATE USER USERTEST IDENTIFIED BY user;
GRANT CONNECT TO USERTEST;
grant dba to USERTEST;











