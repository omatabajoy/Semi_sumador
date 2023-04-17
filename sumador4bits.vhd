library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity sumador4bits is
	port
	(
		-- Input ports
		A, B : in  std_logic_vector(3 downto 0);
		sum  : out std_logic_vector(3 downto 0);
      cout : out std_logic
	);
end sumador4bits;

architecture arch_sumador4bits of sumador4bits is

component semisumador
	port
	(
		A, B: in  std_logic;
		sum, cout	: out  std_logic

	);
end component;

component sumador 
	port
	(
		-- Input ports
		A, B ,Cin	: in  std_logic;
		sum, cout	: out std_logic

	);
end component;

signal c1, c2, c3 : std_logic;

begin

A0 : sumador port map (A(0),B(0),'0',sum(0),c1);
A1 : sumador port map (A(1),B(1),c1,sum(1),c2);
A2 : sumador port map (A(2),B(2),c2,sum(2),c3);
A3 : sumador port map (A(3),B(3),c3,sum(3),cout);	
	
end arch_sumador4bits;

