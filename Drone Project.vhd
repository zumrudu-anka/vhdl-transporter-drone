Library ieee;
use ieee.std_logic_1164.all;
entity drone is
	Generic(n:natural:= 5);
	port(	s:in std_logic;
		going:in std_logic_vector(1 downto 0);
		weight_to_carry,weight_to_send: in std_logic_vector(2 downto 0);
		reached:out std_logic);
end drone;

architecture behv of drone is
type cities is(A,B,C,D);
signal current_place: cities:=a;
begin
process(s)
begin
	if(rising_edge(s)) then
	case current_place is
		when A =>
			if(going="01") then
				if(weight_to_send>weight_to_carry) then
					reached<='0';
					current_place <= A;
				else
					reached<='1';
					current_place <= B;
				end if;
			elsif(going="10") then
				if(weight_to_send>weight_to_carry) then
					reached<='0';
					current_place<=A;
				else
					reached<='1';
					current_place<=C;
				end if;
			elsif(going="11") then
				if(weight_to_send>weight_to_carry) then
					reached<='0';
					current_place<=A;
				else
					reached<='1';
					current_place<=D;
				end if;
			end if;
		when B =>
			if(going="00") then
				if(weight_to_send>weight_to_carry) then
					reached<='0';
					current_place <= B;
				else
					reached<='1';
					current_place <= A;
				end if;
			elsif(going="10") then
				if(weight_to_send>weight_to_carry) then
					reached<='0';
					current_place<=B;
				else
					reached<='1';
					current_place<=C;
				end if;
			elsif(going="11") then
				if(weight_to_send>weight_to_carry) then
					reached<='0';
					current_place<=B;
				else
					reached<='1';
					current_place<=D;
				end if;
			end if;
		when C =>
			if(going="00") then
				if(weight_to_send>weight_to_carry) then
					reached<='0';
					current_place <= C;
				else
					reached<='1';
					current_place <= A;
				end if;
			elsif(going="01") then
				if(weight_to_send>weight_to_carry) then
					reached<='0';
					current_place<=C;
				else
					reached<='1';
					current_place<=B;
				end if;
			elsif(going="11") then
				if(weight_to_send>weight_to_carry) then
					reached<='0';
					current_place<=C;
				else
					reached<='1';
					current_place<=D;
				end if;
			end if;
		when D =>
			if(going="00") then
				if(weight_to_send>weight_to_carry) then
					reached<='0';
					current_place <= D;
				else
					reached<='1';
					current_place <= A;
				end if;
			elsif(going="01") then
				if(weight_to_send>weight_to_carry) then
					reached<='0';
					current_place<=D;
				else
					reached<='1';
					current_place<=B;
				end if;
			elsif(going="10") then
				if(weight_to_send>weight_to_carry) then
					reached<='0';
					current_place<=D;
				else
					reached<='1';
					current_place<=C;
				end if;
			end if;
end case;
end if;
end process;
end behv;