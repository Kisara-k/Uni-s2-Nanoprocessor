----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2024 05:59:51 PM
-- Design Name: 
-- Module Name: Register_Bank_Sim - Behavioral
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

entity Register_Bank_Sim is
--  Port ( );
end Register_Bank_Sim;

architecture Behavioral of Register_Bank_Sim is
    
    component Register_Bank
    Port (  D_Val : in STD_LOGIC_VECTOR (3 downto 0);
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
    end component;
    
    signal D_Val : STD_LOGIC_VECTOR(3 downto 0);
    signal RegEn : STD_LOGIC_VECTOR(2 downto 0);
    signal CLK, CLR : STD_LOGIC;
    signal R0, R1, R2, R3, R4, R5, R6, R7 : STD_LOGIC_VECTOR(3 downto 0);

begin

    UUT: Register_Bank
    Port Map (
        D_Val => D_Val,
        RegEn => RegEn,
        CLK => CLK,
        CLR => CLR,
        R0 => R0,
        R1 => R1,
        R2 => R2,
        R3 => R3,
        R4 => R4,
        R5 => R5,
        R6 => R6,
        R7 => R7);

    process begin
    
        CLK <= '0';
        WAIT FOR 5 ns;
        
        CLK <= '1';
        WAIT FOR 5 ns;
    
    end process;
    

    process begin
        
        -- Reset Test
        CLR <= '1'; WAIT FOR 10 ns; CLR <= '0'; WAIT FOR 10 ns;
        
        D_Val <= "1010"; RegEn <= "000"; WAIT FOR 50 ns;
        D_Val <= "1111"; RegEn <= "110"; WAIT FOR 50 ns;
        D_Val <= "1100"; RegEn <= "010"; WAIT FOR 50 ns;

        CLR <= '1'; WAIT FOR 10 ns; CLR <= '0'; WAIT FOR 10 ns;
        
        D_Val <= "1100"; RegEn <= "000"; WAIT FOR 50 ns;
        D_Val <= "0011"; RegEn <= "110"; WAIT FOR 50 ns;
        D_Val <= "1001"; RegEn <= "010"; WAIT FOR 50 ns;

        WAIT;
        
    end process;


end Behavioral;
