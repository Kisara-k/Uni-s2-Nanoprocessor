----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2024 01:03:57 PM
-- Design Name: 
-- Module Name: AU_7_seg - Behavioral
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

entity AU_7_seg is
    Port (
    A: in STD_LOGIC_VECTOR(3 downto 0);
    RegSel, Clk: in STD_LOGIC;
    S_LED: out STD_LOGIC_VECTOR(3 downto 0);
    S_7Seg: out STD_LOGIC_VECTOR(6 downto 0);
    Zero, Carry: out STD_LOGIC
    );
end AU_7_seg;

architecture Behavioral of AU_7_seg is

    component AU
        Port (
        A: in STD_LOGIC_VECTOR(3 downto 0);
        RegSel, Clk: in STD_LOGIC;
        S: out STD_LOGIC_VECTOR(3 downto 0);
        Zero, Carry: out STD_LOGIC
        );
    end component; 
    
    component LUT_16_7
        Port (
        address: in STD_LOGIC_VECTOR(3 downto 0);
        data: out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;
    
    SIGNAL temp_S_LED : STD_LOGIC_VECTOR(3 downto 0);


begin

    AU0 : AU
    Port Map (
        A => A,
        RegSel => RegSel,
        Clk => Clk,
        S => temp_S_LED,
        Zero => Zero,
        Carry => Carry
    );
    
    LUT_16_70 : LUT_16_7
    Port Map(
        address => temp_S_LED,
        data => S_7Seg
    );
    
    S_LED <= temp_S_LED;
    
end Behavioral;
