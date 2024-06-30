# match team names with coach names
# add the count of players for each team id

SELECT T.team_name, C.name AS coach_name, C.surname AS coach_surname, 
	ifnull((SELECT COUNT(*) FROM playerteams P WHERE T.team_ID = P.team GROUP BY team), 0) AS player_count
FROM team T, coach C
WHERE T.coach_username = C.username;