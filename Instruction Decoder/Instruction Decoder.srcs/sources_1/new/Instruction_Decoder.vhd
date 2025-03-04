----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2024 03:29:07 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           RegVal_A : in STD_LOGIC_VECTOR (3 downto 0);

           RegSel_A : out STD_LOGIC_VECTOR (2 downto 0);
           RegSel_B : out STD_LOGIC_VECTOR (2 downto 0);
           Value : out STD_LOGIC_VECTOR (3 downto 0);
           RegEn : out STD_LOGIC_VECTOR (2 downto 0); -- To store a value in Register

           LoadSel : out STD_LOGIC := '0';   -- 1 for Value, 0 for Adder Result
           AddSubSel : out STD_LOGIC := '0';

           JumpFlag : out STD_LOGIC := '0';
           JumpAddress : out STD_LOGIC_VECTOR (2 downto 0)) := "000";

end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

    component Decoder_2_to_4
    port(
        I: in STD_LOGIC_VECTOR(1 downto 0);
        EN: in STD_LOGIC;
        Y: out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    signal opCode : STD_LOGIC_VECTOR (1 downto 0);

begin

    opCode <= Instruction(11 downto 10);
    RegSel_A <= Instruction(9 downto 7); -- Set the Adder to do B - A
    RegSel_B <= Instruction(6 downto 4);

    /*
    process(Instruction)  -- Use CLK if it's used as an input
    begin
        case(opCode) is  -- Can use a 2-4 Decoder Instead

        -- 00 ADD - two RegSel
        -- 01 NEG - RegSel, LoadSel, Sub Flag
        
        -- 10 MOV - LoadSel
        -- 11 JRZ - RegSel

            when "00" =>
                LoadSel <= '0';
                AddSubSel <= '0';

            when "01" =>
                LoadSel <= '0';
                AddSubSel <= '1';
            
            when "10" =>
                LoadSel <= '1';
            
            when "11" =>
                LoadSel <= '0';
                JumpFlag <= (not RegVal_A(3)) and (not RegVal_A(2)) and (not RegVal_A(1)) and (not RegVal_A(0))
                JumpAddress <= Instruction(2 downto 0);
        end case;
    end process;
    */

    LoadSel <= opCode(1) and not (opCode(0));
    AddSubSel <= opCode(0);

    JumpFlag <= (not RegVal_A(3)) and (not RegVal_A(2)) and (not RegVal_A(1)) and (not RegVal_A(0))
    JumpAddress <= Instruction(2 downto 0);

    Value <= Instruction(3 downto 0);
    RegEn <= Instruction(9 downto 7);


end Behavioral;
