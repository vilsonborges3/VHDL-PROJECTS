--Vilson Borges - 12011EAU020
ENTITY CIRCUITO IS 
PORT (A : IN INTEGER RANGE 0 TO 15 ;
	  CLRN, CLKN: IN BIT;
	  Q: BUFFER BIT);
END CIRCUITO;

ARCHITECTURE CIR OF CIRCUITO IS

SIGNAL J, K : BIT;
BEGIN 

--CIRCUITO 01

	WITH A SELECT

	J<='0' WHEN 0,
	   '1' WHEN 1,
	   '1' WHEN 2,
	   '1' WHEN 3,
	   '0' WHEN 4,
	   '1' WHEN 5,
	   '0' WHEN 6,
	   '0' WHEN 7,
	   '1' WHEN 8,
	   '0' WHEN 9,
	   '1' WHEN 10,
	   '0' WHEN 11,
	   '1' WHEN 12,
	   '1' WHEN 13,
	   '1' WHEN 14,
	   '1' WHEN 15;
	   
	WITH A SELECT

	K<='0' WHEN 0,
	   '0' WHEN 1,
	   '0' WHEN 2,
	   '1' WHEN 3,
	   '0' WHEN 4,
	   '1' WHEN 5,
	   '1' WHEN 6,
	   '1' WHEN 7,
	   '0' WHEN 8,
	   '1' WHEN 9,
	   '1' WHEN 10,
	   '0' WHEN 11,
	   '1' WHEN 12,
	   '0' WHEN 13,
	   '0' WHEN 14,
	   '1' WHEN 15;
	   
	   PROCESS( CLRN, CLKN )
		BEGIN 
			IF CLRN = '0' THEN Q <= '0';
			ELSIF CLKN = '0' AND CLKN 'EVENT THEN 
				IF J = '1' AND K = '1' THEN Q <= NOT Q;
				ELSIF J = '1' AND K = '0' THEN Q <= '1';
				ELSIF J = '0' AND K = '1' THEN Q <= '0';
				END IF;
			END IF;
		END PROCESS;
		Q<=Q;
		
END CIR;   