
drop database if exists fruitshop;
create database if not exists fruitshop;
use fruitshop;

create table Units(UnitId tinyint unsigned not null auto_increment,UnitName varchar(10) not null,
DateEntered datetime not null, DateUpdataed timestamp default current_timestamp on update current_timestamp,
primary key (UnitId))engine=InnoDB default charset=utf8;


create table Vegetables(VegeId smallint unsigned not null auto_increment,VegeName varchar(45) not null,Inventory smallint unsigned not null,
UnitId tinyint unsigned not null,DateEntered datetime not null, DateUpdataed timestamp default current_timestamp on update current_timestamp,
primary key (VegeId),constraint fkVegeUnits foreign key(UnitId) references Units (UnitId) on delete restrict on update cascade)engine=InnoDB default charset=utf8;


