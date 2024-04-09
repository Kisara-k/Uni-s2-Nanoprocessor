----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2024 08:28:56 PM
-- Design Name: 
-- Module Name: FA - Behavioral
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

entity FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end FA;

architecture Behavioral of FA is

    component HA   
        port (   
        A: in std_logic;   
        B: in std_logic;   
        S: out std_logic; 
        C: out std_logic);   
    end component; 
    
-- component declaration is used to define the interface to the lower-level design entity HA.
-- This essentially allow one entity (aka. module) to be used as part of another entity.

    SIGNAL HA0_S, HA0_C, HA1_S, HA1_C : std_logic; 
    
begin

    HA_0 : HA   
        port map (   
        A => A,   
        B => B,   
        S => HA0_S,   
        C => HA0_C);  
 
    HA_1 : HA   
        port map (   
        A => HA0_S,   
        B => C_in,   
        S => HA1_S,   
        C => HA1_C);    
    
-- Above code initiates 2 instances of the entity HA 
-- and connects them to the inputs and outputs of the FA we are trying build.         
        
    S <= HA1_S;
    C_out <= HA0_C OR HA1_C;
    
end Behavioral;



