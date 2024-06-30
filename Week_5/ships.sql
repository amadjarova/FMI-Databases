use ships;

/*Напишете заявка, която извежда броя на класовете бойни кораби. */
select count(class) as count_classes
from classes
where type = 'bb'
group by type;

/*Напишете заявка, която извежда средния брой оръдия за всеки клас боен кораб. */
select class, AVG(NUMGUNS) as AvgGunsCount
from CLASSES
where type = 'bb'
group by class;

/*Напишете заявка, която извежда средния брой оръдия за всички бойни кораби. */
select AVG(NUMGUNS) as AvgGunsCount
from CLASSES
where type = 'bb'
group by type;

/*Напишете заявка, която извежда за всеки клас първата и последната година, в 
която кораб от съответния клас е пуснат на вода. */
select class, Min(launched), Max(launched)
from ships
group by class

/*Напишете заявка, която извежда броя на корабите, потънали в битка според 
класа. */
select class, count(ship) as num_ships
from ships inner join outcomes
on name = ship
where result = 'sunk'
group by class

/*Напишете заявка, която извежда броя на корабите, потънали в битка според 
класа, за тези класове с повече от 2 кораба. */
select class, count(name) as num_ships
from ships inner join outcomes
on name = ship
where result = 'sunk' and class in (select class from ships group by class having count(name)>2 )
group by class

/* Напишете заявка, която извежда средния калибър на оръдията на корабите за 
всяка страна. */
select country, avg(bore) as avg_bore
from classes c join ships s on s.class = c.class
group by country
