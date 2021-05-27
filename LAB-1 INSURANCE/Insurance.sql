create database Insurance;
show databases;
use Insurance;
show tables;
create table PERSON(driverid varchar(20),dname varchar(20),address varchar(40),primary key(driverid));
desc PERSON;
create table CAR(regno varchar(10),model varchar(10),year int ,primary key(regno));
desc CAR;
create table ACCIDENT(report_no int,adate date,location varchar(20),primary key(report_no));
desc ACCIDENT;
create table OWNS(driverid varchar(10),regno varchar(10),primary key(driverid,regno),
foreign key(driverid) references PERSON(driverid) on delete cascade,
foreign key(regno) references CAR(regno) on delete cascade);
CREATE TABLE PARTICIPATED(driverid varchar(10),regno varchar(10),report_no int,
damage_amt float, foreign key (driverid,regno) references OWNS(driverid,regno)
ON DELETE CASCADE,foreign key (REPORT_NO) references ACCIDENT(REPORT_NO) ON DELETE CASCADE);
desc PARTICIPATED;
insert into PERSON values('1111','Ramu','K.S.LAYOUT');
commit;
select* FROM PERSON;
insert into PERSON values('2222','John','INDIRANAGAR');
insert into PERSON values('3333','Priya','JAYANAGAR');
insert into PERSON values('4444','Gopal','WHITEFIELD');
insert into PERSON values('5555','Latha','VIJAYNAGAR');
commit;
insert into CAR values('KA04Q2301','MARUTHI-DX', 2000);
insert into CAR values('KA05P1000', 'FORDICON', 2000);
insert into CAR values('KA03L1234',' ZEN-VXI',1999);
insert into CAR values('KA03L9999', 'MARUTHI-DX', 2002);
insert into CAR values('KA01P4020', 'INDICA-VX', 2002);
commit;
select * from CAR;

insert into ACCIDENT values(12,'2002-06-01', 'M G ROAD');
insert into ACCIDENT values(200, '2002-12-10', 'DOUBLEROAD');
insert into ACCIDENT values(300, '1999-07-23', 'M G ROAD');
insert into ACCIDENT values(25000, '2000-06-11', 'RESIDENCY ROAD');
insert into ACCIDENT values(26500, '2001-10-16', 'RICHMOND CIRCLE');
commit;
select * from ACCIDENT;

insert into OWNS values('1111','KA04Q2301');
insert into OWNS values('1111', 'KA05P1000');
insert into OWNS values('2222', 'KA03L1234');
insert into OWNS values('3333', 'KA03L9999');
insert into OWNS values('4444', 'KA01P4020');
commit;
select * from OWNS;

insert into PARTICIPATED values('1111', 'KA04Q2301', 12 ,20000);
insert into PARTICIPATED values('2222', 'KA03L1234', 200, 500);
insert into PARTICIPATED values('3333', 'KA03L9999', 300, 10000);
insert into PARTICIPATED values('4444', 'KA01P4020', 25000 ,2375);
insert into PARTICIPATED values('1111', 'KA05P1000', 26500 ,70000);

UPDATE PARTICIPATED SET DAMAGE_AMT=25000 WHERE REPORT_NO =12 AND REGNO='KA04Q2301';
select * from PARTICIPATED;

select count(*) from ACCIDENT where Adate like '2002-__-__';
select count(A.Report_no) from ACCIDENT A, PARTICIPATED P, CAR C where 
A.Report_no=P.Report_no AND P.Regno=C.Regno AND C.Model="MARUTHI-DX";
