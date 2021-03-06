library ieee;
use ieee.std_logic_1164.all;


entity Datapath is 
	port (
		SW: in std_logic_vector(9 downto 0);
		ativa_Result, ativa_LEDR: in std_logic;
		clock, reset,	ativa_reg1, ativa_reg2, ativa_reg3, ativa_Cont, ativa_clock, ativa_muxDec01, ativa_muxDec23, ativa_muxDec45, ativa_muxMux01, ativa_muxMuxMux01: in std_logic;
		dez, ativa_s0: out std_logic;
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

---------------------------------------------------------------------------------------------
signal muxCont, veloc1, veloc2, veloc3, veloc4, compCont,CLK1, CLK2, CLK3, CLK4: std_logic;
signal regSelec, regSel, regMulti: std_logic_vector(1 downto 0);
signal contROM, R, S, P: std_logic_vector(3 downto 0);
signal romMux1, romMux2, romMux3, romMux4, muxCOMP, deslMulti, demDEC, SP: std_logic_vector(7 downto 0);
signal resultDec, result: std_logic_vector(11 downto 0);
signal muxD0, muxD1, muxD2, muxD3, muxD4, muxD5, muxMux0, muxMux1, muxMuxMux0, muxMuxMux1: std_logic_vector(6 downto 0);
---------------------------------------------------------------------------------------------------


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

component comparador 
is port (inputMux, inputUser: in std_logic_vector(7 downto 0);
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
	port (clock, reset, ligacont: in std_logic;
			dez: out std_logic;
			cont: out std_logic_vector(3 downto 0));
end component;

component contador is 
	port (clock, reset, enable: in std_logic;
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
port (reset, enable, clock: in std_logic;
		C: in std_logic_vector(3 downto 0);
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
		S: out std_logic_vector(11 downto 0)
);
end component;

component FSM_Clock is
port(
		Clock, Reset, Enable : in std_logic;
		CLK1, CLK2, CLK3, CLK4 : out std_logic
		);
end component;

component registradorJogoDec is
port (reset, enable, clock: in std_logic;
		sel: in std_logic_vector(1 downto 0);
		inputScore: in std_logic_vector(7 downto 0);
		S: out std_logic_vector(3 downto 0);
		P: out std_logic_vector(3 downto 0);
		SP: out std_logic_vector(7 downto 0)

);
end component;

component muxDecod is
port (A: in std_logic_vector(6 downto 0);
		B: in std_logic_vector(1 downto 0);
		sel: in std_logic;
		S: out std_logic_vector(6 downto 0)
);
end component;

component muxDecodG is
port (A: in std_logic_vector(6 downto 0);
		B: in std_logic_vector(6 downto 0);
		sel: in std_logic;
		S: out std_logic_vector(6 downto 0)
);
end component;




--Fim da declaraçao de componentes

begin

	clocks: FSM_Clock port map (clock, reset, ativa_clock , CLK1, CLK2, CLK3, CLK4);
	regSel1: registrador port map(reset, ativa_reg1, clock, SW(9 downto 8), regSelec);
	muxVeloc: mux port map(CLK1, CLK2, CLK3, CLK4,regSelec, muxCont);
	dec7veloc: decod7seg port map(regSelec, muxD4);
	muxD5 <= "1000111";
	contR: contadorRom port map(muxCont, reset, ativa_Cont, dez,contROM );
	mor1: ROM port map(contROM, romMux1);
	mor2: ROM1 port map(contROM, romMux2);
	mor3: ROM2 port map(contROM, romMux3);
	mor4: ROM3 port map(contROM, romMux4);
	regSel2: registrador port map(reset, ativa_reg2, clock, SW(1 downto 0), regSel);
	morM: muxRom port map(romMux1,romMux2, romMux3, romMux4, regSel, muxCOMP);
	muxDEC1: decod7segJogo port map(P, muxD1);
	muxDEC2: decod7segJogo port map(S, muxD0);
	muxCOM: comparador port map(SP, SW(7 downto 0), compCont);
	contPont: contador port map(muxCont, reset, compCont, R);
	dec7LEDR: decod7segLEDR port map(reset, ativa_LEDR, clock, R, LEDR);
	deslE: deslocaE port map(regMulti, deslMulti);
	multiScore: multiplicador port map(R, deslMulti,resultDec);
	regResult: registradorResult port map(reset, ativa_Result, clock, resultDec, result(11 downto 0));
	dec71: decod7segResult port map(result(3 downto 0), muxD2);
	dec72: decod7segResult port map(result(7 downto 4), muxD3);
	regJogoDec: registradorJogoDec port map(reset, ativa_reg3, muxCont, SW(1 downto 0), muxCOMP, S, P, SP); 
	muxDec0:  muxDecod port map(muxD0, SW(1 downto 0), ativa_muxDec01, muxMux0);
	muxDeco1: muxDecodG port map(muxD1, "1111111", ativa_muxDec01, muxMux1);
	muxDeco2: muxDecodG port map(muxD2, "1111111", ativa_muxDec23, HEX2);
	muxDeco3: muxDecodG port map(muxD3, "1111111", ativa_muxDec23, HEX3);
	muxDeco4: muxDecodG port map(muxD4, "1111111", ativa_muxDec45, HEX4);
	muxDeco5: muxDecodG port map(muxD5, "1111111", ativa_muxDec45, HEX5);
	muxMux00: muxDecodG port map(muxMux0, "1111111", ativa_muxMux01, muxMuxMux0);
	muxMux11: muxDecodG port map(muxMux1, "1111111", ativa_muxMux01, muxMuxmux1);
	muxMuxMux00: muxDecodG port map(muxMuxMux0, "1001111", ativa_muxMuxMux01, HEX0);
	muxMuxMux11: muxDecodG port map(muxMuxmux1, "1000000", ativa_muxMuxMux01, HEX1);
	registradorMulti: registrador port map(reset, ativa_reg2, clock, SW(1 downto 0), regMulti);
--	multCerto: multiplicadorCerto port map
end arqdtp;