/*Create a view view1 from salesorder with (order number,order date)*/
create view view1 as select order_no,order_date from salesorder;
/*Describe the view view1*/
desc view1
/*Display Values of view1*/
SELECT * from view1
/*Insert one row of data in view1 and observe the output/error message*/
INSERT INTO view1 VALUES('5','2013-06-01')
/*Create a view view2 from clientmaster (clientno,cname)*/
CREATE view view2 as (SELECT client_no,cname from clientmaster)
/*Insert one row of data in view2 and observe the output/error message*/
INSERT INTO view2 VALUES(106,"abel")
select * from view2
/*Create a view view3 from salesmaster  with all columns with condition ‘city=mumbai’*/
CREATE VIEW view3 as(SELECT * from salesmaster where city="mumbai")
/*Create a view view4 from clientmaster and salesmaster with details (cname,city,sname,city)*/
CREATE VIEW view4 AS SELECT cname,clientmaster.city as ccity,sname,salesmaster.city from salesmaster,clientmaster
/*Describe view4*/
DESC view4
/*Insert one row of data in view4 and observe the output/error message*/
INSERT into view4 VALUES("sanu","kochi","jiya","kollam");
/*Create a view view5 from view4(cname,sname)*/
CREATE VIEW view5 as (SELECT cname,sname from clientmaster,salesmaster)
/*Create a view view5 from view4(cname,sname)*/
CREATE view view5 as SELECT cname,sname from view4
/*Describe view5 */
DESC view5
/*Insert one row of data in view5 and observe the output/error message*/
INSERT into view5 VALUES("john","joseph")
/*Delete the view4 table */
drop VIEW view4
drop VIEW view5
--------------------------------------------------------------------------------------
CREATE VIEW employees_vu as(SELECT employee_id,last_name as employee,department_id FROM emplooyees)
SELECT * from employees_vu
SELECT employee,department_id from employees_vu
CREATE VIEW dept50 as(select employee_id as empno,last_name as employee,department_id as deptno from emplooyees WHERE department_id=50)
update dept50 set dept50='80' where employee="motos"