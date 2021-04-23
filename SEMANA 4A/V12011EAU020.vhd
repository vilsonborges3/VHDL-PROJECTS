-- PROJETO DE UM CIRCUITO COMBINACIONAL EM VHDL UTILIZANDO VARIAVEIS AUXILIARES

ENTITY V12011EAU020 IS
PORT (A, B, C, D : IN BIT ;
      S          : OUT BIT);
      
END V12011EAU020 ;

ARCHITECTURE CIRC22 OF V12011EAU020 IS 

SIGNAL S1, S2, S3 : BIT ;

BEGIN 

S <= S2 XOR S3;
S3 <= C AND D;
S2 <= S1 OR (NOT C);
S1 <= NOT (A AND B AND C);

END CIRC22 ;