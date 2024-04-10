----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2024 05:16:50 PM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
    Port ( D_Val : in STD_LOGIC_VECTOR (3 downto 0);
           RegEn : in STD_LOGIC_VECTOR (2 downto 0);
           CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0));
end Register_Bank;

architecture Behavioral of Register_Bank is
    
    component Reg
        port (
        EN: in STD_LOGIC;
        CLK: in STD_LOGIC;
        CLR: in STD_LOGIC;
        D: in STD_LOGIC_VECTOR(3 downto 0);
        Q: out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    component Decoder_3_to_8
    port(
        I: in STD_LOGIC_VECTOR(2 downto 0);
        EN: in STD_LOGIC;
        Y: out STD_LOGIC_VECTOR(7 downto 0));
    end component;

    SIGNAL RegSel : STD_LOGIC_VECTOR(7 downto 0);

begin

    Decoder_3_to_8_0 : Decoder_3_to_8
    port map(
        I => RegEn,
        EN => '1',
        Y => RegSel);

    -- Reg_0 is Hardcoded to 0000

    Reg_0 : Reg
    port map(
        EN => '0',
        CLK => CLK,
        CLR => '1',
        D => D_Val,
        Q => R0);

    Reg_1 : Reg
    port map(
        EN => RegSel(1),
        CLK => CLK,
        CLR => CLR,
        D => D_Val,
        Q => R1);

    Reg_2 : Reg
    port map(
        EN => RegSel(2),
        CLK => CLK,
        CLR => CLR,
        D => D_Val,
        Q => R2);

    Reg_3 : Reg
    port map(
        EN => RegSel(3),
        CLK => CLK,
        CLR => CLR,
        D => D_Val,
        Q => R3);

    Reg_4 : Reg
    port map(
        EN => RegSel(4),
        CLK => CLK,
        CLR => CLR,
        D => D_Val,
        Q => R4);

    Reg_5 : Reg
    port map(
        EN => RegSel(5),
        CLK => CLK,
        CLR => CLR,
        D => D_Val,
        Q => R5);

    Reg_6 : Reg
    port map(
        EN => RegSel(6),
        CLK => CLK,
        CLR => CLR,
        D => D_Val,
        Q => R6);

    Reg_7 : Reg
    port map(
        EN => RegSel(7),
        CLK => CLK,
        CLR => CLR,
        D => D_Val,
        Q => R7);

end Behavioral;
