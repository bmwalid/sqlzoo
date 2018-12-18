/*
6/ 
Obtain the cast list for 'Casablanca'.

what is a cast list?
Use movieid=11768, (or whatever value you got from the previous question)
*/
select name from casting join actor on id=actorid where movieid=(
select id from movie where title = 'Casablanca'
)


/*
8/
List the films in which 'Harrison Ford' has appeared
*/
select title from casting,movie

where casting.actorid = (select id from actor where name = 'Harrison Ford') AND movieid=id

--harder questions

/*
Which were the busiest years for 'John Travolta', show the year and the number 
of movies he made each year for any year in which he made more than 2 movies.
*/
select yr,count(*) from casting join movie on movieid=id where actorid = 
(select id from actor where name = 'John Travolta') 
group by yr having count(*) > 2

/*
13
List the film title and the leading actor for all of the films 'Julie Andrews' played in
*/
select movie.title, actor.name from 
casting join actor on actorid = actor.id join movie on movieid=movie.id where 
movieid in  (select movieid from casting join movie on movieid=id where actorid = 
(select id from actor where name = 'Julie Andrews' ))
and ord = 1 

/*
14
Obtain a list, in alphabetical order, of actors who've had at least 30 starring roles.

*/
select name from 
(select name, count(*) as nbr_appearances from casting join actor on actorid = id 
where ord = 1 group by name having count(*) >= 30 order by name ) as temp

/*
14
List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
*/
select title, count(*) from casting,movie where (movieid=id) and 
( yr = 1978 ) group by title order by count(distinct actorid) DESC,title

/*
15
List all the people who have worked with 'Art Garfunkel'.*/
select name from casting,actor where actorid = id and movieid in
(select movieid from actor,casting where actorid = id and name = 'Art Garfunkel') 
and not name = 'Art Garfunkel'
