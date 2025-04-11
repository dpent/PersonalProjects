library ieee;
use ieee.std_logic_1164.all;


entity fullAdder is
	port(a, b, cin: in std_logic;
		Sum, cout: out std_logic);
end fullAdder;


architecture behavioral of fullAdder is
begin
	Sum<=a xor b xor cin;
	cout<=((a xor b) and cin) or (a and b);
end behavioral;