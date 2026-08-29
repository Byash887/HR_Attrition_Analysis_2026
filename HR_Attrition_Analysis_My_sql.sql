-- MySQL HR Attrition Analysis - Messy Practice Sample Dataset
-- Topic: Human Resource Analysis / Employee Attrition
-- 4 related tables: departments, job_roles, employees, employee_exits
-- 120 employees + 48 exit records + supporting department/job-role data.
-- Intentional mess: NULLs, inconsistent capitalization/spaces, duplicate email,
-- inconsistent Yes/No values, inconsistent attrition reasons, and other quality issues.

CREATE DATABASE IF NOT EXISTS hr_databases;

USE hr_databases;

DROP TABLE IF EXISTS employee_exits;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS job_roles;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE job_roles (
    job_role_id INT PRIMARY KEY,
    job_role_name VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    email VARCHAR(150),
    phone VARCHAR(20),
    department_id INT,
    job_role_id INT,
    gender VARCHAR(20),
    age INT,
    hire_date DATE,
    monthly_salary DECIMAL(12,2),
    overtime VARCHAR(20),
    remote_work VARCHAR(20),
    job_satisfaction INT,
    performance_rating INT,
    years_at_company DECIMAL(4,1),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (job_role_id) REFERENCES job_roles(job_role_id)
);

CREATE TABLE employee_exits (
    exit_id INT PRIMARY KEY,
    employee_id INT NOT NULL,
    exit_date DATE,
    attrition_reason VARCHAR(100),
    exit_type VARCHAR(30),
    eligible_for_rehire VARCHAR(20),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO departments (department_id, department_name) VALUES
(1,'Human Resources'),
(2,'Sales'),
(3,'IT'),
(4,'Finance'),
(5,'Operations'),
(6,'Marketing'),
(7,'Customer Service'),
(8,'Research & Development');

INSERT INTO job_roles (job_role_id, job_role_name, department_id) VALUES
(1,'HR Executive',1),
(2,'HR Manager',1),
(3,'Sales Executive',2),
(4,'Sales Manager',2),
(5,'Software Engineer',3),
(6,'Data Analyst',3),
(7,'IT Support Specialist',3),
(8,'Financial Analyst',4),
(9,'Accountant',4),
(10,'Operations Executive',5),
(11,'Operations Manager',5),
(12,'Marketing Executive',6),
(13,'Customer Support Executive',7),
(14,'Research Analyst',8),
(15,'Project Manager',8);

INSERT INTO employees (employee_id, employee_name, email, phone, department_id, job_role_id, gender, age, hire_date, monthly_salary, overtime, remote_work, job_satisfaction, performance_rating, years_at_company) VALUES
(1001,'Tanya Rao','tanya.rao1001@company.com','9966177624',5,11,'male',32,'2025-11-28',114303,'yes','yes',1,1,0.7),
(1002,'Yash Kapoor','yash.kapoor1002@company.com','9975299395',7,13,'Female ',41,'2025-03-08',132929,'no','no',2,1,1.5),
(1003,'Amit Jain','amit.jain1003@company.com',NULL,3,7,'Female ',56,'2025-09-10',49526,'YES','Yes',4,2,1.0),
(1004,'Deepak Rao','deepak.rao1004@company.com','9187900644',8,14,'female',53,'2021-10-09',24337,'NO','yes',4,1,4.9),
(1005,'Neha Verma','neha.verma1005@company.com','9612429788',6,12,'female',36,'2019-04-25',94983,'No','No',4,4,7.3),
(1006,'Arjun Shah','arjun.shah1006@company.com','9168975030',5,10,'Female ',56,'2023-12-24',94545,'No','yes',4,3,2.7),
(1007,'Neha Mishra','neha.mishra1007@company.com','9283316996',6,12,'Female ',58,'2021-01-21',65923,'Yes','Yes',5,4,5.6),
(1008,' Vivaan Iyer ','vivaan.iyer1008@company.com','9899558377',5,11,'Male',33,'2021-06-22',55826,'Yes','no',1,3,5.2),
(1009,'Pooja Nair','pooja.nair1009@company.com','9885592975',7,13,'Female',37,'2019-09-10',110645,'Yes','No',1,3,7.0),
(1010,'Priya Mishra','priya.mishra1010@company.com','9153088946',3,6,'Male',40,'2020-10-23',108173,'NO','no',1,2,5.8),
(1011,'Ishita Mehta','ishita.mehta1011@company.com','9341523224',5,10,'male',24,'2023-06-17',98861,'NO','no',2,4,3.2),
(1012,'Tanya Iyer','tanya.iyer1012@company.com','9183107484',8,14,'Female',51,'2021-07-27',129429,'No','yes',4,1,5.1),
(1013,'Komal Saxena','komal.saxena1013@company.com','9657748859',7,13,'male',58,'2019-11-24',143865,'yes','No',4,4,6.8),
(1014,'Kavya Gupta','kavya.gupta1014@company.com','9910441445',4,9,'female',43,'2023-01-14',99530,'Yes','Yes',4,1,3.6),
(1015,'Rajat Saxena','rajat.saxena1015@company.com','9855857339',3,6,'female',49,'2023-08-28',39978,'yes','no',3,1,3.0),
(1016,'Akash Shah','akash.shah1016@company.com','9297616610',1,2,'male',42,'2020-05-15',28789,'YES','Yes',4,1,6.3),
(1017,'Vivaan Singh','vivaan.singh1017@company.com','9606497135',5,10,'Male',22,'2023-02-09',92331,' Yes ','No',5,1,3.5),
(1018,'Pooja Singh','pooja.singh1018@company.com','9559677911',1,1,'Female',55,'2020-12-10',57315,'YES','yes',4,4,5.7),
(1019,'Pooja Sharma','pooja.sharma1019@company.com','9664524224',6,12,'Male',39,'2021-08-25',64158,'Yes','yes',2,3,5.0),
(1020,'Meera Joshi','meera.joshi1020@company.com',NULL,8,14,'male',36,'2018-10-29',111251,'NO','yes',4,3,7.8),
(1021,'Nisha Malhotra','nisha.malhotra1021@company.com','9237652236',4,8,'male',26,'2022-11-21',79347,'yes','no',5,3,3.8),
(1022,'Pallavi Kumar','pallavi.kumar1022@company.com','9276596024',6,12,'male',47,'2018-09-27',102836,'No','No',4,3,7.9),
(1023,'Yash Rao','yash.rao1023@company.com','9687625210',6,12,'Female ',29,'2021-03-28',53798,'NO','yes',4,3,5.4),
(1024,'Kavya Sharma','kavya.sharma1024@company.com','9782328996',2,4,'female',25,'2022-10-30',33347,'yes','no',2,3,3.8),
(1025,'Rohan Joshi','rohan.joshi1025@company.com','9178185864',5,11,'female',41,'2019-09-01',41594,'no','yes',3,4,7.0),
(1026,'Priya Saxena','priya.saxena1026@company.com','9651897751',3,6,'Male',37,'2020-08-29',50405,'No','yes',5,4,6.0),
(1027,'Sneha Shah','sneha.shah1027@company.com','9184554608',5,11,'Female',41,'2018-02-18',26611,' Yes ','Yes',3,5,8.5),
(1028,'Pooja Rao','pooja.rao1028@company.com','9755026993',5,11,'female',31,'2022-08-27',49915,'No','No',5,4,4.0),
(1029,'Rajat Mehta','rajat.mehta1029@company.com','9920736336',7,13,'female',33,'2021-12-25',116578,'yes','No',4,5,4.7),
(1030,'Simran Patel','simran.patel1030@company.com','9240974791',4,9,'female',35,'2025-09-08',74670,'NO','no',3,3,1.0),
(1031,'Priya Kapoor','priya.kapoor1031@company.com','9329911938',3,6,'Male',51,'2019-02-06',75283,' Yes ','no',1,3,7.6),
(1032,'Meera Sharma','meera.sharma1032@company.com','9384117996',8,14,'Female',31,'2020-11-16',41222,'Yes','Yes',3,5,5.8),
(1033,'Arjun Patel','arjun.patel1033@company.com','9418227754',5,11,'female',54,'2020-12-14',128068,'yes','Yes',5,1,5.7),
(1034,'Ishita Joshi','ishita.joshi1034@company.com','9674175255',2,3,'male',39,'2024-11-28',68072,'NO','No',5,2,1.7),
(1035,'Aditya Malhotra','aditya.malhotra1035@company.com','9499681548',8,15,'male',52,'2022-02-11',50799,'Yes','Yes',3,3,4.5),
(1036,'Sneha Singh','sneha.singh1036@company.com','9756389492',2,3,'female',28,'2025-08-03',119385,'NO','No',4,3,1.1),
(1037,'Pallavi Iyer','pallavi.iyer1037@company.com',NULL,1,2,'Male',58,'2019-03-12',123371,'Yes','No',3,3,7.5),
(1038,'Deepak Joshi','deepak.joshi1038@company.com','9425131029',6,12,'female',26,'2022-04-22',22407,'no','no',1,4,4.3),
(1039,'Ishita Mishra','ishita.mishra1039@company.com','9890175751',8,14,'female',26,'2023-12-29',106733,'NO','yes',4,2,2.7),
(1040,'Divya Kumar','divya.kumar1040@company.com','9918205923',2,4,'Male',30,'2024-06-01',110924,'No','yes',4,4,2.2),
(1041,'Rahul Singh','rahul.singh1041@company.com','9974936521',7,13,'female',53,'2022-08-07',76232,' Yes ','yes',4,3,4.1),
(1042,'Komal Bansal','komal.bansal1042@company.com','9888703007',7,13,'Female',42,'2020-08-06',108212,'YES','no',3,3,6.1),
(1043,'Anjali Singh','anjali.singh1043@company.com','9996378646',4,9,'Female',49,'2022-11-20',69876,' Yes ','no',4,1,3.8),
(1044,' Rajat Singh ','rajat.singh1044@company.com','9367681224',1,2,'Male',37,'2025-12-26',69413,' Yes ','no',3,1,0.7),
(1045,'Ishita Agarwal','ishita.agarwal1045@company.com','9659851018',1,1,'Female ',41,'2025-11-09',99577,'YES','No',5,4,0.8),
(1046,'Divya Desai','divya.desai1046@company.com','9808851283',6,12,'male',57,'2022-12-18',142996,'NO','Yes',2,1,3.7),
(1047,'Amit Iyer','amit.iyer1047@company.com','9644896541',3,7,'female',58,'2018-01-30',138575,'Yes','No',3,4,8.6),
(1048,'Pooja Singh','pooja.singh1048@company.com','9400480898',4,8,'Female',22,'2024-10-20',83323,'YES','No',3,3,1.9),
(1049,'Isha Malhotra','isha.malhotra1049@company.com','9380639134',8,15,'Male',32,'2019-03-07',54486,'NO','No',3,2,7.5),
(1050,'Mohit Bansal','mohit.bansal1050@company.com','9876646686',5,11,'female',37,'2023-09-14',73228,'Yes','no',5,3,3.0),
(1051,'Sahil Bansal','sahil.bansal1051@company.com','9327898474',4,8,'Male',43,'2019-04-11',115687,'Yes','No',3,4,7.4),
(1052,'Ankit Jain','ankit.jain1052@company.com','9643503656',3,5,'Female ',21,'2023-06-24',143009,' Yes ','Yes',4,5,3.2),
(1053,'Riya Rao','riya.rao1053@company.com','9459901909',8,14,'Male',26,'2018-09-18',103856,'No','yes',5,4,7.9),
(1054,'Aditya Kumar','aditya.kumar1054@company.com',NULL,5,10,'male',31,'2021-10-26',143851,'YES','no',2,5,4.8),
(1055,'Akash Rao','akash.rao1055@company.com','9331839023',3,7,'Female ',48,'2021-06-22',82878,'yes','yes',4,1,5.2),
(1056,'Tanya Mishra','tanya.mishra1056@company.com','9243022076',6,12,'Male',40,'2019-02-16',33133,'YES','Yes',4,3,7.5),
(1057,'Rahul Malhotra','rahul.malhotra1057@company.com','9268313641',8,15,'male',29,'2022-12-13',130507,' Yes ','no',2,3,3.7),
(1058,'Riya Sharma','riya.sharma1058@company.com','9943623369',4,8,'Female ',25,'2022-08-19',98233,'No','no',3,3,4.0),
(1059,'Ishita Gupta','ishita.gupta1059@company.com','9468275791',8,14,'male',37,'2021-02-05',30440,'no','no',3,5,5.6),
(1060,'Sneha Sharma','sneha.sharma1060@company.com','9660394469',3,6,'male',21,'2020-05-16',107108,'no','Yes',3,3,6.3),
(1061,'Vikas Desai','vikas.desai1061@company.com','9968803873',6,12,'Female ',44,'2025-11-19',61562,'no','No',1,3,0.8),
(1062,'Vivaan Nair','vivaan.nair1062@company.com','9175554987',7,13,'female',43,'2024-11-19',128700,'No','yes',3,3,1.8),
(1063,'Komal Agarwal','komal.agarwal1063@company.com','9974212325',1,1,'male',44,'2018-02-19',113988,'yes','No',4,3,8.5),
(1064,'Simran Verma','simran.verma1064@company.com','9437982117',2,4,'Male',33,'2021-05-10',89239,' Yes ','yes',4,3,5.3),
(1065,'Shreya Sharma','shreya.sharma1065@company.com','9497610906',7,13,'male',57,'2021-02-21',105285,'yes','no',4,3,5.5),
(1066,'Anjali Kumar','anjali.kumar1066@company.com','9421658395',1,1,'female',40,'2019-04-05',139286,'No','Yes',1,3,7.4),
(1067,'Rajat Mehta','rajat.mehta1067@company.com','9497725581',5,11,'Male',25,'2022-11-02',92594,'NO','No',1,4,3.8),
(1068,'Meera Kapoor','meera.kapoor1068@company.com','9845393356',1,2,'female',33,'2024-11-15',143475,' Yes ','Yes',1,1,1.8),
(1069,'Saurabh Mishra','saurabh.mishra1069@company.com','9758304534',4,8,'Female ',33,'2022-05-03',115404,'no','Yes',5,3,4.3),
(1070,'Manish Jain','manish.jain1070@company.com','9377073095',3,6,'Female ',30,'2023-10-05',62123,'Yes','Yes',4,5,2.9),
(1071,'Deepak Agarwal','deepak.agarwal1071@company.com',NULL,7,13,'male',58,'2020-04-07',139600,'yes','No',2,3,6.4),
(1072,'Saurabh Kapoor','saurabh.kapoor1072@company.com','9418870646',3,5,'Female ',46,'2025-02-22',93120,'YES','No',3,1,1.5),
(1073,'Rajat Mishra','rajat.mishra1073@company.com','9667006412',6,12,'female',44,'2022-06-25',91125,'NO','yes',4,3,4.2),
(1074,'Manish Verma','manish.verma1074@company.com','9763612780',5,11,'male',36,'2019-10-30',64754,'yes','no',1,3,6.8),
(1075,'Varun Jain','varun.jain1075@company.com','9833162570',4,8,'Male',54,'2022-09-26',63168,'no','Yes',2,3,3.9),
(1076,'Shreya Kumar','shreya.kumar1076@company.com','9471549451',5,10,'Female',43,'2022-08-29',97780,'no','Yes',5,3,4.0),
(1077,'Priya Patel','9471549451','9551590828',6,12,'Female',34,'2021-08-12',41177,'no','no',3,1,5.0),
(1078,'Arjun Gupta','arjun.gupta1078@company.com','9972944716',7,13,'Male',57,'2018-09-29',66753,'yes','no',4,3,7.9),
(1079,'Divya Desai','divya.desai1079@company.com','9496237626',6,12,'Male',22,'2022-11-16',86389,'yes','No',1,4,3.8),
(1080,'Ankit Kumar','ankit.kumar1080@company.com','9757572282',2,3,'Female ',24,'2022-10-25',83850,' Yes ','No',1,4,3.8),
(1081,'Rohan Mehta','rohan.mehta1081@company.com','9126805367',1,1,'Female ',30,'2024-06-20',33828,'YES','No',3,1,2.2),
(1082,'Arjun Nair','arjun.nair1082@company.com','9745304821',3,5,'Female',48,'2018-09-30',89267,'Yes','yes',5,3,7.9),
(1083,'Priya Jain','priya.jain1083@company.com','9399874751',8,14,'Female ',34,'2020-10-08',81076,'No','No',3,5,5.9),
(1084,'Meera Kapoor','meera.kapoor1084@company.com','9207698729',2,4,'Female',38,'2021-04-10',37836,'no','Yes',2,3,5.4),
(1085,'Tanya Sharma','tanya.sharma1085@company.com','9540362301',3,5,'Female',31,'2022-03-06',68096,' Yes ','Yes',3,4,4.5),
(1086,'Mohit Verma','mohit.verma1086@company.com','9783788272',5,11,'male',55,'2020-01-12',90282,'no','No',4,2,6.6),
(1087,'Aditya Saxena','aditya.saxena1087@company.com','9719753927',5,11,'female',48,'2022-08-20',45567,'Yes','No',5,5,4.0),
(1088,'Aditya Nair','aditya.nair1088@company.com',NULL,5,10,'Male',39,'2024-03-23',93485,'NO','No',4,3,2.4),
(1089,'Arjun Singh','arjun.singh1089@company.com','9672678943',8,14,'Male',54,'2023-11-21',79208,'YES','yes',1,4,2.8),
(1090,' Neha Nair ','neha.nair1090@company.com','9794131690',1,2,'female',45,'2024-11-08',128133,'YES','Yes',2,3,1.8),
(1091,'Shreya Mehta','shreya.mehta1091@company.com','9343937060',7,13,'Female',30,'2021-07-27',140498,'Yes','Yes',3,3,5.1),
(1092,'Nikhil Mishra','nikhil.mishra1092@company.com','9662718602',5,11,'Female ',33,'2025-02-11',49303,'NO','Yes',5,4,1.5),
(1093,'Aarav Nair','aarav.nair1093@company.com','9595145198',5,11,'female',30,'2022-03-30',61165,'NO','yes',1,3,4.4),
(1094,'Yash Jain','yash.jain1094@company.com','9792220651',1,1,'female',48,'2022-07-23',57622,'yes','No',5,3,4.1),
(1095,'Pooja Mehta','pooja.mehta1095@company.com','9564408586',4,8,'Female ',53,'2024-06-20',77052,'No','yes',2,3,2.2),
(1096,'Aditi Jain','aditi.jain1096@company.com','9162402908',8,15,'Female',40,'2025-03-24',139203,'YES','yes',2,5,1.4),
(1097,'Aditya Gupta','aditya.gupta1097@company.com','9717516446',7,13,'male',30,'2020-06-26',88275,'YES','no',5,4,6.2),
(1098,'Rajat Sharma','rajat.sharma1098@company.com','9391404822',7,13,'Male',47,'2019-06-01',59469,'No','yes',5,3,7.2),
(1099,'Rahul Desai','rahul.desai1099@company.com','9392918355',8,15,'Female',53,'2022-09-07',79255,'Yes','yes',1,4,4.0),
(1100,'Karan Sharma','karan.sharma1100@company.com','9737332718',3,6,'Male',36,'2023-01-30',70061,'YES','no',3,5,3.6),
(1101,'Vikas Patel','vikas.patel1101@company.com','9272077554',1,1,'Male',44,'2022-08-13',123618,'NO','Yes',4,4,4.0),
(1102,'Mohit Iyer','mohit.iyer1102@company.com','9423714138',5,11,'female',27,'2025-06-14',68134,'YES','no',3,3,1.2),
(1103,'Priya Singh','priya.singh1103@company.com','9138342037',5,10,'Female',50,'2022-12-31',92392,'Yes','no',3,1,3.7),
(1104,'Sahil Bansal','sahil.bansal1104@company.com','9340571762',4,9,'Female ',37,'2025-05-26',99579,' Yes ','yes',4,3,1.3),
(1105,'Nisha Rao','nisha.rao1105@company.com',NULL,6,12,'female',31,'2021-03-10',24378,'no','Yes',3,5,5.5),
(1106,'Sakshi Shah','sakshi.shah1106@company.com','9391595515',8,14,'female',37,'2021-07-21',30988,'NO','Yes',5,3,5.1),
(1107,'Ananya Agarwal','ananya.agarwal1107@company.com','9351684808',4,9,'Female ',54,'2022-11-11',99383,'yes','yes',1,3,3.8),
(1108,'Pooja Verma','pooja.verma1108@company.com','9627136947',1,1,'female',21,'2022-02-23',141311,'no','no',4,3,4.5),
(1109,'Vivaan Mehta','vivaan.mehta1109@company.com','9787945725',5,10,'female',52,'2022-10-03',98542,'no','Yes',3,4,3.9),
(1110,'Nisha Patel','NISHA.PATEL1110@COMPANY.COM ','9420548308',4,8,'Male',48,'2019-07-23',110742,' Yes ','yes',3,4,7.1),
(1111,'Divya Desai','divya.desai1111@company.com','9907820919',7,13,'Male',24,'2025-07-21',103539,'NO','Yes',3,3,1.1),
(1112,'Ankit Singh','ankit.singh1112@company.com','9181463054',4,8,'Male',24,'2024-04-20',84495,'NO','Yes',5,4,2.4),
(1113,'Mohit Rao','mohit.rao1113@company.com','9953986298',3,6,'male',23,'2018-12-23',93481,'yes','No',5,2,7.7),
(1114,'Karan Gupta','karan.gupta1114@company.com','9186009109',8,14,'Female',47,'2022-04-14',71343,'YES','Yes',1,1,4.4),
(1115,'Riya Desai','riya.desai1115@company.com','9837519070',2,4,'Female ',40,'2020-06-22',104948,'No','No',4,5,6.2),
(1116,'Pooja Patel','pooja.patel1116@company.com','9623236230',4,9,'Male',51,'2019-07-13',40210,'YES','No',1,3,7.1),
(1117,'Akash Agarwal','akash.agarwal1117@company.com','9137267487',1,2,'Female ',47,'2018-11-07',42734,'YES','yes',4,5,7.8),
(1118,'Pooja Gupta','pooja.gupta1118@company.com','9900438684',2,3,'Female ',50,'2020-09-19',97485,'Yes','No',5,3,5.9),
(1119,'Aditi Mehta','aditi.mehta1119@company.com','9395685693',8,14,'Female ',26,'2021-10-28',136599,'No','no',2,3,4.8),
(1120,'Sakshi Agarwal','sakshi.agarwal1120@company.com','9430580048',8,15,'female',55,'2020-02-19',118478,'yes','No',5,4,6.5);

INSERT INTO employee_exits (exit_id, employee_id, exit_date, attrition_reason, exit_type, eligible_for_rehire) VALUES
(1,1073,'2024-06-27','Personal Reasons','Involuntary','No'),
(2,1004,'2024-05-20','Better Opportunity','Voluntary ','No'),
(3,1031,'2021-04-01','Personal Reasons','voluntary','No'),
(4,1107,'2024-02-11','higher studies','Voluntary','no'),
(5,1050,'2024-03-30','Relocation','Involuntary','yes'),
(6,1092,'2026-08-20','Personal Reasons','Involuntary',NULL),
(7,1082,'2025-11-26',' Better Opportunity ','voluntary',NULL),
(8,1112,'2025-03-22','Better Opportunity','Involuntary','no'),
(9,1064,'2025-08-02','Salary','involuntary','no'),
(10,1093,'2024-09-20','relocation','Voluntary','Yes'),
(11,1035,'2023-05-26','work-life balance','Voluntary','yes'),
(12,1003,'2026-07-22','job dissatisfaction','Voluntary','No'),
(13,1029,'2024-12-11','higher studies','Voluntary','no'),
(14,1076,'2025-03-24','higher studies','voluntary','yes'),
(15,1068,'2026-01-04','Manager Issues','Voluntary','yes'),
(16,1025,'2023-02-08','Better opportunity ','Involuntary','Yes'),
(17,1014,'2024-04-05','Relocation','involuntary','yes'),
(18,1047,'2021-01-08','salary ','voluntary','yes'),
(19,1072,'2026-08-07','Better Opportunity','VOLUNTARY','yes'),
(20,1071,'2022-11-30','Work Environment','Voluntary ','yes'),
(21,1066,'2020-06-27','Manager issues ','voluntary',NULL),
(22,1060,'2024-11-25','better opportunity','Involuntary','No'),
(23,1075,'2025-01-21','Higher Studies','involuntary',NULL),
(24,1049,'2023-07-30','higher studies','Involuntary','no'),
(25,1026,'2022-07-14','Career Growth','Voluntary ','Yes'),
(26,1032,'2024-12-18','Work Environment','involuntary','yes'),
(27,1022,'2020-06-13','Better opportunity ','Involuntary',NULL),
(28,1099,'2023-09-19','career growth','involuntary','No'),
(29,1044,'2026-07-29','better opportunity','Voluntary ','No'),
(30,1056,'2023-07-03','work environment','Voluntary','yes'),
(31,1097,'2022-09-22','career growth','Voluntary','yes'),
(32,1024,'2024-09-09','Work Environment','involuntary',NULL),
(33,1091,'2022-03-18','Better Opportunity','Voluntary ','yes'),
(34,1045,'2026-08-06','personal reasons','Voluntary ','no'),
(35,1040,'2026-01-06','Better Opportunity','Voluntary',NULL),
(36,1109,'2024-11-14','Work Environment','voluntary',NULL),
(37,1067,'2026-08-06','Job Dissatisfaction','Voluntary','no'),
(38,1051,'2025-01-28','salary ','Voluntary ','Yes'),
(39,1010,'2026-02-23','Career Growth','Voluntary ','Yes'),
(40,1098,'2021-02-11','job dissatisfaction','Involuntary','no'),
(41,1094,'2024-06-20','Higher Studies','Voluntary ',NULL),
(42,1033,'2023-10-28','career growth','Involuntary','Yes'),
(43,1046,'2026-06-27','Job Dissatisfaction','Voluntary',NULL),
(44,1106,'2024-12-01','relocation','involuntary','No'),
(45,1095,'2026-07-06','Better Opportunity','voluntary','no'),
(46,1101,'2023-08-16','Manager issues ','Involuntary','no'),
(47,1018,'2024-10-07','Better Opportunity','voluntary',NULL),
(48,1113,'2025-05-16','Better opportunity ','Voluntary ','No');

-- Basic row-count checks
SELECT COUNT(*) AS department_count FROM departments;
SELECT COUNT(*) AS job_role_count FROM job_roles;
SELECT COUNT(*) AS employee_count FROM employees;
SELECT COUNT(*) AS exit_count FROM employee_exits;


#This is all are tables in our databases.

show tables;
select * from departments;
select * from employee_exits;
select * from employees;
select * from job_roles;

# Now we see the tables details for better understanding.

describe departments;
describe employee_exits;
describe employees;
describe job_roles;

#Now we see the total records in each tables.

select count(*) as total_records from departments;
select count(*) as total_recorsd from employee_exits;
select count(*) as employees from employees;
select count(*) as total_records from job_roles;

#Now we will check the duplicate records in the dataset

select * from departments;
select count(*) as count_of_duplicate,department_id from departments
group by department_id
having count(*)>1;

#There is no duplicate records in our dataset.

#Now next table

select * from employee_exits;

select count(*),exit_id,employee_id from employee_exits
group by exit_id,employee_id
having count(*)>1;

#Now we see the employees table analysis.

select * from employees;

select employee_id , email , phone, count(*) from employees
group by employee_id,email,phone 
having count(*)>1;


#Now we will see the job roles table for checking the duplicate records.

select * from job_roles;

select job_role_id, count(*) from job_roles
group by job_role_id
having count(*)>1;


#Now we will see the Null valaus in databases

select * from departments;

select count(*) as total_records,
count(department_id),count(department_name) from departments;

#Great news there are no null values in the tables of the departments.

select * from employee_exits;

select count(*) as total_records,
count(exit_id),count(employee_id),count(exit_date),count(attrition_reason),count(exit_type),count(eligible_for_rehire)
from employee_exits;

select count(*) as Null_values from employee_exits
where eligible_for_rehire is null;

#Here, we can see that the eligible_for_rehire column has 11 missing values. Hypothetically, 
#we will assume that the business team has asked us to replace these missing values with the mode of the dataset.


select count(*) as total_rehire_records,eligible_for_rehire from 
employee_exits
group by eligible_for_rehire
order by total_rehire_records desc;

update employee_exits
SET eligible_for_rehire = "no"
where eligible_for_rehire is null;

SET SQL_SAFE_UPDATES=0;

select count(*) as total_records, eligible_for_rehire from employee_exits
group by eligible_for_rehire
order by total_records;

#Now we have fixed the Null values of the employee_exits table.

#Now we can move to the next table which is employees

select * from employees;
select count(*) as total_records ,
count(employee_id),
count(employee_name),
count(email),
count(phone),
count(department_id),
count(job_role_id),
count(gender),count(age),
count(hire_date),count(monthly_salary),
count(overtime),count(overtime),
count(remote_work),count(job_satisfaction),count(performance_rating),count(years_at_company)
from employees;

select count(*) as Total_records,
phone from employees
group by phone
order by Total_records desc;

#We can replace the null values with the "Not Provided".

update employees
set phone = "Not Provided"
where phone is null;

select count(*) as total_records,
count(employee_id),
count(employee_name),
count(email),
count(phone),
count(department_id),
count(job_role_id),
count(gender),count(age),
count(hire_date),count(monthly_salary),
count(overtime),count(overtime),
count(remote_work),count(job_satisfaction),count(performance_rating),count(years_at_company)
from employees;

#Now we will see the our next tables which is job_roles.

select * from job_roles;

select count(*) as Total_count_records,
count(job_role_id),count(job_role_name),count(department_id)
from job_roles;

#That very good thing there is no null values in this tables.

#Now we will move to the next steps which is the data validation and before we need to make sure our corrections didn't create new problems.

select * from departments;
select * from  employee_exits;
select * from employees;
select * from  job_roles;


#We need to make sure that employees actually connect to their departments and job roles.

SELECT e.employee_id, e.department_id
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

SELECT e.employee_id, e.job_role_id
FROM employees e
LEFT JOIN job_roles j
    ON e.job_role_id = j.job_role_id
WHERE j.job_role_id IS NULL;

SELECT ee.employee_id
FROM employee_exits ee
LEFT JOIN employees e
    ON ee.employee_id = e.employee_id
WHERE e.employee_id IS NULL;


show databases;
use hr_databases;
select * from departments;

#We will check the relationships between the tables to verify whether every record has a corresponding value in the related tables.

#Employee → Department
SELECT e.employee_id, e.department_id
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

#. Employee → Job Role

SELECT e.employee_id, e.job_role_id
FROM employees e
LEFT JOIN job_roles j
    ON e.job_role_id = j.job_role_id
WHERE j.job_role_id IS NULL;

# Employee Exit → Employee

SELECT ee.employee_id
FROM employee_exits ee
LEFT JOIN employees e
    ON ee.employee_id = e.employee_id
WHERE e.employee_id IS NULL;

# None of the tables have NULL values in their relationships. Now, we can proceed with the EDA (Exploratory Data Analysis).

#How many employees are there in each department?

select * from employees;
select * from departments;

select employees.department_id, departments.department_name,count(employee_id) as Total_number_employees from employees
join departments on employees.department_id = departments.department_id
group by  departments.department_id,
departments.department_name;

#How many employees are working in each job role?

select * from employees;
select * from job_roles;

select job_role_name,count(employee_id) as Total_number_employees
from employees
join job_roles on employees.job_role_id = job_roles.job_role_id
group by job_role_name,job_roles.job_role_id;

#What percentage of employees have left the company?


select count(employees.employee_id) as Total_employee,
count(employee_exits.employee_id) as Total_employee_left,
Round (count(employee_exits.employee_id)*100 / count(employees.employee_id) )as Attrition_rate 
from employees
left join employee_exits
on employees.employee_id = employee_exits.employee_id;

#here we can see that the attrition rate is 40 per.

#Which department has the highest number of employees leaving?

select count(distinct(employee_exits.employee_id)) as Total_employee_left,department_name from departments
join employees on employees.department_id = departments.department_id
join employee_exits on employee_exits.employee_id = employees.employee_id
group by department_name
order by Total_employee_left desc;

#What are the top reasons employees leave the company?

select * from employee_exits;

select attrition_reason, count(employee_id) as Total_number_employees from employee_exits
group by attrition_reason
order by Total_number_employees desc;

#Does gender have any relationship with employee attrition?

select * from employee_exits;

select * from  employees;

select distinct(gender) from employees;

update  employees set gender = UPPER(gender);

Set SQL_SAFE_UPDATES = 0;

update employees set overtime = lower(overtime) ;

select count(employee_exits.employee_id) as Total_employee_left , gender from employee_exits
join employees on employees.employee_id = employee_exits.employee_id
group by gender;

#Which age group has the highest number of employees leaving?

select * from employees;

alter table employees add column age_band varchar (100);
select * from employees;
update employees 
set age_band = case 
	when age<35 Then "Young"
	when age between 35 and 50 Then "Middle age"
	when age> 50  Then "Old"
end;

select * from employees;
select * from  employee_exits;

select count(employee_exits.employee_id) as Total_employee_left , employees.age_band from employees
left  join employee_exits on employee_exits.employee_id = employees.employee_id
group by age_band
order by Total_employee_left desc;


#Which job roles have the highest number of employees leaving?

select * from job_roles;
select * from employee_exits;
select * from employees;

select count(employee_exits.employee_id) as Total_count_who_left, job_role_name  from job_roles
left join employees on job_roles.job_role_id = employees.job_role_id
left join employee_exits on employee_exits.employee_id = employees.employee_id
group by job_role_name
order by Total_count_who_left desc;

#How many employees who left were eligible for rehire vs not eligible for rehire?

select * from employees;
select * from employee_exits;

select count(eligible_for_rehire) as count_of_employees ,eligible_for_rehire from  employee_exits
group by eligible_for_rehire;

#Which department has the highest attrition rate?

select * from departments;
select * from employees;
select * from employee_exits;

select count(employee_exits.employee_id) as Total_employees_left,department_name , Round(count(employee_exits.employee_id)/count(employees.employee_id)*100,2) as Attrtion_rate from departments
left join employees on employees.department_id = departments.department_id 
left join employee_exits on employee_exits.employee_id = employees.employee_id
group by department_name
order by Attrtion_rate desc;





 





  























 




























