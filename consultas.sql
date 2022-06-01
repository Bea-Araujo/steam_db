CREATE database steam;

# 10 mais jogados
SELECT name, average_playtime from steam_info
order by average_playtime desc limit 10; 

# 10 menos jogados
SELECT name, average_playtime from steam_info
order by average_playtime asc limit 10; 

# 10 melhor avaliados
SELECT 
	  appi, 
    name, 
    developer, 
    publisher,
    price,
    positive_ratings,
    negative_ratings,
    positive_ratings/(positive_ratings + NEGATIVE_RATINGS) * 100 as positive_percentage,
    negative_ratings/(positive_ratings + NEGATIVE_RATINGS) * 100 as negative_percentage
FROM projeto_final.steam2014_2016
WHERE negative_ratings > 100
ORDER BY positive_percentage DESC
Limit 10;

# 10 pior avaliados
SELECT 
	appi, 
    name, 
    developer, 
    publisher,
    price,
    positive_ratings,
    negative_ratings,
    positive_ratings/(positive_ratings + NEGATIVE_RATINGS) * 100 as positive_percentage,
    negative_ratings/(positive_ratings + NEGATIVE_RATINGS) * 100 as negative_percentage
FROM projeto_final.steam2014_2016
WHERE negative_ratings > 100
ORDER BY negative_percentage DESC
Limit 20;

# 10 mais avaliados dos jogos gratuitos
SELECT name, positive_ratings, price from steam_info
having price = 0
order by positive_ratings desc limit 10;

# 10 jogos mais caros
SELECT name, price from steam_info
order by price desc limit 10;

# 10 jogos pagos mais jogados
SELECT * FROM  projeto_final.steam
WHERE average_playtime>0
ORDER BY price desc
limit 10

# 10 jogos gratuitos mais jogados
SELECT * FROM  projeto_final.steam
WHERE price=0
ORDER BY average_playtime desc

# Dinheiro arrecadado pelas desenvolvedoras
SELECT
    table1.developer,
    round(sum(table1.est_owners * table1.price)) as est_money_made
FROM (
    SELECT 
        appi,
        name,
        developer,
        price,
        OWNERS,
        CASE
        WHEN OWNERS = '0-20000' THEN 20000/2
        WHEN OWNERS = '20000-50000' THEN (20000+50000)/2
        WHEN OWNERS = '50000-100000' THEN (50000+100000)/2
        WHEN OWNERS = '100000-200000' THEN (100000+200000)/2
        WHEN OWNERS = '200000-500000' THEN (200000+500000)/2
        WHEN OWNERS = '500000-1000000' THEN (500000+1000000)/2
        WHEN OWNERS = '1000000-2000000' THEN (1000000+2000000)/2
        WHEN OWNERS = '2000000-5000000' THEN (2000000+5000000)/2
        WHEN OWNERS = '5000000-10000000' THEN (5000000+10000000)/2
        WHEN OWNERS = '10000000-20000000' THEN (10000000+20000000)/2
        WHEN OWNERS = '20000000-50000000' THEN (20000000+50000000)/2
        WHEN OWNERS = '50000000-100000000' THEN (50000000+100000000)/2
        END AS est_owners
    FROM projeto_final.steam2014_2016
) table1
Group By table1.developer
ORDER BY est_money_made DESC
LIMIT 10
OFFSET 0;
