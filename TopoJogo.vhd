library ieee;
use ieee.std_logic_1164.all;

entity TopoJogo is port (
	CLOCK_50: in std_logic;
	KEY: in std_logic_vector(3 downto 0);
	SW: in std_logic_vector(9 downto 0);
	LEDR: out std_logic_vector(9 downto 0);
	HEX0: out std_logic_vector(6 downto 0);
	HEX1: out std_logic_vector(6 downto 0);
	HEX2: out std_logic_vector(6 downto 0);
	HEX3: out std_logic_vector(6 downto 0);
	HEX4: out std_logic_vector(6 downto 0);
	HEX5: out std_logic_vector(6 downto 0) 
	);
end TopoJogo;

architecture arqTopoJogo of TopoJogo is
signal k0, k1, k2, k3, contador,ativa_reg1, ativa_reg2, ativa_reg3, ativa_Result, ativa_LEDR, ativa_Cont, ativa_clock, ativa_s0, ativa_muxDec01, ativa_muxDec23, ativa_muxDec45: std_logic;

--Declaraçao de componentes

component Datapath is 
	port (
		SW: in std_logic_vector(9 downto 0);
		ativa_Result, ativa_LEDR: in std_logic;
		clock, reset,	ativa_reg1, ativa_reg2, ativa_reg3, ativa_Cont, ativa_clock, ativa_muxDec01, ativa_muxDec23, ativa_muxDec45: in std_logic;
		dez, ativa_s0: out std_logic;
		LEDR: out std_logic_vector(9 downto 0);
		HEX0:out std_logic_vector(6 downto 0);
		HEX1:out std_logic_vector(6 downto 0);
		HEX2:out std_logic_vector(6 downto 0);
		HEX3:out std_logic_vector(6 downto 0);
		HEX4:out std_logic_vector(6 downto 0);
		HEX5:out std_logic_vector(6 downto 0) 
);
end component;

component Controle is port (
	enable,clock, reset, dez: in std_logic;
	ativa_reg1, ativa_reg2, ativa_reg3, ativa_Result, ativa_LEDR, ativa_Cont, ativa_clock, ativa_s0, ativa_muxDec01, ativa_muxDec23, ativa_muxDec45: out std_logic		
);
end component;

component ButtonSync is
	port
	(	KEY0, KEY1, KEY2, KEY3, CLK: in std_logic;
		BTN0, BTN1, BTN2, BTN3: out std_logic
	);
end component;

--Fim da declaraçao de componentes


begin
	
	bt: ButtonSync port map(KEY(0), KEY(1), KEY(2), KEY(3), CLOCK_50, k0, k1, k2, k3);
	ctrl: Controle port map(k1, CLOCK_50, k0, contador,ativa_reg1, ativa_reg2, ativa_reg3, ativa_Result, ativa_LEDR, ativa_Cont, ativa_clock, ativa_s0, ativa_muxDec01, ativa_muxDec23, ativa_muxDec45);
	dt: Datapath port map(SW, ativa_Result, ativa_LEDR, CLOCK_50, k0 , ativa_reg1, ativa_reg2, ativa_reg3, ativa_Cont, ativa_clock, ativa_muxDec01, ativa_muxDec23, ativa_muxDec45, contador, ativa_s0, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);

end arqTopoJogo;
