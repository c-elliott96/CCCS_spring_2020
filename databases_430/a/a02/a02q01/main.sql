create database cms;
use cms;

create table year (
       id INT,
       semester_id INT,
       year YEAR(4),
       foreign key(semester_id) references semester(id)
       );

create table season (
       id INT,
       season VARCHAR(100)
       );

create table semester (
       id INT,
       sem_start DATE,
       sem_end DATE
       primary key (id)
       );

create table course (
       id INT,
       course VARCHAR(100)
       );

create table section (
       id INT,
       course VARCHAR(10)
       );

create table person (
       id INT,
       fname VARCHAR(100),
       lname VARCHAR(100),
       email VARCHAR(100),
       user  VARCHAR(100),
       password VARCHAR(100)
       );


