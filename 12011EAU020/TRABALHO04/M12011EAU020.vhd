

ENTITY M12011EAU020 IS 
PORT (VAR01 : IN BIT_VECTOR ( 4 DOWNTO 0 );
      S     : OUT BIT );
END M12011EAU020 ;

ARCHITECTURE CIR OF M12011EAU020 IS 

BEGIN 

WITH VAR01 SELECT

S <= '0' WHEN "00000",
     '1' WHEN "00001",
     '1' WHEN "00010",
     '0' WHEN "00011",
     '1' WHEN "00100",
     '0' WHEN "00101",
     '0' WHEN "00110",
     '1' WHEN "00111",
     '1' WHEN "01000",
     '1' WHEN "01001",
     '0' WHEN "01010",
     '0' WHEN "01011",
     '1' WHEN "01100",
     '1' WHEN "01101",
     '1' WHEN "01110",
     '0' WHEN "01111",
     '0' WHEN "10000",
     '0' WHEN "10001",
     '1' WHEN "10010",
     '0' WHEN "10011",
     '0' WHEN "10100",
     '0' WHEN "10101",
     '0' WHEN "10110",
     '0' WHEN "10111",
     '1' WHEN "11000",
     '1' WHEN "11001",
     '0' WHEN "11010",
     '1' WHEN "11011",
     '1' WHEN "11100",
     '0' WHEN "11101",
     '1' WHEN "11110",
     '0' WHEN "11111";
  
END CIR;