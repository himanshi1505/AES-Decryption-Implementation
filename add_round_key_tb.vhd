library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add_round_key_tb is
end add_round_key_tb;

architecture Behavioral of add_round_key_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component add_round_key
        Port (
            input1  : in STD_LOGIC_VECTOR(31 downto 0);
            input2  : in STD_LOGIC_VECTOR(31 downto 0);
            output  : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;

    -- Signals to connect to UUT
    signal input1  : STD_LOGIC_VECTOR(31 downto 0);
    signal input2  : STD_LOGIC_VECTOR(31 downto 0);
    signal output  : STD_LOGIC_VECTOR(31 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: add_round_key
        Port map (
            input1 => input1,
            input2 => input2,
            output => output
        );

    -- Test Process
    stimulus_process: process
    begin
        -- Test case 1: Basic XOR test
        input1 <= X"12345678";
        input2 <= X"87654321";
        wait for 100 ns;

        -- Test case 2: XOR with all 1s
        input1 <= X"FFFFFFFF";
        input2 <= X"12345678";
        wait for 100 ns;

        -- Test case 3: XOR with all 0s
        input1 <= X"00000000";
        input2 <= X"12345678";
        wait for 100 ns;

        -- Test case 4: XOR with same inputs (should yield 0)
        input1 <= X"AABBCCDD";
        input2 <= X"AABBCCDD";
        wait for 100 ns;

        -- Test case 5: XOR with alternating bits
        input1 <= X"AAAAAAAA";
        input2 <= X"55555555";
        wait for 100 ns;

        -- End of simulation
        wait;
    end process;

end Behavioral;
