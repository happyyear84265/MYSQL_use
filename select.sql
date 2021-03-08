use fruitshop;
select vegetables.* from vegetables where unitId =(select UnitId from units where UnitName = 'kilogram');
select * from units;
select vegetables.* from vegetables
inner join Units
on vegetables.UnitId = Units.UnitId
where Units.UnitName = 'Piece';
select * from vegetables
where Inventory > 5;
select * from vegetables
where Inventory <> 10;
select * from vegetables
where Inventory < 5;
select * from vegetables
where Inventory <= 5;
select * from vegetables
where Inventory >= 5;
select * from vegetables
where Inventory > 5
and DateEntered < '2021-02-20';
select * from vegetables
where Inventory > 5 or DateEntered < '2021-02-21';
select * from vegetables
where DateEntered between '2021-02-19' and '2021-02-21';
select * from vegetables
where not (VegeName = 'Apple');



