library ieee;
use ieee.std_logic_1164.all;


entity Datapath is 
	port (
		SW: in std_logic_vector(9 downto 0);
		enableResult: in std_logic;
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

end Datapath;


architecture arqdtp of Datapath is
signal muxCont, veloc1, veloc2, veloc3, veloc4, compCont: std_logic;
signal regSelec, regSel: std_logic_vector(1 downto 0);
signal contROM, R: std_logic_vector(3 downto 0);
signal romMux1, romMux2, romMux3, romMux4, muxCOMP, deslMulti, result: std_logic_vector(7 downto 0);
signal resultDec: std_logic_vector(11 downto 0);

--Declaraçao de componentes

component deslocaE is
port (sel: in std_logic_vector(1 downto 0);
	 S: out std_logic_vector(7 downto 0)
	 );
end component;

component velocidade is
port (CLOCK_50: in std_logic;
	S: out std_logic);
end component;

component velocidade1 is
port (CLOCK_50: in std_logic;
	S: out std_logic);
end component; 
	
	component velocidade2 is
port (CLOCK_50: in std_logic;
	S: out std_logic);
end component;

component velocidade3 is
port (CLOCK_50: in std_logic;
	S: out std_logic);
end component;

component comparador is port (
	inputMux, inputUser: in std_logic_vector(7 downto 0);
	S: out std_logic);
end component;

component registrador is
port (reset, enable, clock: in std_logic;
		sel: in std_logic_vector(1 downto 0);
		S: out std_logic_vector(1 downto 0)
);
end component;

component ROM is
  port ( address : in std_logic_vector(3 downto 0);
         data : out std_logic_vector(7 downto 0) );
end component;


component ROM1 is
  port ( address : in std_logic_vector(3 downto 0);
         data : out std_logic_vector(7 downto 0) );
end component;

component ROM2 is
  port ( address : in std_logic_vector(3 downto 0);
         data : out std_logic_vector(7 downto 0) );
end component;

component ROM3 is
  port ( address : in std_logic_vector(3 downto 0);
         data : out std_logic_vector(7 downto 0) );
end component;

component contadorRom is 
	port (clock, reset, enable: in std_logic;
			dez: out std_logic;
			cont: out std_logic_vector(3 downto 0));
end component;

component contador is 
	port (reset, enable: in std_logic;
			cont: out std_logic_vector(3 downto 0));
end component;

component muxRom is
	port (A, B, C, D: in std_logic_vector(7 downto 0);
			sel: in std_logic_vector(1 downto 0);
			S: out std_logic_vector(7 downto 0)
);
end component;

component mux is
	port (A, B, C, D: in std_logic;
			sel: in std_logic_vector(1 downto 0);
			S: out std_logic
);
end component;

component multiplicador is
	port (inputCont: in std_logic_vector(3 downto 0);
			inputDE: in std_logic_vector(7 downto 0);
			S: out std_logic_vector(11 downto 0)
);
end component;

component decod7seg is
port (C: in std_logic_vector(1 downto 0);
		F: out std_logic_vector(6 downto 0)
);
end component;

component decod7segResult is
port (C: in std_logic_vector(3 downto 0);
		F: out std_logic_vector(6 downto 0)
);
end component;

component decod7segLEDR is
port (C: in std_logic_vector(3 downto 0);
		F: out std_logic_vector(9 downto 0)
);
end component;

component decod7segJogo is
port (C: in std_logic_vector(3 downto 0);
		F: out std_logic_vector(6 downto 0)
);
end component;

component registradorResult is
port (reset, enable, clock: in std_logic;
		inputScore: in std_logic_vector(11 downto 0);
		S: out std_logic_vector(7 downto 0)
);
end component;

--Fim da declaraçao de componentes

begin
	--HEX2 <= "1001111" when enable = '0';
	--HEX3 <= "1000000" when enable = '0';
	velocMux1: velocidade port map(clock, veloc1);
	velocMux2: velocidade1 port map(clock, veloc2);
	velocMux3: velocidade2 port map(clock, veloc3);
	velocMux4: velocidade3 port map(clock, veloc4);
	regSel1: registrador port map(reset, enable, clock, SW(9 downto 8), regSelec);
	muxVeloc: mux port map(veloc1, veloc2, veloc3, veloc4,regSelec, muxCont);
	dec7veloc: decod7seg port map(regSelec, HEX4);
	HEX5 <= "1000111";
	contR: contadorRom port map(muxCont, reset, enable, dez, contROM);
	mor1: ROM port map(contROM, romMux1);
	mor2: ROM1 port map(contROM, romMux2);
	mor3: ROM2 port map(contROM, romMux3);
	mor4: ROM3 port map(contROM, romMux4);
	regSel2: registrador port map(reset, enable, clock, SW(1 downto 0), regSel);
	morM: muxRom port map(romMux1,romMux2, romMux3, romMux4, regSel, muxCOMP);
	muxDEC1: decod7segJogo port map(muxComp(7 downto 4), HEX1);
	muxDEC2: decod7segJogo port map(muxComp(3 downto 0), HEX0);
	muxCOM: comparador port map(muxCOMP, SW(7 downto 0), compCont);
	contPont: contador port map(reset, compCont, R);
	dec7LEDR: decod7segLEDR port map(R, LEDR);
	deslE: deslocaE port map(SW(9 downto 8), deslMulti);
	multiScore: multiplicador port map(R, deslMulti,resultDec);
	regResult: registradorResult port map(reset, enableResult, clock, resultDec, result(7 downto 0));
	dec71: decod7segResult port map(result(7 downto 4), HEX2);
	dec72: decod7segResult port map(result(3 downto 0), HEX3);

	
end arqdtp;