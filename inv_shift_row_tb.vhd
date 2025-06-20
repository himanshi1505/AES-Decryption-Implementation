library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inv_shift_row_tb is
end inv_shift_row_tb;

architecture Behavioral of inv_shift_row_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component inv_shift_row
        Port (
            row_number : in integer range 0 to 3;
            state_in   : in std_logic_vector(31 downto 0);
            state_out  : out std_logic_vector(31 downto 0)
        );
    end component;

    -- Signals to connect to UUT
    signal row_number : integer range 0 to 3;
    signal state_in   : std_logic_vector(31 downto 0);
    signal state_out  : std_logic_vector(31 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: inv_shift_row
        Port map (
            row_number => row_number,
            state_in   => state_in,
            state_out  => state_out
        );

    -- Test Process
    stimulus_process: process
    begin
        -- Test case 1: No shift (row 0)
        row_number <= 0;
        state_in <= X"12345678";
        wait for 100 ns;

        -- Test case 2: Shift by 1 position (row 1)
        row_number <= 1;
        state_in <= X"12345678";
        wait for 100 ns;

        -- Test case 3: Shift by 2 positions (row 2)
        row_number <= 2;
        state_in <= X"12345678";
        wait for 100 ns;

        -- Test case 4: Shift by 3 positions (row 3)
        row_number <= 3;
        state_in <= X"12345678";
        wait for 100 ns;

        -- Additional test case: Check another input pattern for row 1
        row_number <= 1;
        state_in <= X"AABBCCDD";
        wait for 100 ns;

        -- Additional test case: Check another input pattern for row 2
        row_number <= 2;
        state_in <= X"87654321";
        wait for 100 ns;

        -- Additional test case: Check another input pattern for row 3
        row_number <= 3;
        state_in <= X"DEADBEEF";
        wait for 100 ns;

        -- End of simulation
        wait;
    end process;

end Behavioral;
