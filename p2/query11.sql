SELECT M.session_ID, C.name, C.surname, M.stadium_name, M.stadium_country, T.team_name
FROM MatchSession M, Coach C, Team T
WHERE T.team_ID = M.team_ID AND C.username = T.coach_username AND C.username = 'd_santarelli' AND M.stadium_country != 'UK'
ORDER BY session_ID ASC;

-- gets match sessions directed by danielle santarelli and not played in uk by doing comparisons in where section of the query
