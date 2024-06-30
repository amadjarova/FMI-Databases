use movies;

/*Напишете заявка, която извежда заглавие и година на всички филми, които са 
по-дълги от 120 минути и са снимани преди 2000 г. Ако дължината на филма е 
неизвестна, заглавието и годината на този филм също да се изведат. */
SELECT TITLE, YEAR
FROM MOVIE
WHERE (LENGTH IS NULL OR LENGTH>120) AND YEAR <2000;

/*Напишете заявка, която извежда име и пол на всички актьори (мъже и жени), 
чието име започва с 'J' и са родени след 1948 година. Резултатът да бъде 
подреден по име в намаляващ ред. */
SELECT NAME, GENDER 
FROM MOVIESTAR
WHERE NAME LIKE 'J%' AND YEAR(BIRTHDATE) >1948
ORDER BY NAME DESC

/*Напишете заявка, която извежда име на студио и брой на актьорите, 
участвали във филми, които са създадени от това студио. */
SELECT STUDIONAME, COUNT(DISTINCT STARNAME) AS num_actors
FROM MOVIE AS M INNER JOIN STARSIN ON TITLE = MOVIETITLE
                INNER JOIN STUDIO ON NAME =STUDIONAME
GROUP BY STUDIONAME

/*Напишете заявка, която за всеки актьор извежда име на актьора и броя на 
филмите, в които актьорът е участвал. */
SELECT STARNAME, COUNT(MOVIETITLE) as num_movies
FROM STARSIN RIGHT JOIN MOVIESTAR ON STARNAME = NAME
GROUP BY STARNAME;

/*Напишете заявка, която за всяко студио извежда име на студиото и заглавие 
на филма, излязъл последно на екран за това студио. */
SELECT STUDIONAME, TITLE,YEAR
FROM MOVIE AS m
WHERE TITLE = (SELECT TOP 1 TITLE FROM MOVIE WHERE MOVIE.STUDIONAME = m.STUDIONAME order by year desc)

/*Напишете заявка, която извежда името на най-младия актьор (мъж). */
SELECT TOP 1 NAME
FROM MOVIESTAR
WHERE GENDER = 'M'
ORDER BY BIRTHDATE DESC

/*Напишете заявка, която извежда заглавие и година на филма, и брой на 
актьорите, участвали в този филм за тези филми с повече оТ двама актьори*/
SELECT TITLE, YEAR, COUNT(STARNAME) AS num_actors
FROM MOVIE INNER JOIN STARSIN ON TITLE = MOVIETITLE
GROUP BY TITLE,YEAR
HAVING COUNT(STARNAME)>2
