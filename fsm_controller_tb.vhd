library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fsm_controller_tb is
-- No ports are needed in the testbench
end fsm_controller_tb;

architecture Behavioral of fsm_controller_tb is
    -- Component declaration for the Unit Under Test (UUT)
    component fsm_controller
        Port (
            clk          : in STD_LOGIC;
            rst        : in STD_LOGIC;
            start        : in STD_LOGIC;
            plaintext_out : out STD_LOGIC_VECTOR(127 downto 0);
            done : out    STD_LOGIC                -- 128-bit final output
        );
    end component;

    -- Signals to connect to the UUT
    signal clk          : STD_LOGIC := '0';
    signal reset        : STD_LOGIC := '0';
    signal start        : STD_LOGIC := '0';
    signal plaintext_out : STD_LOGIC_VECTOR(127 downto 0);
    signal done :    STD_LOGIC ;
    -- Clock period definition
    constant clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: fsm_controller
        Port map (
            clk          => clk,
            rst        => reset,
            start        => start,
            plaintext_out => plaintext_out,
            done => done
        );

    -- Clock process definitions
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
        -- Initialize Inputs
        reset <= '1';
        start <= '0';
        wait for 20 ns;
        
        -- De-assert reset
        reset <= '0';
        wait for 20 ns;

        -- Start the decryption process
        start <= '0';
        wait for 10 ns;
        start <= '1';

        -- Wait for the process to complete (adjust time as needed)
--        wait for 500 ns;

        -- Check the output
        
        -- End simulation
        wait;
    end process;

end Behavioral;