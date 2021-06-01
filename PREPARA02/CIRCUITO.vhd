ENTITY CIRCUITO IS 
PORT (INICIA, CLOCK, E: IN BIT;
      S: OUT BIT);
END CIRCUITO ;

ARCHITECTURE CIR1 OF CIRCUITO IS

COMPONENT FLIPFLOP
PORT (PRN, CLRN, CLKN, J, K: IN BIT ;
      Q : BUFFER BIT ) ;
END COMPONENT;

SIGNAL Q0, Q1, Q2, Y0, Y1, Y2, AUX1, Z0, Z1, Z2, Z3, Z4, Z5, Z6, Z7, D0, D1, D2, D3: BIT;	
SIGNAL VAR1: BIT_VECTOR(2 DOWNTO 0);
SIGNAL VAR2: BIT_VECTOR(1 DOWNTO 0);
BEGIN 

-- CONTADOR ASSINCRONO 
AUX1 <= (NOT ((NOT Q0) AND Q1 AND (NOT Q2))) AND INICIA;

FF0 : FLIPFLOP PORT MAP (PRN => AUX1, CLRN => '1', CLKN => CLOCK, J => '1', K=> '1', Q => Q0 );
FF1 : FLIPFLOP PORT MAP (PRN => AUX1, CLRN => '1', CLKN => NOT Q0, J=>'1', K => '1', Q => Q1 );
FF2 : FLIPFLOP PORT MAP (PRN => AUX1, CLRN => '1', CLKN => NOT Q1, J=>'1', K => '1', Q => Q2 );

-- CONTADOR SINCRONO
FF3 : FLIPFLOP PORT MAP (PRN => '1', CLRN => INICIA, CLKN => Q2, J=> Y1, K=> Y1, Q => Y0 );
FF4 : FLIPFLOP PORT MAP (PRN => '1', CLRN => INICIA, CLKN => Q2, J=> '1', K=> NOT Y0, Q => Y1 );
FF5 : FLIPFLOP PORT MAP (PRN => '1', CLRN => INICIA, CLKN => Q2, J=> Y1 AND (NOT Y0), K=> '1', Q => Y2 );

 
--PROJETO DO DEMUX
VAR1 <= Q0 & Q1 & Q2;
Z0 <= E WHEN VAR1 = "000" ELSE '1' ;
Z1 <= E WHEN VAR1 = "001" ELSE '1' ;
Z2 <= E WHEN VAR1 = "010" ELSE '1' ;
Z3 <= E WHEN VAR1 = "011" ELSE '1' ;
Z4 <= E WHEN VAR1 = "100" ELSE '1' ;
Z5 <= E WHEN VAR1 = "101" ELSE '1' ;
Z6 <= E WHEN VAR1 = "110" ELSE '1' ;
Z7 <= E WHEN VAR1 = "111" ELSE '1' ;

--PORTAS LOGICAS
D0 <= NOT(Z0 AND Z1  AND Z2) ;
D1 <= Z3 XNOR Z4;
D2 <= Z5 OR (NOT Z6);
D3 <= NOT Z7;

--PROJETO MUX 4X1
WITH Y1 & Y0 SELECT
S <= D0 WHEN "00" ,
     D1 WHEN "01" ,
     D2 WHEN "10" ,
     D3 WHEN "11" ;
END CIR1;




-- PROJETO DO FLIP FLOP JK MESTRE-ESCRAVO COM PRESET E CLEAR.

ENTITY FLIPFLOP IS
PORT ( PRN, CLRN, CLKN, J, K : IN BIT ;
       Q : BUFFER BIT ) ;
END FLIPFLOP ;

ARCHITECTURE CIR OF FLIPFLOP IS
BEGIN
	PROCESS ( PRN, CLRN, CLKN )
	BEGIN
		IF     PRN = '0' THEN Q <= '1' ;
		ELSIF CLRN = '0' THEN Q <= '0' ;
		ELSIF CLKN = '0' AND CLKN 'EVENT THEN 
			IF    J = '1' AND K = '1' THEN Q <= NOT Q ;
			ELSIF J = '1' AND K = '0' THEN Q <= '1' ;
			ELSIF J = '0' AND K = '1' THEN Q <= '0' ;
            END IF;
        END IF ;
    END PROCESS ;
    Q <= Q ;

END CIR ;