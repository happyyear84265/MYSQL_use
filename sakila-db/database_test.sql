delete from sakila.actor where actor_id = 201 or actor_id = 202 or actor_id = 203 or actor_id = 204;
select * from sakila.actor;
insert into sakila.actor(first_name,last_name) values('Danny','Liu');
select * from sakila.actor;

select city,country from city inner join country on city.country_id = country.country_id;

select city,country from city a inner join country b on a.country_id = b.country_id;

select country,count(city) from country a inner join city b on a.country_id = b.country_id group by country;

select c.customer_id,c.first_name,c.last_name,a.actor_id,a.first_name,a.last_name from customer c left join actor a on c.last_name = a.last_name order by c.last_name;

select c.customer_id,c.first_name,c.last_name,a.actor_id,a.first_name,a.last_name from customer c right join actor a on c.last_name = a.last_name order by a.last_name;

select c.customer_id,c.first_name,c.last_name,a.actor_id,a.first_name,a.last_name from customer c inner join actor a on c.last_name = a.last_name;

select * from actor where actor_id in (select actor_id from film_actor where film_id = 2);

select * from actor where actor_id in (select actor_id from film_actor where film_id = (select film_id from film where title = 'Ace Goldfinger'));

drop table if exists ace_goldfinger_actors;
create table ace_goldfinger_actors(first_name varchar(45),last_name varchar(45));

-- test
insert into ace_goldfinger_actors(first_name,last_name)
select first_name,last_name from actor a inner join film_actor fa on a.actor_id = fa.actor_id where fa.film_id = (select film_id from film where title = 'Ace Goldfinger');

select * from ace_goldfinger_actors;

select AVG(a) FROM (select customer_id,SUM(amount) a from payment group by customer_id ) as totals; 

select customer_id,SUM(amount) a from payment group by customer_id;

select distinct first_name from sakila.actor where first_name LIKE 'AN%';

select count(distinct first_name) from sakila.actor where first_name LIKE 'AN%';

select count(first_name) from sakila.actor where first_name LIKE 'AN%';

select distinct first_name,last_name from sakila.actor where first_name LIKE 'AN%';

select count(distinct first_name) from sakila.actor;

select count(distinctrow first_name) from sakila.actor;

select last_name from sakila.actor ;

select last_name from sakila.actor group by last_name;

select last_name,count(*) from sakila.actor group by last_name;

select c.customer_id as 'Customer ID',c.first_name as 'First Name',c.last_name as 'Last Name' ,SUM(amount) as 'Total Paid' from sakila.payment p 
inner join customer c on p.customer_id = c.customer_id group by last_name;

select last_name,count(*) from sakila.actor group by last_name having count(*) > 3;

select c.customer_id as 'Customer ID',c.first_name as 'First Name',c.last_name as 'Last Name' ,SUM(amount) as 'Total Paid' from sakila.payment p 
inner join customer c on p.customer_id = c.customer_id group by last_name having sum(amount) > 180 order by SUM(amount) desc;

select * from sakila.actor order by actor_id asc;

select * from sakila.actor order by actor_id desc;

select * from sakila.actor where first_name like 'an%' order by first_name,last_name asc;

select * from sakila.actor where first_name like 'an%' order by first_name,last_name desc;

select title,CHAR_LENGTH(title),character_length(title) from film;

select
	title Title_1,
    CHAR_LENGTH(title) Length, 
    if(CHAR_LENGTH(title) >15, 
		concat(left(title,15),'...'),title) Title_2, 
	LENGTH(title) ByteLength,
	OCTET_LENGTH(title) ByteLength_test
from 
	sakila.film;

select first_name,last_name,concat(first_name,' ',last_name) from sakila.actor order by first_name;

select a.last_name,c.last_name,concat(a.last_name,' ',c.last_name) from actor a  left join customer c on a.last_name = c.last_name;

select first_name,last_name,concat_ws(' ,',first_name,last_name) from sakila.actor;


select count(*) from sakila.actor;

select count(*) from sakila.actor where first_name like 'B%';

select count(if(length<80,1,null)) 'short',count(if(length between 80 and 120,1,null)) 'Medium',count(if(length>120,1,null)) 'long' from film;

select title,char_length(title) 'Character Count',length(title) 'Latin1 (Bytes)',length(Convert(title using ucs2)) 'USC-2 (Bytes)',length(Convert(title using utf32)) 'UTF-32 (Bytes)'
from film;

show character set;

select  round(sum(length) / 60) as 'Total Hours' from film;




