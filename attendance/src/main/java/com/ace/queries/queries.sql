create table Student
(
stid char(20) primary key,
stname char(50)
)


create table Course
(
crsid char(20) primary key,
crsname char(50) unique not null,
nosessions int
)

create table Registration
(
regid char(20) primary key,
stid char(20) references Student(stid),
crsid char(20) references Course(crsid),
studentstatus char(10)
)

create table Batch
(
batchid char(10) primary key,
crsid char(20) references Course(crsid),
status char(10) not null
)

create table Batch_Schedule_Students
(
batchschstid char(20) primary key,
regid char(20) references Registration(regid),
crsid char(20)  references Course(crsid),
bactchid char(10) references Batch(batchid),
sessionno int,
batchschedulestudentsstatus char(10)
)

create table Att_Batch_Schedule_Students
(
attid char(20) primary key,
batchschstid char(20) references Batch_Schedule_Students(batchschstid),
regid char(20) references Registration(regid),
crsid char(20)  references Course(crsid),
bactchid char(10) references Batch(batchid),
sessionno int,
attstatus char(10)
)

Create view Vw_Cource_Batch_Schedule_Registration_Student
as
select crs.crsid, crsname, nosessions, bt.batchid, status, batchschstid, sessionno,batchschedulestudentsstatus,
reg.regid, studentstatus, st.stid, stname
from course crs join batch bt on crs.crsid=bt.crsid
join BATCH_SCHEDULE_STUDENTS bss on bt.batchid=bss.bactchid
join registration reg on bss.regid = reg.regid
join Student st on reg.stid = st.stid

create view Vw_Course_Batch
as
select b.batchid, status, c.crsid, crsname, nosessions
from batch b join course c on b.crsid = c.crsid


create view Vw_Studnet_Att
as
select s.stid, stname, attid, r.regid, r.crsid, sessionno, attstatus, batchid
from student s join registration r
on s.stid= r.stid
join ATT_BATCH_SCHEDULE_STUDENTS a on r.regid=a.regid
join course c on a.crsid=c.crsid


create view Vw_Att_Data
as
select s.stid, stname, attid, r.regid, r.crsid, c.crsname,sessionno, attstatus, batchid
from student s join registration r
on s.stid= r.stid
join ATT_BATCH_SCHEDULE_STUDENTS a on r.regid=a.regid
join course c on a.crsid=c.crsid


create view Vw_Att_Pres_Report
as
select stname, count(*) from VW_STUDNET_ATT   
where attstatus='Present'
group by stname

create view Vw_Att_Abs_Report
as
select stname, count(*) from VW_STUDNET_ATT   
where attstatus='Absent'
group by stname


insert into student values ('S201192100001','Raju');
insert into student values ('S201192100002','Krishna');
insert into student values ('S201192100003','Anand');
insert into student values ('S201192100004','Latha');
insert into student values ('S201192100005','Madhu');
insert into student values ('S201192100006','Harsha');
insert into student values ('S201192100007','Nagaraju');
insert into student values ('S201192100008','Mahesh');
insert into student values ('S201192100009','Ramya');
insert into student values ('S201192100010','Avinash');

insert into student values ('S201192100011','Manohar');
insert into student values ('S201192100012','Venkatesh');
insert into student values ('S201192100013','Manju');
insert into student values ('S201192100014','Aditya');
insert into student values ('S201192100015','Raghu');
insert into student values ('S201192100016','Sasank');
insert into student values ('S201192100017','Amala');
insert into student values ('S201192100018','Jyothi');
insert into student values ('S201192100019','Karan');
insert into student values ('S201192100020','Kiran');



insert into course values ('CRS00001','PGJS1',50);
insert into course values ('CRS00002','HTML5',40);
insert into course values ('CRS00003','C++',35);
insert into course values ('CRS00004','C',30);
insert into course values ('CRS00005','C and DS',45);
insert into course values ('CRS00006','Core Java',80);
insert into course values ('CRS00007','Advance Java',70);
insert into course values ('CRS00008','MS Office',30);
insert into course values ('CRS00009','A+',20);
insert into course values ('CRS00010','N+',20);


insert into Registration values('R201192100001','S201192100001','CRS00001','valid');
insert into Registration values('R201192100002','S201192100002','CRS00002','valid');
insert into Registration values('R201192100003','S201192100003','CRS00003','valid');
insert into Registration values('R201192100004','S201192100004','CRS00004','valid');
insert into Registration values('R201192100005','S201192100005','CRS00005','valid');
insert into Registration values('R201192100006','S201192100006','CRS00006','valid');
insert into Registration values('R201192100007','S201192100007','CRS00007','valid');
insert into Registration values('R201192100008','S201192100008','CRS00008','valid');
insert into Registration values('R201192100009','S201192100009','CRS00009','valid');
insert into Registration values('R201192100010','S201192100010','CRS00010','valid');

insert into Registration values('R201192100011','S201192100011','CRS00001','valid');
insert into Registration values('R201192100012','S201192100012','CRS00001','valid');
insert into Registration values('R201192100013','S201192100013','CRS00001','valid');
insert into Registration values('R201192100014','S201192100014','CRS00001','valid');
insert into Registration values('R201192100015','S201192100015','CRS00001','valid');
insert into Registration values('R201192100016','S201192100016','CRS00001','valid');
insert into Registration values('R201192100017','S201192100017','CRS00001','valid');
insert into Registration values('R201192100018','S201192100018','CRS00001','valid');
insert into Registration values('R201192100019','S201192100019','CRS00001','valid');
insert into Registration values('R201192100020','S201192100020','CRS00001','valid');

insert into Registration values('R201192100021','S201192100011','CRS00002','valid');
insert into Registration values('R201192100022','S201192100012','CRS00002','valid');
insert into Registration values('R201192100023','S201192100013','CRS00002','valid');
insert into Registration values('R201192100024','S201192100014','CRS00002','valid');
insert into Registration values('R201192100025','S201192100015','CRS00002','valid');
insert into Registration values('R201192100026','S201192100016','CRS00002','valid');
insert into Registration values('R201192100027','S201192100017','CRS00002','valid');
insert into Registration values('R201192100028','S201192100018','CRS00002','valid');
insert into Registration values('R201192100029','S201192100019','CRS00002','valid');
insert into Registration values('R201192100030','S201192100020','CRS00002','valid');

insert into Registration values('R201192100041','S201192100011','CRS00004','valid');
insert into Registration values('R201192100042','S201192100012','CRS00004','valid');
insert into Registration values('R201192100043','S201192100013','CRS00004','valid');
insert into Registration values('R201192100044','S201192100014','CRS00004','valid');
insert into Registration values('R201192100045','S201192100015','CRS00004','valid');
insert into Registration values('R201192100046','S201192100016','CRS00004','valid');
insert into Registration values('R201192100047','S201192100017','CRS00004','valid');
insert into Registration values('R201192100048','S201192100018','CRS00004','valid');
insert into Registration values('R201192100049','S201192100019','CRS00004','valid');
insert into Registration values('R201192100050','S201192100020','CRS00004','valid');


insert into batch values('B200001','CRS00001','new');
insert into batch values('B200002','CRS00002','new');
insert into batch values('B200003','CRS00003','new');
insert into batch values('B200004','CRS00004','new');
insert into batch values('B200005','CRS00005','new');
insert into batch values('B200006','CRS00006','new');
insert into batch values('B200007','CRS00007','new');
insert into batch values('B200008','CRS00008','new');
insert into batch values('B200009','CRS00009','new');
insert into batch values('B200010','CRS00010','new');


insert into Batch_Schedule_Students values ('BTCHSCH00001','R201192100001','CRS00001','B200001',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00002','R201192100011','CRS00001','B200001',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00003','R201192100012','CRS00001','B200001',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00004','R201192100013','CRS00001','B200001',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00005','R201192100014','CRS00001','B200001',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00006','R201192100015','CRS00001','B200001',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00007','R201192100016','CRS00001','B200001',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00008','R201192100017','CRS00001','B200001',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00009','R201192100018','CRS00001','B200001',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00010','R201192100019','CRS00001','B200001',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00011','R201192100020','CRS00001','B200001',1,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00012','R201192100001','CRS00001','B200001',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00013','R201192100011','CRS00001','B200001',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00014','R201192100012','CRS00001','B200001',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00015','R201192100013','CRS00001','B200001',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00016','R201192100014','CRS00001','B200001',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00017','R201192100015','CRS00001','B200001',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00018','R201192100016','CRS00001','B200001',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00019','R201192100017','CRS00001','B200001',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00020','R201192100018','CRS00001','B200001',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00021','R201192100019','CRS00001','B200001',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00022','R201192100020','CRS00001','B200001',2,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00023','R201192100001','CRS00001','B200001',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00024','R201192100011','CRS00001','B200001',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00025','R201192100012','CRS00001','B200001',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00026','R201192100013','CRS00001','B200001',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00027','R201192100014','CRS00001','B200001',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00028','R201192100015','CRS00001','B200001',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00029','R201192100016','CRS00001','B200001',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00030','R201192100017','CRS00001','B200001',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00031','R201192100018','CRS00001','B200001',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00032','R201192100019','CRS00001','B200001',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00033','R201192100020','CRS00001','B200001',3,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00034','R201192100001','CRS00001','B200001',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00035','R201192100011','CRS00001','B200001',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00036','R201192100012','CRS00001','B200001',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00037','R201192100013','CRS00001','B200001',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00038','R201192100014','CRS00001','B200001',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00039','R201192100015','CRS00001','B200001',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00040','R201192100016','CRS00001','B200001',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00041','R201192100017','CRS00001','B200001',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00042','R201192100018','CRS00001','B200001',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00043','R201192100019','CRS00001','B200001',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00044','R201192100020','CRS00001','B200001',4,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00045','R201192100001','CRS00001','B200001',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00046','R201192100011','CRS00001','B200001',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00047','R201192100012','CRS00001','B200001',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00048','R201192100013','CRS00001','B200001',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00049','R201192100014','CRS00001','B200001',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00050','R201192100015','CRS00001','B200001',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00051','R201192100016','CRS00001','B200001',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00052','R201192100017','CRS00001','B200001',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00053','R201192100018','CRS00001','B200001',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00054','R201192100019','CRS00001','B200001',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00055','R201192100020','CRS00001','B200001',5,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00056','R201192100001','CRS00001','B200001',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00057','R201192100011','CRS00001','B200001',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00058','R201192100012','CRS00001','B200001',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00059','R201192100013','CRS00001','B200001',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00060','R201192100014','CRS00001','B200001',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00061','R201192100015','CRS00001','B200001',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00062','R201192100016','CRS00001','B200001',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00063','R201192100017','CRS00001','B200001',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00064','R201192100018','CRS00001','B200001',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00065','R201192100019','CRS00001','B200001',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00066','R201192100020','CRS00001','B200001',6,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00067','R201192100001','CRS00001','B200001',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00068','R201192100011','CRS00001','B200001',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00069','R201192100012','CRS00001','B200001',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00070','R201192100013','CRS00001','B200001',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00071','R201192100014','CRS00001','B200001',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00072','R201192100015','CRS00001','B200001',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00073','R201192100016','CRS00001','B200001',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00074','R201192100017','CRS00001','B200001',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00075','R201192100018','CRS00001','B200001',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00076','R201192100019','CRS00001','B200001',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00077','R201192100020','CRS00001','B200001',7,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00078','R201192100001','CRS00001','B200001',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00079','R201192100011','CRS00001','B200001',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00080','R201192100012','CRS00001','B200001',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00081','R201192100013','CRS00001','B200001',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00082','R201192100014','CRS00001','B200001',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00083','R201192100015','CRS00001','B200001',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00084','R201192100016','CRS00001','B200001',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00085','R201192100017','CRS00001','B200001',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00086','R201192100018','CRS00001','B200001',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00087','R201192100019','CRS00001','B200001',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00088','R201192100020','CRS00001','B200001',8,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00089','R201192100001','CRS00001','B200001',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00090','R201192100011','CRS00001','B200001',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00091','R201192100012','CRS00001','B200001',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00092','R201192100013','CRS00001','B200001',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00093','R201192100014','CRS00001','B200001',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00094','R201192100015','CRS00001','B200001',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00095','R201192100016','CRS00001','B200001',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00096','R201192100017','CRS00001','B200001',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00097','R201192100018','CRS00001','B200001',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00098','R201192100019','CRS00001','B200001',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00099','R201192100020','CRS00001','B200001',9,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00100','R201192100001','CRS00001','B200001',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00101','R201192100011','CRS00001','B200001',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00102','R201192100012','CRS00001','B200001',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00103','R201192100013','CRS00001','B200001',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00104','R201192100014','CRS00001','B200001',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00105','R201192100015','CRS00001','B200001',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00106','R201192100016','CRS00001','B200001',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00107','R201192100017','CRS00001','B200001',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00108','R201192100018','CRS00001','B200001',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00109','R201192100019','CRS00001','B200001',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00110','R201192100020','CRS00001','B200001',10,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00111','R201192100001','CRS00001','B200001',11,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00112','R201192100011','CRS00001','B200001',11,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00113','R201192100012','CRS00001','B200001',11,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00114','R201192100013','CRS00001','B200001',11,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00115','R201192100014','CRS00001','B200001',11,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00116','R201192100015','CRS00001','B200001',11,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00117','R201192100016','CRS00001','B200001',11,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00118','R201192100017','CRS00001','B200001',11,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00119','R201192100018','CRS00001','B200001',11,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00120','R201192100019','CRS00001','B200001',11,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00121','R201192100020','CRS00001','B200001',11,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00122','R201192100001','CRS00001','B200001',12,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00123','R201192100011','CRS00001','B200001',12,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00124','R201192100012','CRS00001','B200001',12,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00125','R201192100013','CRS00001','B200001',12,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00126','R201192100014','CRS00001','B200001',12,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00127','R201192100015','CRS00001','B200001',12,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00128','R201192100016','CRS00001','B200001',12,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00129','R201192100017','CRS00001','B200001',12,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00130','R201192100018','CRS00001','B200001',12,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00131','R201192100019','CRS00001','B200001',12,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00132','R201192100020','CRS00001','B200001',12,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00133','R201192100001','CRS00001','B200001',13,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00134','R201192100011','CRS00001','B200001',13,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00135','R201192100012','CRS00001','B200001',13,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00136','R201192100013','CRS00001','B200001',13,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00137','R201192100014','CRS00001','B200001',13,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00138','R201192100015','CRS00001','B200001',13,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00139','R201192100016','CRS00001','B200001',13,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00140','R201192100017','CRS00001','B200001',13,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00141','R201192100018','CRS00001','B200001',13,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00142','R201192100019','CRS00001','B200001',13,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00143','R201192100020','CRS00001','B200001',13,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00144','R201192100001','CRS00001','B200001',14,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00145','R201192100011','CRS00001','B200001',14,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00146','R201192100012','CRS00001','B200001',14,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00147','R201192100013','CRS00001','B200001',14,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00148','R201192100014','CRS00001','B200001',14,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00149','R201192100015','CRS00001','B200001',14,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00150','R201192100016','CRS00001','B200001',14,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00151','R201192100017','CRS00001','B200001',14,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00152','R201192100018','CRS00001','B200001',14,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00153','R201192100019','CRS00001','B200001',14,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00154','R201192100020','CRS00001','B200001',14,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00155','R201192100001','CRS00001','B200001',15,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00156','R201192100011','CRS00001','B200001',15,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00157','R201192100012','CRS00001','B200001',15,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00158','R201192100013','CRS00001','B200001',15,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00159','R201192100014','CRS00001','B200001',15,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00160','R201192100015','CRS00001','B200001',15,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00161','R201192100016','CRS00001','B200001',15,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00162','R201192100017','CRS00001','B200001',15,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00163','R201192100018','CRS00001','B200001',15,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00164','R201192100019','CRS00001','B200001',15,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00165','R201192100020','CRS00001','B200001',15,'pending');

------------------


insert into Batch_Schedule_Students values ('BTCHSCH00166','R201192100021','CRS00002','B200002',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00167','R201192100021','CRS00002','B200002',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00168','R201192100022','CRS00002','B200002',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00169','R201192100023','CRS00002','B200002',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00170','R201192100024','CRS00002','B200002',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00171','R201192100025','CRS00002','B200002',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00172','R201192100026','CRS00002','B200002',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00173','R201192100027','CRS00002','B200002',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00174','R201192100028','CRS00002','B200002',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00175','R201192100029','CRS00002','B200002',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00176','R201192100030','CRS00002','B200002',1,'pending');


insert into Batch_Schedule_Students values ('BTCHSCH00178','R201192100021','CRS00002','B200002',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00179','R201192100021','CRS00002','B200002',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00180','R201192100022','CRS00002','B200002',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00181','R201192100023','CRS00002','B200002',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00182','R201192100024','CRS00002','B200002',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00183','R201192100025','CRS00002','B200002',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00184','R201192100026','CRS00002','B200002',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00185','R201192100027','CRS00002','B200002',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00186','R201192100028','CRS00002','B200002',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00187','R201192100029','CRS00002','B200002',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00188','R201192100030','CRS00002','B200002',2,'pending');


insert into Batch_Schedule_Students values ('BTCHSCH00189','R201192100021','CRS00002','B200002',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00190','R201192100021','CRS00002','B200002',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00191','R201192100022','CRS00002','B200002',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00192','R201192100023','CRS00002','B200002',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00193','R201192100024','CRS00002','B200002',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00194','R201192100025','CRS00002','B200002',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00195','R201192100026','CRS00002','B200002',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00196','R201192100027','CRS00002','B200002',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00197','R201192100028','CRS00002','B200002',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00198','R201192100029','CRS00002','B200002',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00199','R201192100030','CRS00002','B200002',3,'pending');


insert into Batch_Schedule_Students values ('BTCHSCH00200','R201192100021','CRS00002','B200002',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00201','R201192100021','CRS00002','B200002',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00202','R201192100022','CRS00002','B200002',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00203','R201192100023','CRS00002','B200002',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00204','R201192100024','CRS00002','B200002',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00205','R201192100025','CRS00002','B200002',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00206','R201192100026','CRS00002','B200002',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00207','R201192100027','CRS00002','B200002',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00208','R201192100028','CRS00002','B200002',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00209','R201192100029','CRS00002','B200002',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00210','R201192100030','CRS00002','B200002',4,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00211','R201192100021','CRS00002','B200002',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00212','R201192100021','CRS00002','B200002',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00213','R201192100022','CRS00002','B200002',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00214','R201192100023','CRS00002','B200002',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00215','R201192100024','CRS00002','B200002',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00216','R201192100025','CRS00002','B200002',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00217','R201192100026','CRS00002','B200002',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00218','R201192100027','CRS00002','B200002',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00219','R201192100028','CRS00002','B200002',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00220','R201192100029','CRS00002','B200002',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00221','R201192100030','CRS00002','B200002',5,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00222','R201192100021','CRS00002','B200002',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00223','R201192100021','CRS00002','B200002',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00224','R201192100022','CRS00002','B200002',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00225','R201192100023','CRS00002','B200002',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00226','R201192100024','CRS00002','B200002',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00227','R201192100025','CRS00002','B200002',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00228','R201192100026','CRS00002','B200002',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00229','R201192100027','CRS00002','B200002',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00230','R201192100028','CRS00002','B200002',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00231','R201192100029','CRS00002','B200002',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00232','R201192100030','CRS00002','B200002',6,'pending');


insert into Batch_Schedule_Students values ('BTCHSCH00233','R201192100021','CRS00002','B200002',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00234','R201192100021','CRS00002','B200002',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00235','R201192100022','CRS00002','B200002',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00236','R201192100023','CRS00002','B200002',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00237','R201192100024','CRS00002','B200002',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00238','R201192100025','CRS00002','B200002',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00239','R201192100026','CRS00002','B200002',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00240','R201192100027','CRS00002','B200002',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00241','R201192100028','CRS00002','B200002',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00242','R201192100029','CRS00002','B200002',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00243','R201192100030','CRS00002','B200002',7,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00244','R201192100021','CRS00002','B200002',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00245','R201192100021','CRS00002','B200002',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00246','R201192100022','CRS00002','B200002',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00247','R201192100023','CRS00002','B200002',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00248','R201192100024','CRS00002','B200002',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00249','R201192100025','CRS00002','B200002',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00250','R201192100026','CRS00002','B200002',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00251','R201192100027','CRS00002','B200002',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00252','R201192100028','CRS00002','B200002',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00253','R201192100029','CRS00002','B200002',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00254','R201192100030','CRS00002','B200002',8,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00255','R201192100021','CRS00002','B200002',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00256','R201192100021','CRS00002','B200002',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00257','R201192100022','CRS00002','B200002',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00258','R201192100023','CRS00002','B200002',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00259','R201192100024','CRS00002','B200002',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00260','R201192100025','CRS00002','B200002',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00261','R201192100026','CRS00002','B200002',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00262','R201192100027','CRS00002','B200002',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00263','R201192100028','CRS00002','B200002',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00264','R201192100029','CRS00002','B200002',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00265','R201192100030','CRS00002','B200002',9,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00266','R201192100021','CRS00002','B200002',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00267','R201192100021','CRS00002','B200002',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00268','R201192100022','CRS00002','B200002',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00269','R201192100023','CRS00002','B200002',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00270','R201192100024','CRS00002','B200002',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00271','R201192100025','CRS00002','B200002',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00272','R201192100026','CRS00002','B200002',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00273','R201192100027','CRS00002','B200002',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00274','R201192100028','CRS00002','B200002',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00275','R201192100029','CRS00002','B200002',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00276','R201192100030','CRS00002','B200002',10,'pending');

-------------------

insert into Batch_Schedule_Students values ('BTCHSCH00277','R201192100021','CRS00004','B200004',1,'pending');
--insert into Batch_Schedule_Students values ('BTCHSCH00278','R201192100021','CRS00004','B200004',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00279','R201192100022','CRS00004','B200004',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00280','R201192100023','CRS00004','B200004',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00281','R201192100024','CRS00004','B200004',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00282','R201192100025','CRS00004','B200004',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00283','R201192100026','CRS00004','B200004',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00284','R201192100027','CRS00004','B200004',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00285','R201192100028','CRS00004','B200004',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00286','R201192100029','CRS00004','B200004',1,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00287','R201192100030','CRS00004','B200004',1,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00288','R201192100021','CRS00004','B200004',2,'pending');
--insert into Batch_Schedule_Students values ('BTCHSCH00289','R201192100021','CRS00004','B200004',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00290','R201192100022','CRS00004','B200004',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00291','R201192100023','CRS00004','B200004',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00292','R201192100024','CRS00004','B200004',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00293','R201192100025','CRS00004','B200004',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00294','R201192100026','CRS00004','B200004',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00295','R201192100027','CRS00004','B200004',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00296','R201192100028','CRS00004','B200004',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00297','R201192100029','CRS00004','B200004',2,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00298','R201192100030','CRS00004','B200004',2,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00299','R201192100021','CRS00004','B200004',3,'pending');
--insert into Batch_Schedule_Students values ('BTCHSCH00300','R201192100021','CRS00004','B200004',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00301','R201192100022','CRS00004','B200004',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00302','R201192100023','CRS00004','B200004',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00303','R201192100024','CRS00004','B200004',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00304','R201192100025','CRS00004','B200004',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00305','R201192100026','CRS00004','B200004',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00306','R201192100027','CRS00004','B200004',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00307','R201192100028','CRS00004','B200004',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00308','R201192100029','CRS00004','B200004',3,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00309','R201192100030','CRS00004','B200004',3,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00310','R201192100021','CRS00004','B200004',4,'pending');
--insert into Batch_Schedule_Students values ('BTCHSCH00311','R201192100021','CRS00004','B200004',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00312','R201192100022','CRS00004','B200004',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00313','R201192100023','CRS00004','B200004',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00314','R201192100024','CRS00004','B200004',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00315','R201192100025','CRS00004','B200004',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00316','R201192100026','CRS00004','B200004',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00317','R201192100027','CRS00004','B200004',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00318','R201192100028','CRS00004','B200004',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00319','R201192100029','CRS00004','B200004',4,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00320','R201192100030','CRS00004','B200004',4,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00321','R201192100021','CRS00004','B200004',5,'pending');
--insert into Batch_Schedule_Students values ('BTCHSCH00322','R201192100021','CRS00004','B200004',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00323','R201192100022','CRS00004','B200004',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00324','R201192100023','CRS00004','B200004',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00325','R201192100024','CRS00004','B200004',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00326','R201192100025','CRS00004','B200004',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00327','R201192100026','CRS00004','B200004',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00328','R201192100027','CRS00004','B200004',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00329','R201192100028','CRS00004','B200004',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00330','R201192100029','CRS00004','B200004',5,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00331','R201192100030','CRS00004','B200004',5,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00332','R201192100021','CRS00004','B200004',6,'pending');
--insert into Batch_Schedule_Students values ('BTCHSCH00333','R201192100021','CRS00004','B200004',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00334','R201192100022','CRS00004','B200004',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00335','R201192100023','CRS00004','B200004',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00336','R201192100024','CRS00004','B200004',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00337','R201192100025','CRS00004','B200004',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00338','R201192100026','CRS00004','B200004',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00339','R201192100027','CRS00004','B200004',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00340','R201192100028','CRS00004','B200004',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00341','R201192100029','CRS00004','B200004',6,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00342','R201192100030','CRS00004','B200004',6,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00343','R201192100021','CRS00004','B200004',7,'pending');
--insert into Batch_Schedule_Students values ('BTCHSCH00344','R201192100021','CRS00004','B200004',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00345','R201192100022','CRS00004','B200004',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00346','R201192100023','CRS00004','B200004',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00347','R201192100024','CRS00004','B200004',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00348','R201192100025','CRS00004','B200004',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00349','R201192100026','CRS00004','B200004',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00350','R201192100027','CRS00004','B200004',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00351','R201192100028','CRS00004','B200004',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00352','R201192100029','CRS00004','B200004',7,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00353','R201192100030','CRS00004','B200004',7,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00354','R201192100021','CRS00004','B200004',8,'pending');
--insert into Batch_Schedule_Students values ('BTCHSCH00355','R201192100021','CRS00004','B200004',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00356','R201192100022','CRS00004','B200004',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00357','R201192100023','CRS00004','B200004',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00358','R201192100024','CRS00004','B200004',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00359','R201192100025','CRS00004','B200004',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00360','R201192100026','CRS00004','B200004',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00361','R201192100027','CRS00004','B200004',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00362','R201192100028','CRS00004','B200004',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00363','R201192100029','CRS00004','B200004',8,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00364','R201192100030','CRS00004','B200004',8,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00365','R201192100021','CRS00004','B200004',9,'pending');
--insert into Batch_Schedule_Students values ('BTCHSCH00366','R201192100021','CRS00004','B200004',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00367','R201192100022','CRS00004','B200004',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00368','R201192100023','CRS00004','B200004',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00369','R201192100024','CRS00004','B200004',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00370','R201192100025','CRS00004','B200004',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00371','R201192100026','CRS00004','B200004',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00372','R201192100027','CRS00004','B200004',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00373','R201192100028','CRS00004','B200004',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00374','R201192100029','CRS00004','B200004',9,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00375','R201192100030','CRS00004','B200004',9,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00376','R201192100021','CRS00004','B200004',10,'pending');
--insert into Batch_Schedule_Students values ('BTCHSCH00377','R201192100021','CRS00004','B200004',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00378','R201192100022','CRS00004','B200004',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00379','R201192100023','CRS00004','B200004',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00380','R201192100024','CRS00004','B200004',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00381','R201192100025','CRS00004','B200004',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00382','R201192100026','CRS00004','B200004',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00383','R201192100027','CRS00004','B200004',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00384','R201192100028','CRS00004','B200004',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00385','R201192100029','CRS00004','B200004',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00386','R201192100030','CRS00004','B200004',10,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00387','R201192100021','CRS00004','B200004',11,'pending');
--insert into Batch_Schedule_Students values ('BTCHSCH00388','R201192100021','CRS00004','B200004',11,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00389','R201192100022','CRS00004','B200004',11,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00390','R201192100023','CRS00004','B200004',11,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00391','R201192100024','CRS00004','B200004',11,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00392','R201192100025','CRS00004','B200004',11,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00393','R201192100026','CRS00004','B200004',11,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00394','R201192100027','CRS00004','B200004',11,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00395','R201192100028','CRS00004','B200004',11,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00396','R201192100029','CRS00004','B200004',11,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00397','R201192100030','CRS00004','B200004',11,'pending');

insert into Batch_Schedule_Students values ('BTCHSCH00398','R201192100021','CRS00004','B200004',12,'pending');
--insert into Batch_Schedule_Students values ('BTCHSCH00399','R201192100021','CRS00004','B200004',10,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00400','R201192100022','CRS00004','B200004',12,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00401','R201192100023','CRS00004','B200004',12,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00402','R201192100024','CRS00004','B200004',12,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00403','R201192100025','CRS00004','B200004',12,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00404','R201192100026','CRS00004','B200004',12,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00405','R201192100027','CRS00004','B200004',12,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00406','R201192100028','CRS00004','B200004',12,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00407','R201192100029','CRS00004','B200004',12,'pending');
insert into Batch_Schedule_Students values ('BTCHSCH00408','R201192100030','CRS00004','B200004',12,'pending');



SELECT * FROM VW_ATT_DATA 

create view Vw_Att_Present as
select stid, regid, stname, crsid, crsname,batchid, nosessions, count(*)  as presents
from VW_ATT_DATA 
where attstatus='Present'
group by stid, regid, stname, crsname,batchid, nosessions
order by 1

create view Vw_Att_Absent as
select stid, regid, stname, crsid, crsname,batchid, nosessions, count(*)  as absents
from VW_ATT_DATA 
where attstatus='Absent'
group by stid, regid, stname, crsname,batchid, nosessions
order by 1



select * from 
select v.*,c.nosessions from v1 v join course c on v.crsid = c.crsid

drop view v1
create view Vw_Att_Data
as
select s.stid, stname, attid, r.regid, r.crsid, c.crsname,nosessions,sessionno, attstatus, batchid
from student s join registration r
on s.stid= r.stid
join ATT_BATCH_SCHEDULE_STUDENTS a on r.regid=a.regid
join course c on a.crsid=c.crsid


create view Vw_Att_Data
as
select s.stid, stname, attid, r.regid, r.crsid, c.crsname,sessionno, attstatus, batchid
from student s join registration r
on s.stid= r.stid
join ATT_BATCH_SCHEDULE_STUDENTS a on r.regid=a.regid
join course c on a.crsid=c.crsid
