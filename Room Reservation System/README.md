Room Reservation System

Stages of the Projects
Phase I [10%]: Project Initiation

Step 1: Form Project Team
This is an individual project using Google Cloud Platform (GCP). This semester, each student will develop “Reservation System” based on RDBMS.
Here is some important requirements of your project:
• Should use any RDBMS running on GCP Compute Engine for your back-end storage (e.g., MySQL, Postgres, or SQL Server)
• Your system can be web-based system (3-tier using Web Server) using Web Application server. You need to decide and specify what system architecture you are using in this project, i.e., Web Application server and program language (e.g., Django for Python)
• Programming Language: Any, such as Python, C, C++, Java, ASP .Net, PHP, Perl, etc.
Step 2: Problem Statement (Chapter 3)
First, make the name of your application. For example, UB Room or UB Event, etc.
Here is the list of minimum requirements of your room reservation system:
• There are two types of users: “Admin” and “Normal” users
o Admin user: can manage entire your system, so can access any data. In addition, admin user can access daily/weekly reports
o Normal user can reserve a room
• Normal user can register the system, and then sign-in the system
• Normal user can book, modify and cancel a room
• Payment system is not required. However, you can implement “Payment” function for external event
• Normal user can rate the service or quality for the reservation
• Any users can see current/past/future status of reservation
• Normal user can send a message to Admin user regarding to any issue on the item
• Admin user can see the receive the message and related items
In addition to the minimum requirements, each team Should add at least 10 more requirements.
Step 3: Formulate in English at least 15 realistic queries (Chapter 3)
The queries would be useful to somebody using the data. The queries must be realistic and you should have more than few complex queries. Note, the queries that the database system must be able to answer ultimately determine what information needs to be maintained in the database. For example, you need not include the information about best friends of students if no user of your database will be asking for that. On the other hand, some additional information, may be included in the database if you feel that somebody may be interested in it.
Step 4: Specify the assumption about the database in English (Chapter 3)
Here you talk about attributes, keys, the nature of relationships between entities, etc. Do not discuss something that is obvious (e.g., that a student can take several courses). In addition, don't make too many simplifying assumptions.
[Submission guideline for Phase I]
You should submit the full and legible report with a cover page that includes your name, the title of the project, and abstraction (brief description of the project). The body of Phase I documentation should include sufficient detail to describe all steps of Phase I:
• (Step1) Team Information: number, name, member, and so on
• (Step2) Problem Statement: description of your “Auction”
• (Step3) List at least 15 queries in English
• (Step4) Any assumptions
In conclusion, describe what you have learned from the project, and what you need for the better project output. The GA and Instructor may recommend modification or additions to the document submitted in Phase I. After revision phase I as recommended, in this phase, you
can move to the next phase. You are strongly recommended to contact GA before you submit Phase I documentation.

The name of your submitted documentation file should be your “Project#_phase1”. You can use your UB ID number for #. For example, “0987654_phase1.doc”. Then, you will submit your file to Canvas (https://bridgeport.instructure.com/login).


Phase II [20%]: Conceptual / Logical Database Design

Step 5: EER modeling (Chapter 3 and 4)
Based on the Step 1 ~ 4 in the previous phase, in phase II draw an Enhanced Entity Relationship (EER) diagram for the problem you choose. This EER modeling should adhere to the principles taught in the course. It should also use the notation taught in the lecture and exercise lab. Entity should have keys clearly identified and relationships should have the cardinality information. The resulting EER diagram should contain:
• At least 10 entities
• At least 10 relationships (1:1, 1:N, and N:M)
• Some attributes on relationships
• At least 1 Weak entity
• At least 1 Generalization/Specialization
Step 6: Creating Relations (Chapter 9)
Based on the EER diagram, you should create relations using the relational model in the lecture. Make sure that you need to identify the primary key and foreign keys in all the relations.
• Identify other keys (candidate keys) in your relations
• Identify functional dependencies in your application and list them
Step 7: Relational Algebra (Chapter 8)
Formulate the queries in Step 3 using relational algebra. If, at this point, you are unable to state the queries in relational algebra, this is probably because your database is not powerful enough. Then, you must go back to step 2 and see how the database can be improved.
[Submission guideline for Phase II]
You should submit the full and legible report with a cover page that includes Team name, names of all members, the title of the project, and abstraction (brief description of the project). The body of Phase I documentation should include sufficient detail to describe all steps of Phase I:
• (Step5) ER diagram of the database
• (Step6) Relational database schema (including diagram)
• (Step7) Give the relational algebra expressions for the queries
In conclusion, describe what you have learned from the project, and what you need for the better project output.
The name of your submitted documentation file should be your “Project#_phase2”. You can use your project number for #. For example, “Project1_phase2.doc”. Then, you will submit your file to Canvas (https://bridgeport.instructure.com/login)

Phase III [25%]: System Setup using GCP (Exercise Lab for GCP)

In this phase, students should setup database server and web server using GCP. You are going to create Google Compute Engine for the database server where your selected RDBMS should be installed. On the other hand, you are going to create Google App Engine for the web application server for the selected web application server.
Step 8: Creating Database Server
First, create a project on GCP, named “ADB-[LastName]-[FirstName]”, e.g., “ADB-Lee-Jeongkyu”. Also, assign a billing account which is based on a coupon in the exercise lab.
For the database server, you can select any RDBMS including MySQL, Postgres, SQL Server. However, your RDBMS should be installed on GCP Compute Engine.
Step 9: Creating Web Application Server
For the Web Application Server, you can use Google App Engine. You can select any app frameworks such as Django, Flask, Spring and webapp2.
[Submission guideline for Phase III]
After you finish Phase III, you can just share your project with GA and instructor (uofbridgeport@gmail.com).

Phase IV [20%]: Physical Database Design/Implementation (Chapter 6 and 7)

In this phase, students should implement the database tables from the normalized set of relations created in the previous phase. Sample data should be supplied for each table. This phase is called as Physical database design.
Step 10: Creating DDL Script Filename: dbDDL.sql
Make a file containing the SQL statements that create your entire database schema, named dbDDL.sql. This includes the tables with their constraints, view, indexes, triggers, and all other database objects if you have them.
To keep the project consistent, make sure you have at least 8 tables. Make sure you have at least 2 database objects among trigger, function, procedure or view.
Step 11: Creating DML Script Filename: dbDML.sql
Make a file containing INSERT statements which populate the table created in Step 9, named dbDML.sql. This script will contain SQL commands to fill data in your data. Each table should have around 7 ~ 10 sample data. If needed, other DML statement, such UPDATE, and DELETE can be included here
Step 12: Creating Drop Script Filename: dbDROP.sql
Create a script that will drop all the objects you have created for your project including table, trigger, index, and etc.. This will be used to start from a clean state after some inserts and deletes have been added to your application to check the correctness of your queries. You should be able to clean everything through this script and re-create the database instance.
Step 13: Creating SQL Script Filename: dbSQL.sql
Create a script with queries from the relation algebra in Step 7, named dbSQL.sql. This script should contain at least 5 queries on your database. Use the comment facility in SQL*Plus (starting a line with -- , or /* */ ) to write the English version of your query, followed by the SQL version of the query. Also show the expected output in the file. These queries need to satisfy the following:
• Should be at least join queries (some involving more than 2 relations)
• At least two of them should be aggregate queries including GROUP BY and HAVING clauses with ORDER BY clause as well
• At least one of them should have nested subquery
The purpose of having you write these is to make you think about slightly complex scenarios on your database schema and have you write queries involving join, aggregation and nesting that you have learned in the class.
[Submission guideline for Phase IV]
Before you submit, you should test all four SQL script files using SQL*Plus by giving the command
SQL> @<filename>
or
SQL> start <Filename>
Make a single zip file. Please, use the same file name as the Phase I. Then, You will submit your program to Canvas (https://bridgeport.instructure.com/login).

Phase V [25%]: Application Develop and Demonstration (Chapter 10)

Step 14: Application Development
In this phase, you will develop a front-end application that will interface with your DBMS at the backend. The user will interact with the DBMS only through this interface. The GUI is not mandatory. However, the GUI will be used by the user to retrieve and update the database without having to write SQL queries. The interface will have a menu-driven input through which all interaction with the DBMS is accomplished. The results will be displayed to the user as well.
As indicated in the class, you can use Pro*C, Java that are currently supported on cpe.bridgeport.edu. If you want to do it with as a web-based interface which can be accessed from anywhere within UB, that is fine. The interface you develop should have the following features. The emphasis in grading phase of the project will be on the functionality and not on the GUI design. However, the GUI should be easy to understand and easy to use.
Step 15: Project Demonstration
Sign up for a demo (A sign-up sheet will be made available at the appropriate time by GA). Be prepared for the demo about 5 to 10 minutes. Your demo may include
• Introduction:
• Executive summary of the project
• Demonstration. If your application needs setting up on our machine, make sure it can be done in as less time as possible by automating it using compilation scripts etc. If you are using some specific web servers or tools, you need to demo on your own laptop.
• Conclusion
Step 16: Final Report and Project delivery
Prepare the final project report including:
• Cover page (Same as Phase I)
• Phase I documentation. You need to revise it if needed
• Phase II documentation. You need to revise it if needed
• Sources of SQL scripts created in Step 9 ~ 13
• System configuration of the project (usually system diagram)
• Sources of Applications generate in Step 14
• In conclusion, describe what you have learned from the project, and what you need for the better project output.
Put everything including documents, SQL file, and source files into one compressed file such as zip, tar, jar or rar. Then, submit it to Canvas.