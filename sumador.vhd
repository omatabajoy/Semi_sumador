library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity sumador is
	port
	(
		-- Input ports
		A, B ,Cin	: in  std_logic;
		sum, cout	: out std_logic

	);
end sumador;

architecture arch_sumador of sumador is

component semisumador
	port
	(
		A, B: in  std_logic;
		sum, cout	: out  std_logic

	);
end component;

signal Sem1_sum, Sem1_cout, Sem2_cout : std_logic;

begin

Sem1 : semisumador port map (A, B, Sem1_sum, Sem1_cout );

Sem2 : semisumador port map (Sem1_sum, Cin, Sum, Sem2_cout );

cout <= 	Sem1_cout or Sem2_cout after 2ns;
	
	
end arch_sumador;
