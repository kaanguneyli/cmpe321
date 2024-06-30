SELECT *
FROM MatchSession M
WHERE M.rating = (SELECT MIN(M1.rating)
					FROM MatchSession M1) -- gets the match session with the minimum rating