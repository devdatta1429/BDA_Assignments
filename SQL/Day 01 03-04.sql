create database db;
use db;

create table Student_varchar2(
s_id int,
s_name varchar(300)
);

insert into Student_varchar2 value(2,'devdatta');

#-----------------------------varchar-----------------------------------

create table student_varchar3(
s_id int,
s_name varchar(50) );

insert into student_varchar3 value(1,"sujal");
insert into student_varchar3 value(7,"thala");

select * from student_varchar3;

#-------------------------------------------------------

create table student_varchar4(
	s_id int,
	f_name varchar(35) default 'for varchar',
	l_name char(20) default 'for char'
);

insert into student_varchar4(s_id,f_name) values(2,"soham");
select * from student_varchar4;

#-----------------------------------------------------------

create table student_varchar4(
	s_id int,
	f_name varchar(35) default 'for varchar',
	l_name char(20) default 'for char',
	descp text default 'a');
    # Error Code: 1101. BLOB, TEXT, GEOMETRY or JSON column 'descp' can't have a default value	0.000 sec


create table student_varchar5(
	s_id int,
	f_name varchar(35) default 'for varchar',
	l_name char(20) default 'for char',
	descp text);
    
insert into student_varchar5(s_id,f_name,l_name,descp) values(3,"devdatta","Thorat","You mentioned being the Front-end Developer for the Villa Booking app. Why did you choose Flutter and Dart over other frameworks like React Native?");

select * from student_varchar5;

#================================================================================

CREATE TABLE system_logs (
  log_id      INT AUTO_INCREMENT PRIMARY KEY,
  app_name    VARCHAR(100),
  log_level   ENUM('INFO','WARN','ERROR'),
  log_data    LONGTEXT,           -- entire log dump, up to 4 GB
  logged_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

#===================================================================================

create table text1(
s_id int,
f_name varchar(35) default 'varchar',
p_hoto blob
);

insert into text1(s_id,f_name,p_hoto) values(2,"dev ",load_file("D:/Downloads/mumbai-local-trains.jpg"));
select * from text1;
insert into text1(s_id,f_name,p_hoto) values(3,"sujal",load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/image.png"));

#====================================  set ============================================

create table student(
	s_id int,
	f_name varchar(35) default 'for varchar',
	l_name char(20) default 'for char',
	descp text,
    elc set("ML","DS","IRS")
    );

desc student;

insert into student(s_id,elc) values (2,"DS");
insert into student(s_id,elc) values (3,"DS,DE");
#0	18:09:49	insert into student(s_id,elc) values (3,"DS,DE")	Error Code: 1265. Data truncated for column 'elc' at row 1	0.000 sec

insert into student(s_id,elc) values (3,"DS,IRS");
select * from student;

#====================================================================================
#============================== set ==========================================
# it like a check box. can choose multi option
#==============================================================================

create table student1(
	s_id int,
	f_name varchar(35) default 'for varchar',
	l_name char(20) default 'for char',
	descp text,
    skills set("java","python","web tech","sql")
    );
    
insert into student1 (s_id,skills) values(3,"python,sql");
select * from student1;

#====================================================================

create table set_role(
S_id int,
skills set("java","python","web tech","sql"),
roles set("ML","DA","AI"));

insert into set_role(s_id,skills,roles) values(3,"java,sql","DA,AI");
insert into set_role values(13,"python,sql","ML,AI");
select * from set_role;

#============================== enum==========================================
# it like a radio button . can choose only one
#==============================================================================

create table gender_enum(
S_id int,
skills set("java","python","web tech","sql"),
roles set("ML","DA","AI"),
gender enum ("m","f","o"));

insert into gender_enum(gender) values("m");
select * from gender_enum;

#=========================================================================
create table gender_enum1(
S_id int,
skills set("java","python","web tech","sql"),
roles set("ML","DA","AI"),
gender enum ("m","f","o"),
payment enum("UPI","cash","CC")
);

insert into gender_enum1 values(1,"java,sql","ML,DA","m","UPI");
select * from gender_enum1;