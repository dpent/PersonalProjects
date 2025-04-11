library ieee;
use ieee.std_logic_1164.all;


entity or_gate2 is
	port(a, b: in std_logic;
		  c: out std_logic);
end or_gate2;


architecture behavioral of or_gate2 is
begin
	c<= a or b;
end behavioral;