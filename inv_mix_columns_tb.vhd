library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity inv_mix_columns_tb is
end inv_mix_columns_tb;

architecture Behavioral of inv_mix_columns_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component inv_mix_columns
        Port (
            input_col : in STD_LOGIC_VECTOR(31 downto 0);
            output_col : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;

    -- Signals to connect to UUT
    signal input_col : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal output_col : STD_LOGIC_VECTOR(31 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: inv_mix_columns
        Port map (
            input_col => input_col,
            output_col => output_col
        );

    -- Test Process
    stimulus_process: process
    begin
        -- Test case 1
        input_col <= X"12345678";
        wait for 100 ns;

        -- Test case 2
        input_col <= X"87654321";
        wait for 100 ns;

        -- Test case 3
        input_col <= X"AABBCCDD";
        wait for 100 ns;

        -- Test case 4
        input_col <= X"FFFFFFFF";
        wait for 100 ns;

        -- Test case 5
        input_col <= X"00000000";
        wait for 100 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;
