drop database q03;;
create database q03;;
use q03;;

create table Users (
       username VARCHAR(16) unique,
       id INT not null AUTO_INCREMENT,
       primary key (id)
       );

create table Images (
       user_id INT,
       filename VARCHAR(32),
       username VARCHAR(16),
       foreign key (user_id) references Users(id)
       );

insert Users (username)
       values ('jdoe'),
       	      ('tsmith')
	      ;;

insert Images (filename, username)
       values ('0000.jpg', 'jdoe'),
       	      ('0001.jpg', 'tsmith'),
	      ('0002.jpg', 'tsmith'),
	      ('0001.jpg', 'jdoe'),
	      ('0004.jpg', 'jdoe')
	      ;;

update Images, Users
set Images.user_id = Users.id where Images.username = Users.username;;

select username, filename from Images;;
