library ieee;
use ieee.std_logic_1164.all;

entity xor_gate2 is
	port(a, b: in std_logic;
		  c: out std_logic);
end xor_gate2;


architecture behavioral of xor_gate2 is
begin
	c<= a xor b;
end behavioral;