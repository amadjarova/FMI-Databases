use ships;

/*Напишете заявка, която извежда имената на всички кораби без повторения, 
които са участвали в поне една битка и чиито имена започват с C или K. */
SELECT DISTINCT SHIP
FROM OUTCOMES
WHERE SHIP LIKE 'C%' OR SHIP LIKE 'K%'

/*Напишете заявка, която извежда име и държава на всички кораби, които 
никога не са потъвали в битка (може и да не са участвали). */
SELECT DISTINCT NAME,COUNTRY
FROM SHIPS S INNER JOIN CLASSES C ON S.CLASS = C.CLASS
			 LEFT JOIN OUTCOMES O ON S.NAME = O.SHIP
WHERE RESULT IS NULL OR RESULT = 'damaged' OR RESULT = 'ok'

/*Напишете заявка, която извежда държавата и броя на потъналите кораби за 
тази държава. Държави, които нямат кораби или имат кораб, но той не е 
участвал в битка, също да бъдат изведени. */
SELECT COUNTRY , COUNT(RESULT)
FROM SHIPS S RIGHT JOIN CLASSES C ON S.CLASS = C.CLASS
			 LEFT JOIN OUTCOMES O ON O.SHIP = S.NAME
WHERE RESULT = 'sunk' OR RESULT IS NULL
GROUP BY COUNTRY;

/* Напишете заявка, която извежда име на битките, които са по-мащабни (с 
повече участващи кораби) от битката при Guadalcanal. */
SELECT BATTLE
FROM OUTCOMES 
GROUP BY BATTLE
HAVING COUNT(SHIP) > (SELECT COUNT(SHIP) FROM OUTCOMES WHERE BATTLE = 'Guadalcanal' GROUP BY BATTLE)

/*Напишете заявка, която извежда име на битките, които са по-мащабни (с 
повече участващи страни) от битката при Surigao Strait. */
SELECT BATTLE
FROM SHIPS S INNER JOIN CLASSES C ON S.CLASS =C.CLASS
			 INNER JOIN OUTCOMES O ON O.SHIP = S.NAME
GROUP BY BATTLE
HAVING COUNT(COUNTRY) > (SELECT COUNT(COUNTRY) FROM SHIPS S INNER JOIN CLASSES C ON S.CLASS = C.CLASS
			 INNER JOIN OUTCOMES O ON O.SHIP = S.NAME WHERE BATTLE ='Surigao Strait' GROUP BY BATTLE)

/*6. Напишете заявка, която извежда имената на най-леките кораби с най-много 
оръдия. */
SELECT NAME, DISPLACEMENT, NUMGUNS
FROM (SELECT NAME, DISPLACEMENT, NUMGUNS
FROM SHIPS S INNER JOIN CLASSES C ON S.CLASS = C.CLASS
WHERE DISPLACEMENT = (SELECT TOP 1 DISPLACEMENT FROM SHIPS S INNER JOIN CLASSES C ON S.CLASS = C.CLASS ORDER BY DISPLACEMENT ASC)) T

