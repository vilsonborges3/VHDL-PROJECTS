-- PROJETO DE UM MUX 4X1

ENTITY M12011EAU020 IS
PORT ( D0, D1, D2, D3 : IN BIT ;
       VAR : IN BIT_VECTOR ( 1 DOWNTO 0 );
       S : OUT BIT);
END M12011EAU020 ;

ARCHITECTURE CIR OF M12011EAU020 IS 

BEGIN 

WITH VAR SELECT 

S <= D0 WHEN "00",
     D1 WHEN "01",
     D2 WHEN "10",
     D3 WHEN "11";
END CIR;