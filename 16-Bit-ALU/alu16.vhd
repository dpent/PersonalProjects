library ieee;
use ieee.std_logic_1164.all;


entity alu16 is
port( a: in std_logic_vector(15 downto 0);
		b: in std_logic_vector(15 downto 0);
		Result: out std_logic_vector(15 downto 0);
		Overflow: out std_logic;
		Opcode: in std_logic_vector(2 downto 0));
end alu16;

architecture structural of alu16 is

component alu1 is
port(a, b, cin, AInvert, BInvert: in std_logic;
		Operation: in std_logic_vector(1 downto 0);
		Result, cout: out std_logic);
end component;

-- carryin protou alu
signal Carryin: std_logic := '0'; 
-- simata gia ta ipoloipa carryout pou tha ginoun carryin epomenou alu i to teliko carryout
signal c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16: std_logic;
--Operation signal
signal Operation: std_logic_vector(1 downto 0);
--AInvert and Binvert signals
signal AInvert, BInvert: std_logic;

begin

with Opcode select Operation<=
	"00" when "000",
	"01" when "001",
	"10" when "010",
	"10" when "011",
	"00" when "100",
	"01" when "101",
	"11" when "110",
	"00" when "111";

with Opcode select AInvert<=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'0' when "011",
	'1' when "100",
	'1' when "101",
	'0' when "110",
	'0' when "111";
	
with Opcode select BInvert<=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'1' when "100",
	'1' when "101",
	'0' when "110",
	'0' when "111";
	
with Opcode select Carryin<=
	'0' when "000",
	'0' when "001",
	'0' when "010",
	'1' when "011",
	'0' when "100",
	'0' when "101",
	'0' when "110",
	'0' when "111";


ALU_0: alu1 port map(a => a(0), b => b(0), cin => Carryin, AInvert => AInvert, BInvert => BInvert, Operation => Operation, Result => Result(0), cout => c1);
ALU_1: alu1 port map(a => a(1), b => b(1), cin =>c1 , AInvert => AInvert, BInvert => BInvert, Operation => Operation, Result => Result(1), cout => c2);
ALU_2: alu1 port map(a => a(2), b => b(2), cin =>c2 , AInvert => AInvert, BInvert => BInvert, Operation => Operation, Result => Result(2), cout => c3);
ALU_3: alu1 port map(a => a(3), b => b(3), cin =>c3 , AInvert => AInvert, BInvert => BInvert, Operation => Operation, Result => Result(3), cout => c4);
ALU_4: alu1 port map(a => a(4), b => b(4), cin =>c4 , AInvert => AInvert, BInvert => BInvert, Operation => Operation, Result => Result(4), cout => c5);
ALU_5: alu1 port map(a => a(5), b => b(5), cin =>c5 , AInvert => AInvert, BInvert => BInvert, Operation => Operation, Result => Result(5), cout => c6);
ALU_6: alu1 port map(a => a(6), b => b(6), cin =>c6 , AInvert => AInvert, BInvert => BInvert, Operation => Operation, Result => Result(6), cout => c7);
ALU_7: alu1 port map(a => a(7), b => b(7), cin =>c7 , AInvert => AInvert, BInvert => BInvert, Operation => Operation, Result => Result(7), cout => c8);
ALU_8: alu1 port map(a => a(8), b => b(8), cin =>c8 , AInvert => AInvert, BInvert => BInvert, Operation => Operation, Result => Result(8), cout => c9);
ALU_9: alu1 port map(a => a(9), b => b(9), cin =>c1 , AInvert => AInvert, BInvert => BInvert, Operation => Operation, Result => Result(9), cout => c10);
ALU_10: alu1 port map(a => a(10), b => b(10), cin =>c1 , AInvert => AInvert, BInvert => BInvert, Operation => Operation, Result => Result(10), cout => c11);
ALU_11: alu1 port map(a => a(11), b => b(11), cin =>c1 , AInvert => AInvert, BInvert => BInvert, Operation => Operation, Result => Result(11), cout => c12);
ALU_12: alu1 port map(a => a(12), b => b(12), cin =>c1 , AInvert => AInvert, BInvert => BInvert, Operation => Operation, Result => Result(12), cout => c13);
ALU_13: alu1 port map(a => a(13), b => b(13), cin =>c1 , AInvert => AInvert, BInvert => BInvert, Operation => Operation, Result => Result(13), cout => c14);
ALU_14: alu1 port map(a => a(14), b => b(14), cin =>c1 , AInvert => AInvert, BInvert => BInvert, Operation => Operation, Result => Result(14), cout => c15);
ALU_15: alu1 port map(a => a(15), b => b(15), cin =>c1 , AInvert => AInvert, BInvert => BInvert, Operation => Operation, Result => Result(15), cout => c16);

Overflow<=c15 xor c16;

end structural;