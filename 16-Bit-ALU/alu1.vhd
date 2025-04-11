library IEEE;
use IEEE.STD_LOGIC_1164.all;


Entity alu1 is
port( a, b, cin, AInvert, BInvert: in std_logic;
		Operation: in std_logic_vector(1 downto 0);
		Result, cout: out std_logic);
end alu1;

architecture structural of alu1 is
  
component fullAdder is
port(a, b, cin: in std_logic;
	  Sum, cout: out std_logic);
end component;

component or_gate2 is
port(a, b: in std_logic;
	  c: out std_logic);
end component;

component and_gate2 is
port(a, b: in std_logic;
	  c: out std_logic);
end component;

component xor_gate2 is
port(a, b: in std_logic;
	  c: out std_logic);
end component;

component mux_4to1 is
port(a,b,c,d: in std_logic;
		g1,g2: in std_logic;
		z: out std_logic);
end component;

--gate inputs gia to mux4-1
signal r0, r1, r2, r3: std_logic;
--inputs(metavlites pou xrismopoiountai gia tin ilopoiisi tou alu)
signal tempa, tempb: std_logic;

begin

with AInvert select tempa<=
	a when '0',
	not a when '1';
	
with BInvert select tempb<=
	b when '0',
	not b when '1';


	u0: and_gate2 port map(a => tempa, b => tempb, c => r0);
	u1: or_gate2 port map(a => tempa, b => tempb, c => r1);
	u2: fullAdder port map(a => tempa, b => tempb, cin => cin, Sum => r2, cout => cout);
	u3: xor_gate2 port map(a => tempa, b => tempb, c => r3);



	u4: mux_4to1 port map(a=>r0, b=>r1, c=>r2, d=>r3, g1=>Operation(0), g2=>Operation(1), z=>Result);


end structural;