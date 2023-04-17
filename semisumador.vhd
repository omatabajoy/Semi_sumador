library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity semisumador is
	port
	(
		A, B: in  std_logic;
		sum, cout	: out  std_logic

	);
end semisumador;


architecture arch_semisumador of semisumador is

begin
   sum <= A XOR B after 2ns;
	cout <= A AND B after 2ns;

end arch_semisumador;
