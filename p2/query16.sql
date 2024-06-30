# group by coach username and take the averages then sort

select C.name, C.surname, avg(M.rating) as average_rating
from matchsession M, team T, coach C
where M.team_ID = T.team_ID and
	T.coach_username = C.username
group by coach_username
order by name desc