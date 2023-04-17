library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity Sumador7S is
	port
	(
		A	: in  std_logic_vector(3 downto 0);
		B	: in std_logic_vector(3 downto 0);
		D1,D2	: out std_logic_vector(6 downto 0);
		cout : out std_logic

	);
end Sumador7S;


architecture arch_Sumador7S of Sumador7S is

 component sumador4bits 
	port
	(
		-- Input ports
		A, B : in  std_logic_vector(3 downto 0);
		sum  : out std_logic_vector(3 downto 0);
      cout : out std_logic
	);
end component;

    component BCD7SEG 
	 port
(

		A,B,C,D	: in  std_logic;

		F	: out std_logic_vector(6 downto 0)
	);

end component;

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

component Comparador
    port (
        num1 : in std_logic_vector(3 downto 0);
        num2 : in std_logic_vector(3 downto 0);
        display1: out std_logic_vector(6 downto 0);
        display2: out std_logic_vector(6 downto 0)
    );
end component;

signal sum  : std_logic_vector(3 downto 0);

begin

sum1 : sumador4bits port map (A,B,sum,cout);

sum2 : comparador port map (A,B,D1,D2);


	
end arch_Sumador7S;
