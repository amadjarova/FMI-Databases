use movies

/* Напишете заявка, която извежда името на продуцента и имената на 
филмите, продуцирани от продуцента на филма ‘Star Wars’. */
select title, name
from movie m1 INNER JOIN MOVIEEXEC m2
ON m1.PRODUCERC# = m2.CERT#
where m2.name = (select name
from movieexec m3 INNER JOIN movie m4
on m3.CERT# = m4.PRODUCERC#
where m4.title = 'Star wars');

/*Напишете заявка, която извежда имената на продуцентите на филмите, в 
които е участвал ‘Harrison Ford’. */
select distinct name 
from movieexec m1 INNER JOIN movie m2
on m1.cert# = m2.producerc#
where m2.title IN (select movietitle from starsin where starname='Harrison Ford');

/*Напишете заявка, която извежда името на студиото и имената на 
актьорите, участвали във филми, произведени от това студио, подредени 
по име на студио. */
select distinct studioname, starname
from movie m INNER JOIN starsin s
on m.title = s.movietitle
order by studioname ASC

/*Напишете заявка, която извежда имената на актьорите, участвали във 
филми на продуценти с най-големи нетни активи. */
select starname, networth,title
from movie inner join starsin
on movietitle = title
inner join movieexec 
on cert# = producerc#
where networth = (select top 1 networth from movieexec order by networth desc);

/*Напишете заявка, която извежда имената на актьорите, които не са 
участвали в нито един филм. */
select name, movietitle
from moviestar left join starsin
on starname = name
where movietitle is null
