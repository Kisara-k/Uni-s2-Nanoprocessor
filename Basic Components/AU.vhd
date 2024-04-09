----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2024 11:05:30 AM
-- Design Name: 
-- Module Name: AU - Behavioral
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

entity AU is
    Port (
    A: in STD_LOGIC_VECTOR(3 downto 0);
    RegSel, Clk: in STD_LOGIC;
    S: out STD_LOGIC_VECTOR(3 downto 0);
    Zero, Carry: out STD_LOGIC
    );
end AU;

architecture Behavioral of AU is

    component RCA_4
        port (   
        A, B: in STD_LOGIC_VECTOR(3 downto 0);
        C_in: in STD_LOGIC;   
        S: out STD_LOGIC_VECTOR(3 downto 0); 
        C_out: out STD_LOGIC
        );   
    end component; 
    
    component Reg
        port (
        En, Clk: in STD_LOGIC;
        D: in STD_LOGIC_VECTOR(3 downto 0);
        Q: out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
    
    component Slow_Clk
        port (
        Clk_in: in STD_LOGIC;
        Clk_out: out STD_LOGIC
        );
    end component;
    
    SIGNAL Reg_A_Q, Reg_B_Q, S_temp : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL Reg_A_En, Reg_B_En, Clk_slow, Carry_temp : STD_LOGIC; 

begin
    
    Slow_Clk0 : Slow_Clk
    port map (
        Clk_in => Clk,
        Clk_out => Clk_slow);
    
    Reg_A_En <= not RegSel;
    Reg_B_En <= RegSel;
    
    Reg_A : Reg 
    port map (   
        En => Reg_A_En,   
        Clk => Clk_slow, 
        D => A,
        Q => Reg_A_Q);
    
    Reg_B : Reg 
    port map (   
        En => Reg_B_En,   
        Clk => Clk_slow, 
        D => A,
        Q => Reg_B_Q);

    RCA0 : RCA_4
    port map (
        A => Reg_A_Q,
        B => Reg_B_Q,
        C_in => '0',
        S => S_temp,
        C_out => Carry_temp);

    Zero <= (not S_temp(0)) and (not S_temp(1)) and (not S_temp(2)) and (not S_temp(3)) and (not Carry_temp);    
    --Zero <= not(S_temp(0)) and not(S_temp(1)) and not(S_temp(2)) and not(S_temp(3)) and not(Carry_temp);
    --Zero <= not(S_temp(0) or S_temp(1)or S_temp(2) or S_temp(3) or Carry_temp);
    Carry <= Carry_temp;
    S <= S_temp;

end Behavioral;
