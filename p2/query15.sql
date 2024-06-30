SELECT J.name, J.surname, Temp.rated_sessions
FROM (SELECT M.assigned_jury_username, COUNT(*) AS "rated_sessions" -- gets how many matches each jury rated
		FROM MatchSession M
		GROUP BY M.assigned_jury_username) AS Temp, Jury AS J
WHERE J.username = Temp.assigned_jury_username AND Temp.rated_sessions = (SELECT MAX(T.rated_sessions)  -- gets maximum number of sessions rated by same jury
																			FROM 
																			(SELECT M.assigned_jury_username, COUNT(*) AS "rated_sessions"
																				FROM MatchSession M
																				GROUP BY M.assigned_jury_username) AS T)
-- gets how many matches each jury rated and returns the name and the surname of the jury rated maximum number of matches by matching the maximum number of sessions rated by a single jury from another table


