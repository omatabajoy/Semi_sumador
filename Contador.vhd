LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY contador is
port (
clk  : IN std_logic;
reset : IN std_logic;
enable : IN std_logic;
d,e : OUT std_logic_vector(6 downto 0)
);
END contador;

Architecture arch_1 of contador is 

signal cnt : unsigned (4 downto 0);
signal UNIT : unsigned (4 downto 0);
signal DEC : unsigned (4 downto 0);

begin
process (cnt) begin
UNIT <= cnt mod 10;
case UNIT is 
when "00000" =>d<= "0000001";
when "00001" =>d<= "1001111";
when "00010" =>d<= "0010010";
when "00011" =>d<= "0000110";
when "00100" =>d<= "1001100";
when "00101" =>d<= "0100100";
when "00110" =>d<= "0100000";
when "00111" =>d<= "0001111";
when "01000" =>d<= "0000000";
when "01001" =>d<= "0000100";
when others  =>d<= "1111111";
end case;
end process;

process (cnt) begin
DEC <= cnt / 10;
case DEC is
when "00001" =>e<= "1001111";
when "00010" =>e<= "0010010";
when "00011" =>e<= "0000110";
when others  =>e<= "1111111";
end case;
end process;

pSeq : process (clk,reset)is
begin
if reset = '1' then
cnt<=(others =>'0');
elsif clk'event and clk='1' then 
if enable= '1' then 
cnt <= cnt + 1;
End if;
End if;
End process;

End arch_1;
