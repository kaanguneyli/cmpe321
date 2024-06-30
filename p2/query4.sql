# find the max rating and return the session with the same rating
# use the aggreagate function in where clause to be able to reach non-aggregated information
SELECT assigned_jury_username, stadium_name 
FROM matchsession M2
WHERE M2.rating =
	(SELECT MAX(rating) FROM matchsession M1)
ORDER BY assigned_jury_username DESC;