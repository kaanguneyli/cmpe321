SELECT P.name, P.surname
FROM Player P
WHERE P.height > (SELECT P1.height  -- gets Ebrar's height
					FROM Player P1
					WHERE TRIM(P1.name) = "Ebrar" AND TRIM(P1.surname) ="Karakurt") 
                    AND RIGHT(P.date_of_birth,4) = (SELECT RIGHT(P2.date_of_birth,4) -- gets Ebrar's birth year
												FROM Player P2
												WHERE P2.name = 'Ebrar ' AND P2.surname = 'Karakurt') -- gets players who born at the same year as Ebrar and taller than Ebrar
ORDER BY P.surname 	ASC;