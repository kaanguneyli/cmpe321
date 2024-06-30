# match the coaches with their number of games
# return the ones with count more than 1
# two queries to be able to use the count column

select D.name, D.surname from
	(select C.name, C.surname, count(*) as count
	from matchsession M, team T, coach C
	where 
		T.team_ID = M.team_ID and 
		C.username = T.coach_username
	group by C.username) as D
where count > 1
order by D.surname desc