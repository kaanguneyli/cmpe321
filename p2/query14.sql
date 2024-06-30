# convert date's data type to data
# apply the filters
# two queries to be able to use the date2

select A.session_ID, A.name, A.surname from
	(select M.session_ID, C.name, C.surname, str_to_date(date, "%d.%m.%Y") as date2
    from matchsession M, team T, coach C
    where 
		M.team_ID = T.team_ID and
        C.username = T.coach_username and
        C.name != "Ferhat" and
        C.surname != "Akbaş") as A
where A.date2 > "2023-12-31"
order by session_ID asc