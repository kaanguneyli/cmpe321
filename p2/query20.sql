# find the numbers that players appear in the playerpositions by grouping by username and position so we eliminate duplicates
# use the case property to create the more_than_one columns

select P.name, P.surname, 
	case when count(*) > 1 then "TRUE" else "FALSE" end as more_than_one
from
	(select P.username, PP.position
	from player P, playerpositions PP 
	where P.username = PP.username
    group by P.username, PP.position) as A
inner join player P on A.username = P.username
group by A.username
order by P.name asc