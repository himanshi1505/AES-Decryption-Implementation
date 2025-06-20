library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inv_sub_bytes_tb is
end inv_sub_bytes_tb;

architecture Behavioral of inv_sub_bytes_tb is
    -- Component under test (CUT)
    component inv_sub_bytes
        Port (
            input8  : in std_logic_vector(7 downto 0);
            output8 : out std_logic_vector(7 downto 0);
            clk     : in std_logic;
            rst     : in std_logic
        );
    end component;

    -- Signals to connect to the CUT
    signal input8  : std_logic_vector(7 downto 0);
    signal output8 : std_logic_vector(7 downto 0);
    signal clk     : std_logic := '0';
    signal rst     : std_logic := '0';

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin
    -- Instantiate the CUT
    uut: inv_sub_bytes
        Port map (
            input8  => input8,
            output8 => output8,
            clk     => clk,
            rst     => rst
        );

    -- Clock generation process
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Reset the system
        rst <= '1';
        wait for clk_period;
        rst <= '0';
        wait for clk_period;

        -- Test with different values of input8
        input8 <= X"00";
        wait for clk_period;

        input8 <= X"1A";
        wait for clk_period;

        input8 <= X"2F";
        wait for clk_period;

        input8 <= X"3B";
        wait for clk_period;

        input8 <= X"4E";
        wait for clk_period;

        input8 <= X"FF";
        wait for clk_period;

        -- Finish the simulation
        wait;
    end process;
end Behavioral;
