
ENTITY M12011EAU020 IS 
PORT (VAR01 : IN INTEGER RANGE 0 TO 7 ;
      S     : OUT BIT );

END M12011EAU020 ;

ARCHITECTURE CIR OF M12011EAU020 IS 

BEGIN 

WITH VAR01 SELECT 
S <= '1' WHEN 0,
     '0' WHEN 1,
     '1' WHEN 2,
     '1' WHEN 3,
     '1' WHEN 4,
     '0' WHEN 5,
     '1' WHEN 6,
     '0' WHEN 7;
END CIR ;