SELECT Maxs.team_name, T2.name, T2.surname, Maxs.day_count
FROM (
	SELECT T2.team_name, X.name, X.surname, X.day_count, T2.coach_username
	FROM Team T2
	LEFT OUTER JOIN (SELECT T.team_ID,C.name,C.surname, DATEDIFF(STR_TO_DATE(T.contract_finish,'%d.%m.%Y'),STR_TO_DATE(T.contract_start,'%d.%m.%Y')) AS day_count
	FROM Team T, Coach C
	WHERE (C.username = T.coach_username)) AS X ON T2.team_ID = X.team_ID  
	) AS T2 -- T2 contains duration of each coach's contract time
RIGHT OUTER JOIN(
		SELECT T2.team_name,MAX(X.day_count) AS day_count
		FROM Team T2
		LEFT OUTER JOIN (SELECT T.team_ID,C.name,C.surname, DATEDIFF(STR_TO_DATE(T.contract_finish,'%d.%m.%Y'),STR_TO_DATE(T.contract_start,'%d.%m.%Y')) AS day_count
		FROM Team T, Coach C
		WHERE (C.username = T.coach_username AND 
        -- In order to have a valid coach and duration for a team, all of the matches of a team must have rating greater than 4.7 
			(T.team_ID NOT IN(SELECT M.team_ID
								FROM MatchSession M
								WHERE M.rating<=4.7)  
											))) AS X ON T2.team_ID = X.team_ID 
		GROUP BY (T2.team_name)
    ) AS Maxs ON (T2.team_name = Maxs.team_name  AND T2.day_count = Maxs.day_count AND 									
															T2.coach_username NOT IN(SELECT T1.coach_username
															FROM Team T1
															WHERE T1.team_ID IN(SELECT M1.team_ID
																				FROM MatchSession M1
																				WHERE M1.rating<=4.7))
    ) -- Maxs contains the maximum day count for each team name
      
-- T2 contains team name, coach name, surname and length of the coach's contract. Maxs contains team name and the longest contract length pair if there is a contract satisfying the requirements else team name and null pair
-- When these two tables are merged we get longest contract length for each team with coach directed no match with less than 4.7 rating
                                        
