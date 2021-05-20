create database Supplier;
use Supplier;

create table Suppliers(
sid varchar(20) ,
sname varchar(20),
city varchar(20),
primary key(sid)
);
desc Suppliers;

create table Parts(
pid integer,
pname varchar(20),
color varchar(20),
primary key(pid)
);
desc Parts;

create table Catalog(
sid varchar(20),
pid integer,
cost real,
primary key(sid,pid),
foreign key(sid) references Suppliers(sid),
foreign key(pid) references Parts(pid)
);
desc Catalog;

insert into Suppliers values(10001,'Acme Widget','Bangalore');
insert into Suppliers values(10002,'Johns','Kolkata');
insert into Suppliers values(10003,'Vimal','Mumbai');
insert into Suppliers values(10004,'Reliance','Delhi');
select *from Suppliers;

insert into Parts values(20001,'Book','Red');
insert into Parts values(20002,'Pen','Red');
insert into Parts values(20003,'Pencil','green');
insert into Parts values(20004,'Mobile','green');
insert into Parts values(20005,'Charger','Black');
select *from Parts;

insert into Catalog values(10001,20001,10);
insert into Catalog values(10001,20002,10);
insert into Catalog values(10001,20003,30);
insert into Catalog values(10001,20004,10);
insert into Catalog values(10001,20005,10);
insert into Catalog values(10002,20001,10);
insert into Catalog values(10002,20002,20);
insert into Catalog values(10003,20003,30);
insert into Catalog values(10004,20003,40);
select *from Catalog;

select distinct P.pname from Parts P, Catalog c where P.pid=C.pid;

select S.sname from SUPPLIERS S where not exists (select P.pid from PARTS P where not exists (select C.sid from CATALOG C where C.sid = S.sid and C.pid = P.pid));

select S.sname from SUPPLIERS S where not exists (select P.pid from PARTS P where P.color = 'Red' and (not exists (select C.sid from CATALOG C where C.sid = S.sid and C.pid = P.pid)));

select P.pname from PARTS P, CATALOG C, SUPPLIERS S where P.pid = C.pid and C.sid = S.sid and S.sname = 'Acme Widget' and not exists (select * from CATALOG C1, SUPPLIERS S1 where P.pid = C1.pid and C1.sid = S1.sid and S1.sname <> 'Acme Widget');

select distinct c.sid from Catalog  c where c.cost >(select avg(ca.cost) from Catalog ca where ca.pid=c.pid);


select s.sname ,p.pid from Suppliers s, Catalog c, Parts p where s.sid=c.sid and c.pid =p.pid and c.cost=(select max(ca.cost) from catalog ca where ca.pid=p.pid);
