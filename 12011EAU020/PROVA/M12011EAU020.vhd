
ENTITY CIRCUITO IS
PORT ( E : IN BIT_VECTOR ( 3 DOWNTO 0) ;
		S : OUT BIT_VECTOR ( 3 DOWNTO 0));
	
END CIRCUITO ;

ARCHITECTURE CIR OF CIRCUITO IS
SIGNAL A, B : BIT_VECTOR ( 1 DOWNTO 0);
SIGNAL C : BIT_VECTOR (3 DOWNTO 0);

BEGIN 
-- CIRCUITO 1

WITH E SELECT
A(0) <= '1' WHEN "0000" ,
		'1' WHEN "0001" ,
		'1' WHEN "0010" ,
		'0' WHEN "0011" ,
		'1' WHEN "0100" ,
		'0' WHEN "0101" ,
		'1' WHEN "0110" ,
		'1' WHEN "0111" ,
		'1' WHEN "1000" ,
		'0' WHEN "1001" ,
		'0' WHEN "1010" ,
		'1' WHEN "1011" ,
		'0' WHEN "1100" ,
		'1' WHEN "1101" ,
		'1' WHEN "1110" ,
		'1' WHEN "1111" ;
		
WITH E SELECT
A(1) <= '1' WHEN "0000" ,
		'1' WHEN "0001" ,
		'1' WHEN "0010" ,
		'1' WHEN "0011" ,
		'0' WHEN "0100" ,
		'0' WHEN "0101" ,
		'0' WHEN "0110" ,
		'1' WHEN "0111" ,
		'1' WHEN "1000" ,
		'1' WHEN "1001" ,
		'1' WHEN "1010" ,
		'0' WHEN "1011" ,
		'1' WHEN "1100" ,
		'0' WHEN "1101" ,
		'1' WHEN "1110" ,
	    '0' WHEN "1111" ;

--PROJETO DO CIRCUITO MUX 4X1
WITH A SELECT 
B(1) <= A(0) WHEN "00" ,
	  A(1) WHEN "01" ,
	  A(2) WHEN "10" ,
	  A(3) WHEN "11" ;

--PROJETO DO B0
B(0) <= NOT (E(3) AND NOT(E(2)) AND E(1) AND E(0));


--CIRCUITO MULTIPLICADOR--

C <= A(1) & A(0) & B(1) & B(0);

WITH C SELECT

S <= "0000" WHEN "0000",
	 "0000" WHEN "0001",
	 "0000" WHEN "0010",
	 "0000" WHEN "0011",
	 "0000" WHEN "0100",
	 "0001" WHEN "0101",
	 "0010" WHEN "0110",
	 "0011" WHEN "0111",
	 "0000" WHEN "1000",
	 "0010" WHEN "1001",
	 "0100" WHEN "1010",
	 "0110" WHEN "1011",
	 "0000" WHEN "1100",
	 "0011" WHEN "1101",
	 "0110" WHEN "1110",
	 "1001" WHEN "1111";

END CIR ;
	