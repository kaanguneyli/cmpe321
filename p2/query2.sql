# select all match sessions and turn the date's type to date
# format the date and apply the restriction
# reason to use two queries is to be able to make use of M.date

SELECT M.session_ID, M.assigned_jury_username, M.rating, date_format(M.date, "%d/%m/%Y") as date
FROM 
	(SELECT session_ID, assigned_jury_username, rating, str_to_date(date, '%d.%m.%Y') as date
	FROM matchsession) M
WHERE M.date < '2024-01-01'
ORDER BY date ASC;