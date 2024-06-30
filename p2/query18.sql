# match the coaches with the stadium id's
# then group by username and id in order to be able to how many stadiums have each coach visited
# then return the result with the restriction
# in the where clause we find the number of distinct stadium id's (number of stadiums) and return the coaches who have the same number at played_count field

select C1.name, C1.surname, CC.directed_stadium_count 
from coach C1, 
	(select CS.username, count(*) as directed_stadium_count from
		(select C.username, M.stadium_id
		from matchsession M, team T, coach C
		where
			M.team_ID = T.team_ID and
			C.username = T.coach_username
		group by C.username, M.stadium_id) as CS
	group by CS.username) as CC
where 
	C1.username = CC.username and
    CC.directed_stadium_count = (select count(distinct(stadium_ID)) from matchsession)