----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:43:22 05/01/2016 
-- Design Name: 
-- Module Name:    fifo_opt - structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity fifo_opt is
	port (d_in	: in  std_logic_vector (7 downto 0);
         d_out	: out std_logic_vector (7 downto 0);
         push	: in  std_logic;
         pop	: in  std_logic;
         clock	: in  std_logic;
         clear	: in  std_logic;
         full	: out std_logic;
         empty	: out std_logic);
end fifo_opt;

architecture structural of fifo_opt is

	signal queue_addr, queue_data_in, queue_data_out : std_logic_vector (7 downto 0) := "00000000";
	signal read_addr, write_addr : std_logic_vector (7 downto 0) := "00000000";
	signal push_conf, pop_conf, empty_tmp, queue_str : std_logic := '0';
	signal lsbs_eq : std_logic := '0';
   
	signal r_overflow, w_overflow : std_logic := '0';
   
   component ram is
      port (addr	: in  std_logic_vector (7 downto 0);
            d_in	: in  std_logic_vector (7 downto 0);
            d_out	: out std_logic_vector (7 downto 0);
            store	: in  std_logic;
            clock	: in  std_logic);
   end component;
   
	component counter is
		port (count	: in  std_logic;
				clk	: in  std_logic;
				reset	: in  std_logic;
				value	: out std_logic_vector (7 downto 0);
				ovr	: out std_logic);
	end component;
   
	component reg is
		port (d	: in  std_logic_vector (7 downto 0);
				q	: out std_logic_vector (7 downto 0);
				en	: in  std_logic;
				clk: in  std_logic;
				clr: in  std_logic);
	end component;
begin

   queue : ram
      port map(addr  => queue_addr,
               d_in  => queue_data_in,
               d_out => queue_data_out,
               store => queue_str,
               clock => clock);

   r_addr : counter
      port map(count => pop_conf,
               clk   => clock,
               reset => clear,
               value => read_addr,
               ovr   => r_overflow);

   w_addr : counter
      port map(count => push_conf,
               clk   => clock,
               reset => clear,
               value => write_addr,
               ovr   => w_overflow);

   bufreg : reg
      port map(d     => queue_data_out,
               q     =>	d_out,
               en    => pop_conf,
               clk   => clock,
               clr   => clear);
                           
   queue_str <= push_conf;
   queue_data_in <= d_in;
   queue_addr <= write_addr when (pop_conf = '0') else read_addr;

   pop_conf <= pop and not(empty_tmp);
   push_conf <= not(pop_conf) and push;

   lsbs_eq <= '1' when (write_addr = read_addr) else '0';

   full <= lsbs_eq and (w_overflow xor r_overflow);
   empty_tmp <= lsbs_eq and (w_overflow xnor r_overflow);
   empty <= empty_tmp;

end structural;

