# find the average ratings of each coach per year 
# join the same table with the addition of max aggreagate grouped by year
# retireve the name and surname from the coach table

select C.name, C.surname, R2.year2 as year, R2.rating2 as average_rating  
from coach C,
	(select T.coach_username, avg(M.rating) as rating2, substring(M.date, 7) as year2
	from matchsession M, team T
    where T.team_ID = M.team_ID
	group by year2, T.coach_username) as R2
inner join (select max(R.rating) as rating1, R.year as year1 from
				(select T.coach_username, avg(M.rating) as rating, substring(M.date, 7) as year
				from matchsession M, team T
				where 
					T.team_ID = M.team_ID
				group by year, T.coach_username) as R
			group by year) as YR on (YR.rating1 = R2.rating2 and YR.year1 = R2.year2)
where C.username = R2.coach_username
order by year asc