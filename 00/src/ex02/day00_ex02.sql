select name, rating from pizzeria
group by rating, name
having rating >= 3.5 and rating <= 5
order by rating;

select name, rating from pizzeria
where rating between 3.5 and 5;