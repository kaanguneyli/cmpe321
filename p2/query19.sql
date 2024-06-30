SELECT DISTINCT P.name, P.surname
FROM SessionSquads As SS, Player P
WHERE SS.session_ID IN( 
	-- matches played in gd voleybol arena
	SELECT M.session_ID
	FROM MatchSession M
	WHERE M.stadium_name='GD Voleybol Arena'
	) AND 
    -- libero as position
    SS.position_ID IN(SELECT P.position_ID FROM Position P WHERE P.position_name = "Libero")
    AND P.username = SS.played_player_username;
-- it gets the player name and surname who played as libero in matches occured in gd voleybol arena 