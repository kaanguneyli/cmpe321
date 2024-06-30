SELECT Temp1.stadium_name, C1.name, C1.surname, Temp1.directed_count
FROM(
	-- gets maximum number of matches directed in a given stadium by a single jury
	SELECT Temp.stadium_name,MAX(Temp.directed_count) AS 'directed_count'
	FROM (
        -- gets number of matches directed by a jury at a given stadium
		SELECT M.stadium_name, C.username, COUNT(C.username) AS 'directed_count'
		FROM Coach C, MatchSession M, Team T
		WHERE C.username = T.coach_username AND M.team_ID = T.team_ID
		GROUP BY M.stadium_name, C.username
		) AS Temp
	GROUP BY Temp.stadium_name) AS Temp1,
	(
    -- gets number of matches directed by a jury at a given stadium
	SELECT M.stadium_name, C.username, COUNT(C.username) AS 'directed_count'
	FROM Coach C, MatchSession M, Team T
	WHERE C.username = T.coach_username AND M.team_ID = T.team_ID
	GROUP BY M.stadium_name, C.username
	) AS Temp2,
	Coach C1
WHERE Temp1.stadium_name = Temp2.stadium_name AND Temp1.directed_count = Temp2.directed_count AND C1.username = Temp2.username;

-- gets coach directed most matches for a given staduim by combining the maximum number of matches directed in a given stadium by a single jury and the number of matches directed by a jury at a given stadium
