use ships;

/*Напишете заявка, която извежда цялата налична информация за всеки 
кораб, включително и данните за неговия клас. В резултата не трябва да 
се включват тези класове, които нямат кораби. */
select *
from ships s inner join classes c
on s.CLASS = c.CLASS

/*Повторете горната заявка, като този път включите в резултата и 
класовете, които нямат кораби, но съществуват кораби със същото име 
като тяхното. */
select *
from ships s right join classes c
on s.CLASS = c.CLASS

/*За всяка страна изведете имената на корабите, които никога не са 
участвали в битка. */
select country, name
from classes s inner join ships c
on s.CLASS = c.CLASS
where c.name not in (select ship from outcomes)
order by s.COUNTRY, C.NAME ASC

/*Намерете имената на всички кораби с поне 7 оръдия, пуснати на вода 
през 1916, но наречете резултатната колона Ship Name. */
select name as 'Ship Name'
from classes c inner join ships s
on c.CLASS = s.CLASS
where launched = 1916 and NUMGUNS>=7

/*Изведете имената на всички потънали в битка кораби, името и дата на 
провеждане на битките, в които те са потънали. Подредете резултата по 
име на битката. */
select ship, battle, b.date
from outcomes o inner join battles b
on o.battle = b.name
where o.result = 'sunk'
order by battle ASC

/*Намерете името, водоизместимостта и годината на пускане на вода на 
всички кораби, които имат същото име като техния клас. */
select name, displacement, launched
from classes c inner join ships s
on c.CLASS = s.CLASS
where s.name = s.CLASS

/*Намерете всички класове кораби, от които няма пуснат на вода нито един 
кораб. */
select c.class, type, country, numguns, bore ,displacement
from classes c left join ships s
on c.CLASS = s.CLASS
where LAUNCHED is null

/*Изведете името, водоизместимостта и броя оръдия на корабите, 
участвали в битката ‘North Atlantic’, а също и резултата от битката. */
select name, displacement, numguns, result
from ships s inner join classes c on s.class = c.class
			inner join outcomes o on s.name = o.ship
where o.battle = 'North Atlantic'

