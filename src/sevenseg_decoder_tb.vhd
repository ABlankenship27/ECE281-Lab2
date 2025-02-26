----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2025 02:42:29 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is

    component sevenseg_decoder is
        Port ( 
        i_Hex : in std_logic_vector(3 downto 0);
        o_seg_n : out std_logic_vector(6 downto 0)
        );
    end component sevenseg_decoder;

        signal w_hex : std_logic_vector (3 downto 0) := x"0";
        signal w_seg_n : std_logic_vector (6 downto 0) := "0000000";

begin
    sevenseg_decoder_uut : sevenseg_decoder port map(
        i_Hex   => w_hex,
        o_seg_n => w_seg_n
        );
        
        test_process : process
        begin
            
            w_hex <= x"0"; wait for 10 ns;
                assert (w_seg_n = "1000000") report "bad with 0" severity failure;
             w_hex <= x"1"; wait for 10 ns;
                assert (w_seg_n = "1111001") report "bad with 1" severity failure;
             w_hex <= x"A"; wait for 10 ns;
                assert (w_seg_n = "0001000") report "bad with A" severity failure;
             w_hex <= x"8"; wait for 10 ns;
                assert (w_seg_n = "0000000") report "bad with 0" severity failure;
             w_hex <= x"F"; wait for 10 ns;
                assert (w_seg_n = "0001110") report "bad with F" severity failure;

            wait;
        end process;
end test_bench;
