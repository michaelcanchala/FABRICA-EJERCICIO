-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "03/06/2024 15:46:28"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Panel0 IS
    PORT (
	a_contenido : IN std_logic;
	b_contenido : IN std_logic;
	c_luz : BUFFER std_logic;
	d_luz : BUFFER std_logic;
	e_alarma : BUFFER std_logic
	);
END Panel0;

-- Design Ports Information
-- c_luz	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d_luz	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- e_alarma	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a_contenido	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b_contenido	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Panel0 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a_contenido : std_logic;
SIGNAL ww_b_contenido : std_logic;
SIGNAL ww_c_luz : std_logic;
SIGNAL ww_d_luz : std_logic;
SIGNAL ww_e_alarma : std_logic;
SIGNAL \c_luz~output_o\ : std_logic;
SIGNAL \d_luz~output_o\ : std_logic;
SIGNAL \e_alarma~output_o\ : std_logic;
SIGNAL \a_contenido~input_o\ : std_logic;
SIGNAL \b_contenido~input_o\ : std_logic;
SIGNAL \c_luz~0_combout\ : std_logic;
SIGNAL \proceso_luces_alarma~0_combout\ : std_logic;

BEGIN

ww_a_contenido <= a_contenido;
ww_b_contenido <= b_contenido;
c_luz <= ww_c_luz;
d_luz <= ww_d_luz;
e_alarma <= ww_e_alarma;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X0_Y20_N9
\c_luz~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \c_luz~0_combout\,
	devoe => ww_devoe,
	o => \c_luz~output_o\);

-- Location: IOOBUF_X0_Y22_N2
\d_luz~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \proceso_luces_alarma~0_combout\,
	devoe => ww_devoe,
	o => \d_luz~output_o\);

-- Location: IOOBUF_X0_Y20_N2
\e_alarma~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \proceso_luces_alarma~0_combout\,
	devoe => ww_devoe,
	o => \e_alarma~output_o\);

-- Location: IOIBUF_X0_Y8_N22
\a_contenido~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a_contenido,
	o => \a_contenido~input_o\);

-- Location: IOIBUF_X0_Y21_N8
\b_contenido~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b_contenido,
	o => \b_contenido~input_o\);

-- Location: LCCOMB_X2_Y20_N16
\c_luz~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \c_luz~0_combout\ = \a_contenido~input_o\ $ (\b_contenido~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \a_contenido~input_o\,
	datad => \b_contenido~input_o\,
	combout => \c_luz~0_combout\);

-- Location: LCCOMB_X2_Y20_N26
\proceso_luces_alarma~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \proceso_luces_alarma~0_combout\ = (\a_contenido~input_o\ & \b_contenido~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \a_contenido~input_o\,
	datad => \b_contenido~input_o\,
	combout => \proceso_luces_alarma~0_combout\);

ww_c_luz <= \c_luz~output_o\;

ww_d_luz <= \d_luz~output_o\;

ww_e_alarma <= \e_alarma~output_o\;
END structure;


