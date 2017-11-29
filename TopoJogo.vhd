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
signal k0, k1, k2, k3, contador, ativaResult, comecaJogo, ativaDeMux2: std_logic;

--Declaraçao de componentes

component Datapath is 
	port (
		SW: in std_logic_vector(9 downto 0);
		enableResult, ativaDeMux1: in std_logic;
		clock, reset, enable: in std_logic;
		dez: out std_logic;
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
	enable,clock, reset: in std_logic;
	dez: in std_logic;
	ativaRegRegDecodCont, mostreResult, ativaDeMux: out std_logic

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
	ctrl: Controle port map(k1, CLOCK_50, k0, contador, comecaJogo, ativaResult);
	dt: Datapath port map(SW, ativaResult, ativaDeMux2, CLOCK_50, k0, comecaJogo, contador, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);

end arqTopoJogo;
