library ieee;
use ieee.std_logic_1164.all;
-- Top level entity to test the design
entity DUT is
		port(input_vector: in std_logic_vector(33 downto 0); -- 34 bit input vector ( s1,s0, A,B)
       	output_vector: out std_logic_vector(17 downto 0));-- 18 bit output(Z,c_out, 16 bit computation)
end entity;

architecture DutWrap of DUT is
   component ALU_16bit is
      port(s1,s0:in std_logic;
      A, B: in std_logic_vector(15 downto 0);
      Y: out std_logic_vector(15 downto 0);
       C_out,Z: out std_logic);
   end component ALU_16bit;
	
begin

   design_instance: ALU_16bit
			port map (
					-- order of inputs  s1, s0, A, B
					B   => input_vector(15 downto 0 ),
					A   => input_vector(31 downto 16 ),
               s0 => input_vector(32),
					s1 => input_vector(33),
					--order of output zero bit, carry, computation
					Y => output_vector(15 downto 0),
					C_out => output_vector(16),
					Z => output_vector(17));

end DutWrap;

