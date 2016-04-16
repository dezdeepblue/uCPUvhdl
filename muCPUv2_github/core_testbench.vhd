--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:15:54 04/16/2016
-- Design Name:   
-- Module Name:   C:/Users/Reed2/Desktop/XilinxPrograms/muCPUvhdl_rev2/core_testbench.vhd
-- Project Name:  muCPUvhdl_rev2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: core
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY core_testbench IS
END core_testbench;
 
ARCHITECTURE behavior OF core_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT core
    PORT(
         portA_in : IN  std_logic_vector(7 downto 0);
         portB_in : IN  std_logic_vector(7 downto 0);
         portC_in : IN  std_logic_vector(7 downto 0);
         portD_in : IN  std_logic_vector(7 downto 0);
         portA_out : OUT  std_logic_vector(7 downto 0);
         portB_out : OUT  std_logic_vector(7 downto 0);
         portC_out : OUT  std_logic_vector(7 downto 0);
         portD_out : OUT  std_logic_vector(7 downto 0);
         portA_we : IN  std_logic;
         portB_we : IN  std_logic;
         portC_we : IN  std_logic;
         portD_we : IN  std_logic;
         clk50 : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal portA_in : std_logic_vector(7 downto 0) := (others => '0');
   signal portB_in : std_logic_vector(7 downto 0) := (others => '0');
   signal portC_in : std_logic_vector(7 downto 0) := (others => '0');
   signal portD_in : std_logic_vector(7 downto 0) := (others => '0');
   signal portA_we : std_logic := '0';
   signal portB_we : std_logic := '0';
   signal portC_we : std_logic := '0';
   signal portD_we : std_logic := '0';
   signal clk50 : std_logic := '0';

 	--Outputs
   signal portA_out : std_logic_vector(7 downto 0);
   signal portB_out : std_logic_vector(7 downto 0);
   signal portC_out : std_logic_vector(7 downto 0);
   signal portD_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk50_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: core PORT MAP (
          portA_in => portA_in,
          portB_in => portB_in,
          portC_in => portC_in,
          portD_in => portD_in,
          portA_out => portA_out,
          portB_out => portB_out,
          portC_out => portC_out,
          portD_out => portD_out,
          portA_we => portA_we,
          portB_we => portB_we,
          portC_we => portC_we,
          portD_we => portD_we,
          clk50 => clk50
        );

   -- Clock process definitions
   clk50_process :process
   begin
		clk50 <= '0';
		wait for clk50_period/2;
		clk50 <= '1';
		wait for clk50_period/2;
   end process;
 

   -- Stimulus process
--   stim_proc: process
--   begin		
----      -- hold reset state for 100 ns.
----      wait for 100 ns;	
----
----      wait for clk50_period*10;
----
----      -- insert stimulus here 
----
----      wait;
--   end process;

END;
