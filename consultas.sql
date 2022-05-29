CREATE database steam;

# 10 mais jogados
SELECT name, average_playtime from steam_info
order by average_playtime desc limit 10; 

# 10 menos jogados
SELECT name, average_playtime from steam_info
order by average_playtime asc limit 10; 

# 10 mais avaliados
SELECT name, positive_ratings from steam_info
order by positive_ratings desc limit 10;

# 10 menos avaliados
SELECT name, positive_ratings from steam_info
order by positive_ratings asc limit 10;

# 10 mais avaliados dos jogos gratuitos
SELECT name, positive_ratings, price from steam_info
having price = 0
order by positive_ratings desc limit 10;

# 10 jogos mais caros
SELECT name, price from steam_info
order by price desc limit 10;

