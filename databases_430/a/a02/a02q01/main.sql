drop database cms;		
create database cms;
use cms;

create table year (
       id INT,
       year YEAR(4),
       primary key (id)
       );

create table season (
       id INT,
       season VARCHAR(100),
       primary key (id)
       );

create table semester (
       id INT,
       sem_start DATE,
       sem_end DATE
       primary key (id)
       );

create table course (
       id INT,
       course VARCHAR(100),
       primary key (id)
       );

create table section (
       id INT,
       course VARCHAR(10),
       primary key (id)
       );

create table person (
       id INT,
       fname VARCHAR(100),
       lname VARCHAR(100),
       email VARCHAR(100),
       user VARCHAR(100),
       password VARCHAR(100),
       primary key (id)
       );

create table instructor (
       person_id INT,
       foreign key (person_id) references person(id)
       );


