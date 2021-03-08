set sql_safe_updates = 0;
use fruitshop;

delete from units where UnitId > 0;

select * from vegetables;
insert into units values
(1,'Piece','2021-02-20 15:00:00','2021-02-20 15:00:00'),
(2,'Kilogram','2021-02-20 15:00:00','2021-02-20 15:00:00'),
(3,'Gram','2021-02-20 15:00:00','2021-02-20 15:00:00'),
(4,'Pound','2021-02-20 15:00:00','2021-02-20 15:00:00'),
(5,'Ounce','2021-02-20 15:00:00','2021-02-20 15:00:00'),
(6,'Bunch','2021-02-20 15:00:00','2021-02-20 15:00:00');

select * from units;

insert into vegetables values
(1,'Apple',10,1,'2021-02-20 15:00:00','2021-02-20 15:00:00'),
(2,'Orange',5,2,'2021-02-20 15:00:00','2021-02-20 15:00:00'),
(3,'Banana',20,5,'2021-02-20 15:00:00','2021-02-20 15:00:00'),
(4,'Grapes',15,6,'2021-02-20 15:00:00','2021-02-20 15:00:00');
select * from vegetables;

update vegetables 
set UnitId = 2 ,VegeName = 'Apple'where VegeId = 1;
select * from vegetables;
update vegetables 
set UnitId = 1 where VegeId = 1 and VegeName = 'Apple';
select * from vegetables;
update vegetables 
set VegeName = 'FUCK',UnitId = 2 where VegeId = 1 and VegeName = 'Apple';
select * from vegetables;
delete from vegetables where UnitId = 2;
select * from vegetables;
delete from vegetables;
select * from vegetables;


