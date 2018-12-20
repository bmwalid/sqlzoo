/*
1
select name from world where population > (select population from world where name like '%russia%')
*/
select name from world where population > (select population from world where name like '%russia%')


/*
4
Which country has a population that is more than Canada but less than Poland? Show the name and the population.
*/
select name,population from world where population between (select population from world where name='Canada')+1
 and 
(select population from world where name='Poland')-1


/*
5
Germany (population 80 million) has the largest population of the countries in Europe. 
Austria (population 8.5 million) has 11% of the population of Germany.
Show the name and the population of each country in Europe. Show the population as 
a percentage of the population of Germany.
*/
select name , concat(round((population/(select population from world where name ='Germany')*100)),'%') 
from world where continent = 'europe'



/*
6
select name from world where gdp > all(select gdp from world where continent='europe' and gdp is not NULL)
*/
select name from world where gdp > all(select gdp from world where continent='europe' and gdp is not NULL)

/*
7
Find the largest country (by area) in each continent, show the continent, the name and the area: 
*/
select w_a.continent, w_a.name, w_a.area from world w_a join 
(select w_a.continent, max(w_a.area) as max_area from 
world w_a group by w_a.continent) w_b on (w_a.area=w_b.max_area)


/*
8
List each continent and the name of the country that comes first alphabetically.
*/
select continent,name from 
world as outer_world
where name <= ALL(
select name from world inner_world where inner_world.continent = outer_world.continent)


/*
9
Find the continents where all countries have a population <= 25000000. 
Then find the names of the countries associated with these continents. 
Show name, continent and population
*/
select name,continent, population  from world outer_world where 25000000 >= 
all(select population from world inner_world where outer_world.continent=inner_world.continent) 


/*
10
Some countries have populations more than three times that of any of
their neighbours (in the same continent). Give the countries and continents.
*/
select name,continent from world outer_world  where 
population > 
all
 (select 3*population from world inner_world where 
inner_world.continent= outer_world.continent and 
outer_world.name != inner_world.name)
