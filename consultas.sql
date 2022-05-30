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

