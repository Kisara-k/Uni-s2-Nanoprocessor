----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2024 05:57:40 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
        S : in STD_LOGIC_VECTOR (2 downto 0);
        EN : in STD_LOGIC;
        Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is

    component Decoder_3_to_8
    port(
        I: in STD_LOGIC_VECTOR;
        EN: in STD_LOGIC;
        Y: out STD_LOGIC_VECTOR );
    end component;
    
    signal S_I : STD_LOGIC_VECTOR (7 downto 0);

begin

    Decoder_3_to_8_0 : Decoder_3_to_8
    port map(
        I => S,
        EN => EN,
        Y => S_I );
        
    Y <= (S_I(7) and D(7)) or (S_I(6) and D(6)) or (S_I(5) and D(5)) or (S_I(4) and D(4)) or 
         (S_I(3) and D(3)) or (S_I(2) and D(2)) or (S_I(1) and D(1)) or (S_I(0) and D(0));
        
end Behavioral;
