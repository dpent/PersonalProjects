library ieee;
use ieee.std_logic_1164.all;

entity mux_4to1 is
port(a,b,c,d: in std_logic;
		g1,g2: in std_logic;
		z: out std_logic);
end mux_4to1;

architecture behavioral of mux_4to1 is
begin 
process(a,b,c,d,g1,g2) is
begin
	if(g1='0' and g2='0') then
		z<=a;
	elsif(g1='1' and g2='0') then
		z<=b;
	elsif(g1='0' and g2='1') then
		z<=c;
	else
		z<=d;
	end if;
end process;
end behavioral;