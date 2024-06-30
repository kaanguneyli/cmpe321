# convert the data type of contract start and finish to date 
# match the coaches with the teams and apply the restrictions

select CTV.name, CTV.surname, CTV.channel_name, DATE_FORMAT(CTV.contract_start, '%d.%m.%Y') AS contract_start, DATE_FORMAT(CTV.contract_finish, '%d.%m.%Y') AS contract_finish
	from (select C.name, C.surname, T.channel_name, 
		str_to_date(T.contract_start, "%d.%m.%Y") as contract_start, 
		str_to_date(T.contract_finish, "%d.%m.%Y") as contract_finish
	from team T, coach C
	where 
		T.channel_name = 'Digiturk' and 
		C.username = T.coach_username) as CTV
where
	CTV.contract_start <= "2024-09-02" and
    CTV.contract_finish >= "2025-12-31"
order by name asc