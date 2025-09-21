create database travel1
use  travel1
create table user1 (sno int,customerid int primary key,customername varchar(23),age int)
insert into user1 values (11,101,'Arun',25),(12,102,'Kaviya',43),(13,103,'Oviya',23),(14,104,'leo',45),
(15,105,'Hari',23),(16,106,'Robin',26),(17,107,'Ajay',28),(18,108,'Akilan',28),
(19,109,'Gayu',24),(20,110,'Iniya',34),(21,111,'Sherin',27)
select * from user1
drop table user1
truncate table user1
alter table user1 add column bookingtype varchar(33)
update user1 set bookingtype = "flight" where sno = 11
update user1 set bookingtype = "hotel" where sno =13
update user1 set bookingtype = "car rental" where sno =12
update user1 set bookingtype = "flight" where sno = 14
update user1 set bookingtype = "flight" where sno = 17
update user1 set bookingtype = "flight" where sno= 18
select * from user1 where bookingtype in ("flight")
select * from user1 where not  bookingtype in ("car rental")
select * from user1 where customername like "%a"
select * from user1 where age between 22 and 34
select * from user1 order by sno desc
select count(bookingtype), age from users group by age
having count(bookingtype)<=2

select count(*) as temp from user1
select sum(bookingtype) as temp from user1
select avg(bookingtype) as temp from user1
select max(bookingtype) as temp from user1
select min(bookingtype) as temp from user1

use travel1
create table flight (sno int,customerid int,flightno varchar(10),flightname varchar(32) primary key,
departureairport varchar(45),arrivalairport varchar(45),departuretime time,arrivaltime time,flightprice int,
FOREIGN KEY(customerid) REFERENCES user1(customerid)) 
INSERT INTO flight 
VALUES 
(11, 101, 'AI101', 'Air India', 'Delhi', 'New York', '06:00', '18:30', 45000),
(12, 102, 'EK202', 'Emirates', 'Dubai', 'London', '09:00', '13:30', 52000),
(13, 103, 'BA315', 'British Airways', 'London', 'Paris', '11:00', '12:30', 15000),
(14, 104, 'SQ423', 'Singapore Airlines', 'Mumbai', 'Singapore', '23:00', '05:00', 39000),
(15, 105, 'QR521', 'Qatar Airways', 'Doha', 'Mumbai', '16:00', '22:00', 31000),
(16, 106, 'LH760', 'Lufthansa', 'Frankfurt', 'Delhi', '14:00', '23:30', 47000),
(17, 107, 'UA890', 'United Airlines', 'San Francisco', 'Tokyo', '17:00', '07:30', 61000),
(18, 108, 'AF254', 'Air France', 'Paris', 'Delhi', '10:30', '22:00', 49000),
(19, 109, 'JL720', 'Japan Airlines', 'Tokyo', 'Singapore', '07:00', '12:45', 36000),
(120, 110, 'TK716', 'Turkish Airlines', 'Istanbul', 'Mumbai', '20:50', '05:10', 41000),
(121, 111, 'EY204', 'Etihad Airways', 'Abu Dhabi', 'Chennai', '15:00', '20:30', 32000)
drop table flight
select * from flight
delete from flight where sno=12
truncate table flight
alter table flight change column customerid userid int
select * from flight where arrivalairport in ("mumbai")
select * from flight where flightname like "%e"
select * from flight where flightname like "a%"
select * from flight where sno between 11 and 15
select * from flight order by sno desc

use travel1
create table hotel (sno int,hotelid int primary key,hotelname varchar(35),city varchar(35),
starrating decimal(25),wifi boolean,parking boolean,flightname varchar(34),
FOREIGN KEY (flightname) REFERENCES flight (flightname))
insert into hotel values(11,221,"the grand palace hotel","new york",5,TRUE,TRUE,'Air India'),
(12,222,"seaside inn","miami",3,TRUE,FALSE,'Emirates'),(13,223,"mounta in view","denver",5,TRUE,TRUE,'British Airways'),
(14,224,"budget stay","dallas",2,FALSE,TRUE,'Singapore Airlines') 
select * from hotel
drop table hotel
truncate table hotel
delete from table hotel where hotelid="G1"
select * from hotel where hotelname like "P%"
select * from hotel order by hotelid asc

use travel1
create table bookings(sno int,bookingid int,hotelid int,bookingtype varchar(34),customername varchar(23),
city varchar(43),FOREIGN KEY(hotelid)REFERENCES hotel(hotelid))
insert into bookings values(11,101,221,"hotel","arun","new york"),(12,102,222,"flight","kaviya","dubai"),
(13,103,223,"car rental","oviya","delhi"),(14,104,224,"hotel","leo","mumbai")
drop table bookings
select * from bookings
truncate table bookings
select count(*) as temp from bookings
select sum(bookingtype) as temp from bookings
select avg(bookingtype) as temp from bookings
select max(bookingtype) as temp from bookings
select min(bookingtype) as temp from bookings
select * from bookings where customername like "o%"
select * from bookings where bookingid between 101 and 103
select * from bookings order by bookingid desc

select user1.sno,user1.customername,flight.flightno,flight.flightprice,flight.departureairport,
flight.arrivalairport,flight.departuretime,flight.arrivaltime 
from user1 inner join flight on user1.sno=flight.sno;

select user1.sno,user1.Customerid,user1.customername,flight.flightno,flight.flightprice,flight.departureairport,
flight.arrivalairport,flight.departuretime,flight.arrivaltime 
from user1 left outer join flight 
on user1.sno=flight.sno;

select user1.sno,user1.Customerid,user1.customername,flight.flightno,flight.flightprice,
flight.departureairport,flight.arrivalairport,flight.departuretime,flight.arrivaltime 
from user1 right outer join flight 
on user1.sno=flight.sno;

select*from user1 left join flight on user1.sno=flight.sno
union
select*from user1 right join flight on user1.sno=flight.sno

select hotel.hotelid,hotel.hotelname,hotel.city,hotel.starrating,hotel.wifi,hotel.parking,
bookings.bookingid,bookings.bookingtype,bookings.customername,bookings.city
from hotel inner join bookings on hotel.sno=bookings.sno;

select hotel.hotelid,hotel.hotelname,hotel.city,hotel.starrating,hotel.wifi,hotel.parking,
bookings.bookingid,bookings.bookingtype,bookings.customername,bookings.city
from hotel left outer join bookings on hotel.sno=bookings.sno;

select hotel.hotelid,hotel.hotelname,hotel.city,hotel.starrating,hotel.wifi,hotel.parking,
bookings.bookingid,bookings.bookingtype,bookings.customername,bookings.city
from hotel right outer join bookings on hotel.sno=bookings.sno;

select*from hotel left join bookings on hotel.sno=bookings.sno 
union
select*from hotel right join bookings on hotel.sno=bookings.sno 







