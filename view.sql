drop view if exists vfuritinventory ;

create view vFuritInventory as 
select
	vegetables.VegeName,vegetables.Inventory,units.UnitName
from
    vegetables inner join units on vegetables.UnitId = units.UnitId;
    
    select * from vfuritinventory;
	select * from vegetables;
    select * from units;
    select vegename from vfuritinventory where inventory <=10;
    
alter view vFuritInventory as 
select
	vegetables.VegeName,vegetables.Inventory,units.UnitName
from
    vegetables inner join units on vegetables.UnitId = units.UnitId;
    
    create or replace view vFuritInventory as 
select
	vegetables.vegeid,vegetables.VegeName,vegetables.Inventory,units.UnitName
from
    vegetables inner join units on vegetables.UnitId = units.UnitId;
    
    select * from vfuritinventory;

delimiter LKL
create procedure spcheckvegeStock(thisvege smallint)
begin
select
	vegetables.vegeid,vegetables.VegeName,vegetables.Inventory,units.UnitName
from
    vegetables inner join units on vegetables.UnitId = units.UnitId
where
    vegetables.vegeid = thisvege;
end LKL

delimiter ;

call spcheckvegeStock(1);
drop procedure if exists spcheckvegeStock;
drop procedure if exists spcheckvegeStockLevel;

delimiter LKL
create procedure spcheckvegeStockLevel(IN thisvege smallint(5),OUT pStockLevel varchar(6))
begin
	declare stockNumber smallint; 
	select
		vegetables.Inventory into stockNumber
	from
		vegetables inner join units on vegetables.UnitId = units.UnitId
	where
		vegetables.vegeid = thisvege;

	if stockNumber > 10 then
		set pStockLevel = 'High';
	elseif (stockNumber <= 10 and stockNumber >= 5 ) then
		set pStockLevel = 'Medium';
  	elseif (stockNumber < 5 ) then
		set pStockLevel = 'low';  
	end if;
        
end LKL
delimiter ;

call spcheckvegeStockLevel(1,@stocklevel);
select @stocklevel;
use fruitshop;
show tables;
DESCRIBE fruitshop;



