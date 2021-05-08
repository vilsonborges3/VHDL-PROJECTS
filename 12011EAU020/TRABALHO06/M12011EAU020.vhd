--Vilson Borges - 12011EAU020
ENTITY M12011EAU020 IS 
PORT (A : IN INTEGER RANGE 0 TO 7 ;
		Q: BUFFER BIT);
END M12011EAU020;

ARCHITECTURE CIR OF M12011EAU020 IS
SIGNAL S, R : BIT;
BEGIN 
--CIRCUITO 01
 
	WITH A SELECT 
	S<= '0' WHEN 0,
		'0' WHEN 1,
		'1' WHEN 2,
		'1' WHEN 3,
		'0' WHEN 4,
		'0' WHEN 5,
		'0' WHEN 6,
		'0' WHEN 7;
		
	WITH A SELECT 
	R<= '1' WHEN 0,
		'0' WHEN 1,
		'0' WHEN 2,
		'0' WHEN 3,
		'0' WHEN 4,
		'1' WHEN 5,
		'1' WHEN 6,
		'0' WHEN 7;
-- FLIP-FLOP RS
	PROCESS (S, R)
		BEGIN
			IF S = '1' THEN Q <= '1';
			ELSIF R = '1' THEN Q <= '0';
			ELSE Q <= Q;
			END IF;
	END PROCESS;
END CIR; 