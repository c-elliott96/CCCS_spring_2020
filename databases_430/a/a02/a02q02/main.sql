drop database cms;		
create database cms;
use cms;

create table year (
       id INT AUTO_INCREMENT,
       year INT,
       primary key (id)
       ) engine=innodb;

create table season (
       id INT AUTO_INCREMENT,
       season VARCHAR(100),
       primary key (id)
       ) engine=innodb;

create table semester (
       id INT AUTO_INCREMENT,
       sem_start DATE,
       sem_end DATE,
       primary key (id)
       ) engine=innodb;

create table course (
       id INT AUTO_INCREMENT,
       course VARCHAR(100),
       primary key (id)
       ) engine=innodb;

create table section (
       id INT AUTO_INCREMENT,
       course VARCHAR(10),
       primary key (id)
       ) engine=innodb;

create table person (
       id INT AUTO_INCREMENT,
       fname VARCHAR(100),
       lname VARCHAR(100),
       email VARCHAR(100),
       user VARCHAR(100),
       password VARCHAR(100),
       primary key (id)
       ) engine=innodb;

create table instructor (
       id INT NOT NULL AUTO_INCREMENT,
       primary key(id),
       person_id INT,
       foreign key (person_id) references person(id)
       ) engine=innodb;

insert person (fname, lname, user, password)
value ('Yihsiang', 'Liow', 'yliow', 'password'),
      ('John', 'Doe', 'jdoe', 'secret');

insert instructor (person_id) select person.id from person where person.user = 'yliow';

insert instructor (person_id) select person.id from person where person.user ='jdoe';
