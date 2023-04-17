library IEEE;
use IEEE.std_logic_1164.all;

entity BCD7SEG is port
(

		A,B,C,D	: in  std_logic;

		F	: out std_logic_vector(6 downto 0)
	);

end 	BCD7SEG;


architecture Arquitecto of BCD7SEG is

	Signal ABCD : std_logic_vector (3 downto 0);
	

begin
		ABCD <= A & B & C & D;
		with (ABCD) select
		F<="0000001" when "0000",
			"1001111" when "0001",
			"0010010" when "0010",
			"0000110" when "0011",
			"1001100" when "0100",
			"0100100" when "0101",
			"0100000" when "0110",
			"0001111" when "0111",
			"0000000" when "1000",
			"0001100" when "1001",
			"1111111" when others;

end Arquitecto;