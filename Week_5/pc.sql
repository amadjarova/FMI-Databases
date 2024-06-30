use pc;

/*Напишете заявка, която извежда средната честота на персоналните компютри.*/
SELECT AVG(speed) AS AvgSpeed
FROM pc;

/*Напишете заявка, която извежда средния размер на екраните на лаптопите за 
всеки производител. */
SELECT MAKER, AVG(screen) AS AvgScreen
FROM laptop L INNER JOIN PRODUCT P
ON L.model = P.MODEL
GROUP BY P.maker;

/*Напишете заявка, която извежда средната честота на лаптопите с цена над 1000. */
SELECT AVG(speed)
FROM laptop
WHERE price>1000;

/*Напишете заявка, която извежда средната цена на персоналните компютри, 
произведени от производител ‘A’. */
SELECT AVG(PRICE)
FROM PC L INNER JOIN PRODUCT P ON L.model = P.MODEL
WHERE P.maker = 'A';

/*Напишете заявка, която извежда средната цена на персоналните компютри и 
лаптопите за производител ‘B’. */
SELECT AVG(PRICE) as AvgPrice
FROM ((SELECT PRICE
FROM PC L INNER JOIN PRODUCT P ON L.model = P.MODEL
WHERE P.maker = 'B')
UNION ALL
(SELECT PRICE
FROM LAPTOP L INNER JOIN PRODUCT P ON L.model = P.MODEL
WHERE P.maker = 'B'))t

/*Напишете заявка, която извежда средната цена на персоналните компютри 
според различните им честоти. */
SELECT SPEED, AVG(PRICE) AS AvgPrice
FROM PC
GROUP BY SPEED;

/*Напишете заявка, която извежда производителите, които са произвели поне 3 
различни персонални компютъра (с различен код). */
SELECT maker, COUNT(DISTINCT CODE) AS num_of_pc
FROM product L INNER JOIN pc P
ON L.model = P.model
GROUP BY L.maker 
HAVING COUNT(DISTINCT CODE) >=3;

/*Напишете заявка, която извежда производителите с най-висока цена на 
персонален компютър. */
SELECT maker, PRICE
FROM product L INNER JOIN pc P
on L.model = P.model
WHERE PRICE = (SELECT MAX(PRICE) FROM PC)

/*Напишете заявка, която извежда средната цена на персоналните компютри за 
всяка честота по-голяма от 800.*/
SELECT SPEED, AVG(PRICE) AS AvgPrice
FROM PC
GROUP BY SPEED
HAVING SPEED>=800

/* Напишете заявка, която извежда средния размер на диска на тези персонални 
компютри, произведени от производители, които произвеждат и принтери. 
Резултатът да се изведе за всеки отделен производител. */
SELECT maker, AVG(hd)
FROM product L INNER JOIN pc P
ON L.model = P.model
WHERE maker IN (SELECT maker FROM product L INNER JOIN printer P ON L.model = P.model)
GROUP BY maker;
