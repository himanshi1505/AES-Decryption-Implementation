library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity display_tb is
end display_tb;

architecture Behavioral of display_tb is
    component display
        Port (
            clk_in    : in  STD_LOGIC;
            reset     : in  STD_LOGIC;
--            data_in   : in  STD_LOGIC_VECTOR(127 downto 0);
            anodes    : out STD_LOGIC_VECTOR(3 downto 0);
            cathode   : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;
    
    -- Test signals
    signal clk_in_tb    : STD_LOGIC := '0';
    signal reset_tb     : STD_LOGIC := '0';
--    signal data_in_tb   : STD_LOGIC_VECTOR(127 downto 0);
    signal anodes_tb    : STD_LOGIC_VECTOR(3 downto 0);
    signal cathode_tb   : STD_LOGIC_VECTOR(6 downto 0);
    
    -- Clock period definition
    constant CLK_PERIOD : time := 10 ns;
    
begin
    -- Instantiate the Unit Under Test (UUT)
    UUT: display 
        Port map (
            clk_in  => clk_in_tb,
            reset   => reset_tb,
--            data_in => data_in_tb,
            anodes  => anodes_tb,
            cathode => cathode_tb
        );
    
    -- Clock process
    clk_process: process
    begin
        while now < 5000 ns loop  -- Run for 5000 ns
            clk_in_tb <= '0';
            wait for CLK_PERIOD/2;
            clk_in_tb <= '1';
            wait for CLK_PERIOD/2;
        end loop;
        wait;
    end process;
    
    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize test data with an easily recognizable pattern
--        data_in_tb <= x"30313233" & x"34353637" & x"38394041" & x"42434445";
        
        -- Reset sequence
        reset_tb <= '1';
        wait for 20 ns;
        reset_tb <= '0';
        
        -- Let it run for the full simulation time
        wait for 5000 ns;
        wait;
    end process;
    
end Behavioral;