create schema sms;
use sms;

create table addresses(
address_id int(15) not null auto_increment,
address_details varchar(25) not null,
primary key (address_id));

insert into addresses(address_details) values
('Silver Spring, MD'),
('Takoma Park, MD');

select * from addresses;

create table schools(
school_id int(15) not null auto_increment,
school_name varchar(25) not null,
school_principal varchar(25) not null,
other_school_details varchar(25) not null,
address_id int not null,
primary key (school_id),
foreign key(address_id) references addresses(address_id));

insert into schools(address_id,school_name,school_principal,other_school_details) values
('1', 'North East School','Dipak','Java School'),
('2', 'South East School','Dipak','Python School'),
('2', 'US Software School','Dipak','Sql School');

select * from schools;

ALTER TABLE schools MODIFY COLUMN address_id int not null AFTER other_school_details;

create table teachers(
teacher_id int(15) not null auto_increment,
first_name varchar(25) not null,
middle_name varchar(25) not null,
last_name varchar(25) not null,
gender varchar(25) not null,
other_teacher_details varchar(25),
school_id int not null,
primary key(teacher_id),
foreign key(school_id) references schools(school_id));

-- ALTER TABLE teachers MODIFY COLUMN gender varchar(20) not null AFTER last_name;
-- ALTER TABLE teachers MODIFY COLUMN school_id int not null AFTER other_teacher_details;
-- ALTER TABLE teachers MODIFY COLUMN middle_name varchar(25) AFTER first_name;

insert into teachers(first_name,middle_name,last_name,gender,other_teacher_details,school_id)values
('Saroj','','khadka','male','Networking Teacher','3'),
('Rusma','','Thapa','female','Frontend Teacher','3'),
('Ram','Kumar','khadka','male','Ruby Teacher','2'),
('David','Harris','jhon','male','Windows Teacher','1'),
('Shree','','khadka','male','Linux Teacher','2'),
('Bhawana','','Bhatt','female','Amazon Teacher','1');

select * from teachers;

create table subject(
subject_id int(15) not null auto_increment,
subject_name varchar(25) not null,
primary key(subject_id));

insert into subject(subject_name)values
('Networking'),
('windows'),
('Hardware'),
('Ruby Rails'),
('Programming'),
('Linux'),
('Amazon');

select * from subject;
select * from teachers;

create table classes(
class_id int(15) not null auto_increment,
class_code varchar(25) not null,
class_name varchar(25) not null,
date_from date,
date_to date,
subject_id int not null,
teacher_id int not null,
primary key(class_id),
foreign key(subject_id) references subject(subject_id),
foreign key(teacher_id) references teachers(teacher_id));

-- ALTER TABLE classes MODIFY COLUMN subject_id int not null AFTER date_to;
-- ALTER TABLE classes MODIFY COLUMN teacher_id int not null AFTER subject_id;

insert into classes(class_code,class_name,date_from,date_to,subject_id,teacher_id)values
('C001','Class 1','2023-01-01','2023-12-30','7','6'),
('C002','Class 2','2023-01-01','2023-06-15','1','1'),
('C003','Class 3','2023-01-01','2023-05-25','4','4'),
('C004','Class 4','2023-01-01','2023-07-20','2','3'),
('C005','Class 4','2023-01-01','2023-04-10','3','2'),
('C006','Class 6','2023-01-01','2023-03-01','6','5');

select * from classes;

create table parents(
parent_id int(15) not null auto_increment,
first_name varchar(25) not null,
middle_name varchar(25) not null,
last_name varchar(25) not null,
gender varchar(25) not null,
other_parent_details varchar(25) not null,
primary key(parent_id));

-- ALTER TABLE parents MODIFY COLUMN gender varchar(25) not null AFTER last_name;
-- ALTER TABLE parents MODIFY COLUMN middle_name varchar(25) AFTER first_name;
-- ALTER TABLE parents MODIFY COLUMN other_parent_details varchar(25) AFTER gender;

insert into parents(first_name,middle_name,last_name,gender,other_parent_details) values
('Raju','ram','thapa','male',''),
('jeevan','','Tamang','male',''),
('Krishna','bahadur','pariyar','male',''),
('kamal','','thapa','male',''),
('anju','','yogi','female',''),
('sanju','','harijan','female','');

select * from parents;

create table students(
student_id int(15) not null auto_increment,
first_name varchar(25) not null,
middle_name varchar(25) not null,
last_name varchar(25) not null,
dete_of_birth date,
gender varchar(25) not null,
other_student_details varchar(50),
primary key(student_id));

-- alter table students modify column middle_name varchar(25) after first_name;

insert into students(first_name,middle_name,last_name,dete_of_birth,gender,other_student_details)values
('Rakes','','rai','1998-05-05','male',''),
('Hari','','khadka','1997-05-05','male',''),
('Sanjeev','','Tamang','1996-05-15','male',''),
('Rupa','','pariyar','1995-10-13','female',''),
('Gopal','','bhatt','1990-01-20','male',''),
('Kabita','','shrestha','2000-01-05','female',''),
('Sumitra','','khadka','1994-05-05','female',''),
('Om','','karki','1998-06-05','male',''),
('Dilip','kumar','bk','2001-02-10','male','');

select * from students;

create table homework(
homework_id int(15) not null auto_increment,
date_created date not null,
homework_content varchar(25) not null,
grade varchar(20) not null,
other_homework_details varchar(20),
student_id int not null,
primary key(homework_id),
foreign key(student_id) references students(student_id));

-- alter table homework modify column student_id int not null after other_homework_details;

insert into homework(date_created,homework_content,grade,other_homework_details,student_id)values
('2023-01-01','Assigement1','G001','','5'),
('2023-01-02','Assigement2','G002','','1'),
('2023-01-03','Assigement3','G003','','4'),
('2023-01-04','Assigement4','G004','','2'),
('2023-01-05','Assigement5','G005','','3'),
('2023-01-06','Assigement6','G006','','6');

select * from homework;

create table reports(
report_id int(20) not null auto_increment,
date_created date not null,
report_content varchar(50) not null,
teacher_comments varchar(50) not null,
other_report_details varchar(50),
student_id int not null,
primary key(report_id),
foreign key(student_id) references students(student_id));

-- alter table reports modify column student_id int not null after other_report_details;

select * from reports;

create table parent_addresses(
parent_id int,
address_id int,
date_address_from int(15) not null auto_increment,
primary key(date_address_from),
foreign key(parent_id) references parents(parent_id),
foreign key(address_id) references addresses(address_id));

select * from parent_addresses;

create table student_parents(
student_id int,
parent_id int,
foreign key(student_id) references students(student_id),
foreign key(parent_id) references parents(parent_id));

select * from student_parents;

create table student_addresses(
student_id int,
address_id int,
date_from date not null,
date_to date not null,
address_details varchar(25) not null,
primary key(date_from),
foreign key(student_id) references students(student_id),
foreign key(address_id) references addresses(address_id));

select * from student_addresses;

create table families(
family_id int(20) not null auto_increment,
head_of_family_parent_id int,
family_name varchar(25) not null,
primary key(family_id),
foreign key(head_of_family_parent_id) references parents(parent_id));

select * from families;



create table family_members(
family_member_id int(15) not null auto_increment,
family_id int,
parents_of_student_memeber varchar(25),
parent_id int,
student_id int,
primary key(family_member_id),
foreign key(family_id) references families(family_id),
foreign key(parent_id) references parents(parent_id),
foreign key(student_id) references students(student_id));

select * from family_members;

create table student_classes(
student_id int,
class_id int,
date_from date not null,
date_to date,
primary key(date_from),
foreign key(student_id) references students(student_id),
foreign key(class_id) references classes(class_id));

select * from student_classes;