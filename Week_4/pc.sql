use pc;

/*Напишете заявка, която извежда производител, модел и тип на продукт 
за тези производители, за които съответният продукт не се продава 
(няма го в таблиците PC, Laptop или Printer) */
select maker, p.model, p.type
from product p left join laptop l on p.model = l.model
				left join pc n on p.model = n.model
				left join printer s on p.model = s.model
where l.code is null and n.code is null and s.code is null;

/*Намерете всички производители, които правят както лаптопи, така и 
принтери. */
(select maker 
from product p inner join laptop l on p.model = l.model
where maker is not null) INTERSECT
       (select maker 
from product p inner join printer s on p.model = s.model
where maker is not null)

/*Намерете размерите на тези твърди дискове, които се появяват в два 
или повече модела лаптопи. */
select distinct l1.hd 
from laptop l1, laptop l2
where l1.hd = l2.hd and l1.model != l2.model;

/*Намерете всички модели персонални компютри, които нямат регистриран 
производител. */
select p1.model
from product p1 left join pc p2
on p1.model = p2.model
where maker is null;
