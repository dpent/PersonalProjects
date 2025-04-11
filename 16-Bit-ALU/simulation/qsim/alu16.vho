-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "06/11/2023 18:54:00"

-- 
-- Device: Altera 10M08DAF484C8G Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	alu16 IS
    PORT (
	a : IN std_logic_vector(15 DOWNTO 0);
	b : IN std_logic_vector(15 DOWNTO 0);
	Result : BUFFER std_logic_vector(15 DOWNTO 0);
	Overflow : BUFFER std_logic;
	Opcode : IN std_logic_vector(2 DOWNTO 0)
	);
END alu16;

-- Design Ports Information
-- Result[0]	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Result[1]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Result[2]	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Result[3]	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Result[4]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Result[5]	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Result[6]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Result[7]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Result[8]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Result[9]	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Result[10]	=>  Location: PIN_H3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Result[11]	=>  Location: PIN_AA2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Result[12]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Result[13]	=>  Location: PIN_P10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Result[14]	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Result[15]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Overflow	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Opcode[2]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Opcode[0]	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Opcode[1]	=>  Location: PIN_J3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[0]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[0]	=>  Location: PIN_AB4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[1]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[1]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[2]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[2]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[3]	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[3]	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[4]	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[4]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[5]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[5]	=>  Location: PIN_F5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[6]	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[6]	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[7]	=>  Location: PIN_K5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[7]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[8]	=>  Location: PIN_K4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[8]	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[9]	=>  Location: PIN_AA3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[9]	=>  Location: PIN_W7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[10]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[10]	=>  Location: PIN_J4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[11]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[11]	=>  Location: PIN_AA6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[12]	=>  Location: PIN_G3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[12]	=>  Location: PIN_D3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[13]	=>  Location: PIN_AA5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[13]	=>  Location: PIN_W3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[14]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[14]	=>  Location: PIN_W4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[15]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[15]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF alu16 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Result : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Overflow : std_logic;
SIGNAL ww_Opcode : std_logic_vector(2 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \Result[0]~output_o\ : std_logic;
SIGNAL \Result[1]~output_o\ : std_logic;
SIGNAL \Result[2]~output_o\ : std_logic;
SIGNAL \Result[3]~output_o\ : std_logic;
SIGNAL \Result[4]~output_o\ : std_logic;
SIGNAL \Result[5]~output_o\ : std_logic;
SIGNAL \Result[6]~output_o\ : std_logic;
SIGNAL \Result[7]~output_o\ : std_logic;
SIGNAL \Result[8]~output_o\ : std_logic;
SIGNAL \Result[9]~output_o\ : std_logic;
SIGNAL \Result[10]~output_o\ : std_logic;
SIGNAL \Result[11]~output_o\ : std_logic;
SIGNAL \Result[12]~output_o\ : std_logic;
SIGNAL \Result[13]~output_o\ : std_logic;
SIGNAL \Result[14]~output_o\ : std_logic;
SIGNAL \Result[15]~output_o\ : std_logic;
SIGNAL \Overflow~output_o\ : std_logic;
SIGNAL \Opcode[1]~input_o\ : std_logic;
SIGNAL \Opcode[0]~input_o\ : std_logic;
SIGNAL \Opcode[2]~input_o\ : std_logic;
SIGNAL \b[0]~input_o\ : std_logic;
SIGNAL \ALU_0|u4|z~3_combout\ : std_logic;
SIGNAL \a[0]~input_o\ : std_logic;
SIGNAL \ALU_0|u4|z~2_combout\ : std_logic;
SIGNAL \ALU_0|u4|z~4_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \ALU_0|u2|cout~0_combout\ : std_logic;
SIGNAL \b[1]~input_o\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \ALU_1|tempa~0_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \ALU_1|u3|c~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \ALU_1|u4|z~0_combout\ : std_logic;
SIGNAL \ALU_1|tempb~0_combout\ : std_logic;
SIGNAL \ALU_1|u4|z~1_combout\ : std_logic;
SIGNAL \b[2]~input_o\ : std_logic;
SIGNAL \ALU_2|tempb~0_combout\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \ALU_2|tempa~0_combout\ : std_logic;
SIGNAL \ALU_1|u2|cout~0_combout\ : std_logic;
SIGNAL \ALU_2|u4|z~0_combout\ : std_logic;
SIGNAL \ALU_2|u4|z~1_combout\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \ALU_3|tempa~0_combout\ : std_logic;
SIGNAL \ALU_2|u2|cout~0_combout\ : std_logic;
SIGNAL \b[3]~input_o\ : std_logic;
SIGNAL \ALU_3|u3|c~0_combout\ : std_logic;
SIGNAL \ALU_3|u4|z~0_combout\ : std_logic;
SIGNAL \ALU_3|tempb~0_combout\ : std_logic;
SIGNAL \ALU_3|u4|z~1_combout\ : std_logic;
SIGNAL \a[4]~input_o\ : std_logic;
SIGNAL \ALU_4|tempa~0_combout\ : std_logic;
SIGNAL \b[4]~input_o\ : std_logic;
SIGNAL \ALU_4|tempb~0_combout\ : std_logic;
SIGNAL \ALU_3|u2|cout~0_combout\ : std_logic;
SIGNAL \ALU_4|u4|z~0_combout\ : std_logic;
SIGNAL \ALU_4|u4|z~1_combout\ : std_logic;
SIGNAL \ALU_4|u2|cout~0_combout\ : std_logic;
SIGNAL \a[5]~input_o\ : std_logic;
SIGNAL \ALU_5|tempa~0_combout\ : std_logic;
SIGNAL \b[5]~input_o\ : std_logic;
SIGNAL \ALU_5|u3|c~0_combout\ : std_logic;
SIGNAL \ALU_5|u4|z~0_combout\ : std_logic;
SIGNAL \ALU_5|tempb~0_combout\ : std_logic;
SIGNAL \ALU_5|u4|z~1_combout\ : std_logic;
SIGNAL \b[6]~input_o\ : std_logic;
SIGNAL \ALU_6|tempb~0_combout\ : std_logic;
SIGNAL \ALU_5|u2|cout~0_combout\ : std_logic;
SIGNAL \ALU_6|u4|z~0_combout\ : std_logic;
SIGNAL \a[6]~input_o\ : std_logic;
SIGNAL \ALU_6|tempa~0_combout\ : std_logic;
SIGNAL \ALU_6|u4|z~1_combout\ : std_logic;
SIGNAL \ALU_6|u2|cout~0_combout\ : std_logic;
SIGNAL \a[7]~input_o\ : std_logic;
SIGNAL \ALU_7|tempa~0_combout\ : std_logic;
SIGNAL \b[7]~input_o\ : std_logic;
SIGNAL \ALU_7|u3|c~0_combout\ : std_logic;
SIGNAL \ALU_7|u4|z~0_combout\ : std_logic;
SIGNAL \ALU_7|tempb~0_combout\ : std_logic;
SIGNAL \ALU_7|u4|z~1_combout\ : std_logic;
SIGNAL \b[8]~input_o\ : std_logic;
SIGNAL \a[8]~input_o\ : std_logic;
SIGNAL \ALU_8|u4|z~1_combout\ : std_logic;
SIGNAL \ALU_8|u4|z~2_combout\ : std_logic;
SIGNAL \ALU_8|u4|z~3_combout\ : std_logic;
SIGNAL \ALU_7|u2|cout~0_combout\ : std_logic;
SIGNAL \ALU_8|u4|z~0_combout\ : std_logic;
SIGNAL \ALU_8|u4|z~4_combout\ : std_logic;
SIGNAL \b[9]~input_o\ : std_logic;
SIGNAL \ALU_9|tempb~0_combout\ : std_logic;
SIGNAL \a[9]~input_o\ : std_logic;
SIGNAL \ALU_9|tempa~0_combout\ : std_logic;
SIGNAL \ALU_9|u3|c~0_combout\ : std_logic;
SIGNAL \ALU_9|u4|z~0_combout\ : std_logic;
SIGNAL \ALU_9|u4|z~1_combout\ : std_logic;
SIGNAL \a[10]~input_o\ : std_logic;
SIGNAL \b[10]~input_o\ : std_logic;
SIGNAL \ALU_10|u4|z~1_combout\ : std_logic;
SIGNAL \ALU_10|u4|z~2_combout\ : std_logic;
SIGNAL \ALU_10|u4|z~0_combout\ : std_logic;
SIGNAL \ALU_10|u4|z~3_combout\ : std_logic;
SIGNAL \b[11]~input_o\ : std_logic;
SIGNAL \ALU_11|tempb~0_combout\ : std_logic;
SIGNAL \a[11]~input_o\ : std_logic;
SIGNAL \ALU_11|tempa~0_combout\ : std_logic;
SIGNAL \ALU_11|u3|c~0_combout\ : std_logic;
SIGNAL \ALU_11|u4|z~0_combout\ : std_logic;
SIGNAL \ALU_11|u4|z~1_combout\ : std_logic;
SIGNAL \b[12]~input_o\ : std_logic;
SIGNAL \a[12]~input_o\ : std_logic;
SIGNAL \ALU_12|u4|z~1_combout\ : std_logic;
SIGNAL \ALU_12|u4|z~0_combout\ : std_logic;
SIGNAL \ALU_12|u4|z~2_combout\ : std_logic;
SIGNAL \b[13]~input_o\ : std_logic;
SIGNAL \ALU_13|tempb~0_combout\ : std_logic;
SIGNAL \a[13]~input_o\ : std_logic;
SIGNAL \ALU_13|tempa~0_combout\ : std_logic;
SIGNAL \ALU_13|u3|c~0_combout\ : std_logic;
SIGNAL \ALU_13|u4|z~0_combout\ : std_logic;
SIGNAL \ALU_13|u4|z~1_combout\ : std_logic;
SIGNAL \b[14]~input_o\ : std_logic;
SIGNAL \ALU_14|tempb~0_combout\ : std_logic;
SIGNAL \a[14]~input_o\ : std_logic;
SIGNAL \ALU_14|tempa~0_combout\ : std_logic;
SIGNAL \ALU_14|u4|z~0_combout\ : std_logic;
SIGNAL \a[15]~input_o\ : std_logic;
SIGNAL \b[15]~input_o\ : std_logic;
SIGNAL \ALU_15|u3|c~0_combout\ : std_logic;
SIGNAL \ALU_15|u4|z~0_combout\ : std_logic;
SIGNAL \ALU_15|tempb~0_combout\ : std_logic;
SIGNAL \ALU_15|tempa~0_combout\ : std_logic;
SIGNAL \ALU_15|u4|z~1_combout\ : std_logic;
SIGNAL \ALU_15|u2|cout~0_combout\ : std_logic;
SIGNAL \ALU_14|u2|cout~0_combout\ : std_logic;
SIGNAL \Overflow~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_a <= a;
ww_b <= b;
Result <= ww_Result;
Overflow <= ww_Overflow;
ww_Opcode <= Opcode;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X11_Y14_N16
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X9_Y0_N16
\Result[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_0|u4|z~4_combout\,
	devoe => ww_devoe,
	o => \Result[0]~output_o\);

-- Location: IOOBUF_X6_Y10_N2
\Result[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_1|u4|z~1_combout\,
	devoe => ww_devoe,
	o => \Result[1]~output_o\);

-- Location: IOOBUF_X10_Y16_N2
\Result[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_2|u4|z~1_combout\,
	devoe => ww_devoe,
	o => \Result[2]~output_o\);

-- Location: IOOBUF_X3_Y10_N2
\Result[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_3|u4|z~1_combout\,
	devoe => ww_devoe,
	o => \Result[3]~output_o\);

-- Location: IOOBUF_X1_Y10_N30
\Result[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_4|u4|z~1_combout\,
	devoe => ww_devoe,
	o => \Result[4]~output_o\);

-- Location: IOOBUF_X10_Y17_N2
\Result[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_5|u4|z~1_combout\,
	devoe => ww_devoe,
	o => \Result[5]~output_o\);

-- Location: IOOBUF_X10_Y15_N16
\Result[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_6|u4|z~1_combout\,
	devoe => ww_devoe,
	o => \Result[6]~output_o\);

-- Location: IOOBUF_X10_Y16_N9
\Result[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_7|u4|z~1_combout\,
	devoe => ww_devoe,
	o => \Result[7]~output_o\);

-- Location: IOOBUF_X10_Y17_N9
\Result[8]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_8|u4|z~4_combout\,
	devoe => ww_devoe,
	o => \Result[8]~output_o\);

-- Location: IOOBUF_X6_Y0_N23
\Result[9]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_9|u4|z~1_combout\,
	devoe => ww_devoe,
	o => \Result[9]~output_o\);

-- Location: IOOBUF_X10_Y20_N23
\Result[10]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_10|u4|z~3_combout\,
	devoe => ww_devoe,
	o => \Result[10]~output_o\);

-- Location: IOOBUF_X6_Y0_N2
\Result[11]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_11|u4|z~1_combout\,
	devoe => ww_devoe,
	o => \Result[11]~output_o\);

-- Location: IOOBUF_X10_Y18_N16
\Result[12]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_12|u4|z~2_combout\,
	devoe => ww_devoe,
	o => \Result[12]~output_o\);

-- Location: IOOBUF_X11_Y0_N2
\Result[13]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_13|u4|z~1_combout\,
	devoe => ww_devoe,
	o => \Result[13]~output_o\);

-- Location: IOOBUF_X10_Y22_N23
\Result[14]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_14|u4|z~0_combout\,
	devoe => ww_devoe,
	o => \Result[14]~output_o\);

-- Location: IOOBUF_X11_Y0_N9
\Result[15]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_15|u4|z~1_combout\,
	devoe => ww_devoe,
	o => \Result[15]~output_o\);

-- Location: IOOBUF_X13_Y0_N2
\Overflow~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Overflow~0_combout\,
	devoe => ww_devoe,
	o => \Overflow~output_o\);

-- Location: IOIBUF_X10_Y19_N8
\Opcode[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Opcode(1),
	o => \Opcode[1]~input_o\);

-- Location: IOIBUF_X3_Y10_N29
\Opcode[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Opcode(0),
	o => \Opcode[0]~input_o\);

-- Location: IOIBUF_X6_Y10_N29
\Opcode[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Opcode(2),
	o => \Opcode[2]~input_o\);

-- Location: IOIBUF_X13_Y0_N8
\b[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(0),
	o => \b[0]~input_o\);

-- Location: LCCOMB_X10_Y4_N12
\ALU_0|u4|z~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_0|u4|z~3_combout\ = (\Opcode[1]~input_o\ & (\b[0]~input_o\ $ (((!\Opcode[2]~input_o\) # (!\Opcode[0]~input_o\))))) # (!\Opcode[1]~input_o\ & ((\b[0]~input_o\ & ((!\Opcode[2]~input_o\))) # (!\b[0]~input_o\ & (\Opcode[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010101101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[1]~input_o\,
	datab => \Opcode[0]~input_o\,
	datac => \Opcode[2]~input_o\,
	datad => \b[0]~input_o\,
	combout => \ALU_0|u4|z~3_combout\);

-- Location: IOIBUF_X11_Y0_N15
\a[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(0),
	o => \a[0]~input_o\);

-- Location: LCCOMB_X10_Y4_N26
\ALU_0|u4|z~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_0|u4|z~2_combout\ = (\Opcode[1]~input_o\ & (\b[0]~input_o\ & ((!\Opcode[2]~input_o\) # (!\Opcode[0]~input_o\)))) # (!\Opcode[1]~input_o\ & ((\b[0]~input_o\ & (\Opcode[0]~input_o\)) # (!\b[0]~input_o\ & ((\Opcode[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[1]~input_o\,
	datab => \Opcode[0]~input_o\,
	datac => \Opcode[2]~input_o\,
	datad => \b[0]~input_o\,
	combout => \ALU_0|u4|z~2_combout\);

-- Location: LCCOMB_X10_Y4_N6
\ALU_0|u4|z~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_0|u4|z~4_combout\ = (\a[0]~input_o\ & (\ALU_0|u4|z~3_combout\)) # (!\a[0]~input_o\ & ((\ALU_0|u4|z~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_0|u4|z~3_combout\,
	datab => \a[0]~input_o\,
	datac => \ALU_0|u4|z~2_combout\,
	combout => \ALU_0|u4|z~4_combout\);

-- Location: LCCOMB_X10_Y4_N2
\Mux2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\Opcode[2]~input_o\ & !\Opcode[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Opcode[2]~input_o\,
	datad => \Opcode[1]~input_o\,
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X10_Y4_N16
\Mux4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\Opcode[0]~input_o\ & (!\Opcode[2]~input_o\ & \Opcode[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Opcode[0]~input_o\,
	datac => \Opcode[2]~input_o\,
	datad => \Opcode[1]~input_o\,
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X10_Y4_N28
\ALU_0|u2|cout~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_0|u2|cout~0_combout\ = (\b[0]~input_o\ & ((\Mux2~0_combout\ & (\Mux4~0_combout\ & !\a[0]~input_o\)) # (!\Mux2~0_combout\ & ((\a[0]~input_o\))))) # (!\b[0]~input_o\ & ((\Mux4~0_combout\) # ((\Mux2~0_combout\ & !\a[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2~0_combout\,
	datab => \Mux4~0_combout\,
	datac => \a[0]~input_o\,
	datad => \b[0]~input_o\,
	combout => \ALU_0|u2|cout~0_combout\);

-- Location: IOIBUF_X0_Y8_N8
\b[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(1),
	o => \b[1]~input_o\);

-- Location: IOIBUF_X6_Y10_N15
\a[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(1),
	o => \a[1]~input_o\);

-- Location: LCCOMB_X9_Y8_N18
\ALU_1|tempa~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_1|tempa~0_combout\ = \a[1]~input_o\ $ (((!\Opcode[1]~input_o\ & \Opcode[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \a[1]~input_o\,
	datac => \Opcode[1]~input_o\,
	datad => \Opcode[2]~input_o\,
	combout => \ALU_1|tempa~0_combout\);

-- Location: LCCOMB_X10_Y4_N22
\Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (\Opcode[2]~input_o\ & ((!\Opcode[1]~input_o\))) # (!\Opcode[2]~input_o\ & (\Opcode[0]~input_o\ & \Opcode[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Opcode[0]~input_o\,
	datac => \Opcode[2]~input_o\,
	datad => \Opcode[1]~input_o\,
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X9_Y8_N4
\ALU_1|u3|c~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_1|u3|c~0_combout\ = \b[1]~input_o\ $ (\ALU_1|tempa~0_combout\ $ (\Mux3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \ALU_1|tempa~0_combout\,
	datad => \Mux3~0_combout\,
	combout => \ALU_1|u3|c~0_combout\);

-- Location: LCCOMB_X10_Y9_N16
\Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ((\Opcode[2]~input_o\ & \Opcode[0]~input_o\)) # (!\Opcode[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[2]~input_o\,
	datac => \Opcode[0]~input_o\,
	datad => \Opcode[1]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X9_Y4_N24
\Mux1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (\Opcode[1]~input_o\ & (!\Opcode[0]~input_o\ & \Opcode[2]~input_o\)) # (!\Opcode[1]~input_o\ & (\Opcode[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[1]~input_o\,
	datab => \Opcode[0]~input_o\,
	datad => \Opcode[2]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X9_Y8_N6
\ALU_1|u4|z~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_1|u4|z~0_combout\ = (\Mux0~0_combout\ & (((\Mux1~0_combout\)))) # (!\Mux0~0_combout\ & (\ALU_1|u3|c~0_combout\ $ (((\ALU_0|u2|cout~0_combout\ & !\Mux1~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_0|u2|cout~0_combout\,
	datab => \ALU_1|u3|c~0_combout\,
	datac => \Mux0~0_combout\,
	datad => \Mux1~0_combout\,
	combout => \ALU_1|u4|z~0_combout\);

-- Location: LCCOMB_X9_Y8_N8
\ALU_1|tempb~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_1|tempb~0_combout\ = \b[1]~input_o\ $ (((\Opcode[2]~input_o\ & ((!\Opcode[1]~input_o\))) # (!\Opcode[2]~input_o\ & (\Opcode[0]~input_o\ & \Opcode[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001100101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[0]~input_o\,
	datab => \Opcode[2]~input_o\,
	datac => \Opcode[1]~input_o\,
	datad => \b[1]~input_o\,
	combout => \ALU_1|tempb~0_combout\);

-- Location: LCCOMB_X9_Y8_N0
\ALU_1|u4|z~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_1|u4|z~1_combout\ = (\ALU_1|u4|z~0_combout\ & ((\ALU_1|tempb~0_combout\) # ((\ALU_1|tempa~0_combout\) # (!\Mux0~0_combout\)))) # (!\ALU_1|u4|z~0_combout\ & (\ALU_1|tempb~0_combout\ & (\Mux0~0_combout\ & \ALU_1|tempa~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_1|u4|z~0_combout\,
	datab => \ALU_1|tempb~0_combout\,
	datac => \Mux0~0_combout\,
	datad => \ALU_1|tempa~0_combout\,
	combout => \ALU_1|u4|z~1_combout\);

-- Location: IOIBUF_X6_Y10_N22
\b[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(2),
	o => \b[2]~input_o\);

-- Location: LCCOMB_X9_Y8_N10
\ALU_2|tempb~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_2|tempb~0_combout\ = \b[2]~input_o\ $ (((\Opcode[2]~input_o\ & ((!\Opcode[1]~input_o\))) # (!\Opcode[2]~input_o\ & (\Opcode[0]~input_o\ & \Opcode[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001100101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[0]~input_o\,
	datab => \Opcode[2]~input_o\,
	datac => \Opcode[1]~input_o\,
	datad => \b[2]~input_o\,
	combout => \ALU_2|tempb~0_combout\);

-- Location: IOIBUF_X1_Y10_N15
\a[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(2),
	o => \a[2]~input_o\);

-- Location: LCCOMB_X9_Y8_N20
\ALU_2|tempa~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_2|tempa~0_combout\ = \a[2]~input_o\ $ (((!\Opcode[1]~input_o\ & \Opcode[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[2]~input_o\,
	datac => \Opcode[1]~input_o\,
	datad => \Opcode[2]~input_o\,
	combout => \ALU_2|tempa~0_combout\);

-- Location: LCCOMB_X9_Y8_N22
\ALU_1|u2|cout~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_1|u2|cout~0_combout\ = (\ALU_1|tempa~0_combout\ & ((\ALU_0|u2|cout~0_combout\) # (\b[1]~input_o\ $ (\Mux3~0_combout\)))) # (!\ALU_1|tempa~0_combout\ & (\ALU_0|u2|cout~0_combout\ & (\b[1]~input_o\ $ (\Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \ALU_1|tempa~0_combout\,
	datac => \ALU_0|u2|cout~0_combout\,
	datad => \Mux3~0_combout\,
	combout => \ALU_1|u2|cout~0_combout\);

-- Location: LCCOMB_X9_Y8_N24
\ALU_2|u4|z~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_2|u4|z~0_combout\ = (\Mux0~0_combout\ & ((\Mux1~0_combout\))) # (!\Mux0~0_combout\ & (\ALU_1|u2|cout~0_combout\ & !\Mux1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_1|u2|cout~0_combout\,
	datab => \Mux0~0_combout\,
	datac => \Mux1~0_combout\,
	combout => \ALU_2|u4|z~0_combout\);

-- Location: LCCOMB_X9_Y8_N2
\ALU_2|u4|z~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_2|u4|z~1_combout\ = (\Mux0~0_combout\ & ((\ALU_2|tempb~0_combout\ & ((\ALU_2|tempa~0_combout\) # (\ALU_2|u4|z~0_combout\))) # (!\ALU_2|tempb~0_combout\ & (\ALU_2|tempa~0_combout\ & \ALU_2|u4|z~0_combout\)))) # (!\Mux0~0_combout\ & 
-- (\ALU_2|tempb~0_combout\ $ (\ALU_2|tempa~0_combout\ $ (\ALU_2|u4|z~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100110000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_2|tempb~0_combout\,
	datab => \ALU_2|tempa~0_combout\,
	datac => \Mux0~0_combout\,
	datad => \ALU_2|u4|z~0_combout\,
	combout => \ALU_2|u4|z~1_combout\);

-- Location: IOIBUF_X0_Y8_N1
\a[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(3),
	o => \a[3]~input_o\);

-- Location: LCCOMB_X10_Y8_N18
\ALU_3|tempa~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_3|tempa~0_combout\ = \a[3]~input_o\ $ (((!\Opcode[1]~input_o\ & \Opcode[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[3]~input_o\,
	datac => \Opcode[1]~input_o\,
	datad => \Opcode[2]~input_o\,
	combout => \ALU_3|tempa~0_combout\);

-- Location: LCCOMB_X9_Y8_N12
\ALU_2|u2|cout~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_2|u2|cout~0_combout\ = (\ALU_2|tempa~0_combout\ & ((\ALU_1|u2|cout~0_combout\) # (\b[2]~input_o\ $ (\Mux3~0_combout\)))) # (!\ALU_2|tempa~0_combout\ & (\ALU_1|u2|cout~0_combout\ & (\b[2]~input_o\ $ (\Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[2]~input_o\,
	datab => \ALU_2|tempa~0_combout\,
	datac => \ALU_1|u2|cout~0_combout\,
	datad => \Mux3~0_combout\,
	combout => \ALU_2|u2|cout~0_combout\);

-- Location: IOIBUF_X3_Y10_N8
\b[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(3),
	o => \b[3]~input_o\);

-- Location: LCCOMB_X10_Y8_N28
\ALU_3|u3|c~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_3|u3|c~0_combout\ = \b[3]~input_o\ $ (\Mux3~0_combout\ $ (\ALU_3|tempa~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \b[3]~input_o\,
	datac => \Mux3~0_combout\,
	datad => \ALU_3|tempa~0_combout\,
	combout => \ALU_3|u3|c~0_combout\);

-- Location: LCCOMB_X10_Y8_N30
\ALU_3|u4|z~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_3|u4|z~0_combout\ = (\Mux0~0_combout\ & (((\Mux1~0_combout\)))) # (!\Mux0~0_combout\ & (\ALU_3|u3|c~0_combout\ $ (((\ALU_2|u2|cout~0_combout\ & !\Mux1~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_2|u2|cout~0_combout\,
	datab => \Mux1~0_combout\,
	datac => \Mux0~0_combout\,
	datad => \ALU_3|u3|c~0_combout\,
	combout => \ALU_3|u4|z~0_combout\);

-- Location: LCCOMB_X10_Y8_N0
\ALU_3|tempb~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_3|tempb~0_combout\ = \b[3]~input_o\ $ (((\Opcode[1]~input_o\ & (\Opcode[0]~input_o\ & !\Opcode[2]~input_o\)) # (!\Opcode[1]~input_o\ & ((\Opcode[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001101101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[0]~input_o\,
	datab => \b[3]~input_o\,
	datac => \Opcode[1]~input_o\,
	datad => \Opcode[2]~input_o\,
	combout => \ALU_3|tempb~0_combout\);

-- Location: LCCOMB_X10_Y8_N8
\ALU_3|u4|z~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_3|u4|z~1_combout\ = (\Mux0~0_combout\ & ((\ALU_3|tempa~0_combout\ & ((\ALU_3|u4|z~0_combout\) # (\ALU_3|tempb~0_combout\))) # (!\ALU_3|tempa~0_combout\ & (\ALU_3|u4|z~0_combout\ & \ALU_3|tempb~0_combout\)))) # (!\Mux0~0_combout\ & 
-- (((\ALU_3|u4|z~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~0_combout\,
	datab => \ALU_3|tempa~0_combout\,
	datac => \ALU_3|u4|z~0_combout\,
	datad => \ALU_3|tempb~0_combout\,
	combout => \ALU_3|u4|z~1_combout\);

-- Location: IOIBUF_X6_Y10_N8
\a[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(4),
	o => \a[4]~input_o\);

-- Location: LCCOMB_X10_Y8_N20
\ALU_4|tempa~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_4|tempa~0_combout\ = \a[4]~input_o\ $ (((!\Opcode[1]~input_o\ & \Opcode[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[4]~input_o\,
	datac => \Opcode[1]~input_o\,
	datad => \Opcode[2]~input_o\,
	combout => \ALU_4|tempa~0_combout\);

-- Location: IOIBUF_X0_Y8_N15
\b[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(4),
	o => \b[4]~input_o\);

-- Location: LCCOMB_X10_Y8_N26
\ALU_4|tempb~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_4|tempb~0_combout\ = \b[4]~input_o\ $ (((\Opcode[2]~input_o\ & (!\Opcode[1]~input_o\)) # (!\Opcode[2]~input_o\ & (\Opcode[1]~input_o\ & \Opcode[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[4]~input_o\,
	datab => \Opcode[2]~input_o\,
	datac => \Opcode[1]~input_o\,
	datad => \Opcode[0]~input_o\,
	combout => \ALU_4|tempb~0_combout\);

-- Location: LCCOMB_X10_Y8_N22
\ALU_3|u2|cout~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_3|u2|cout~0_combout\ = (\ALU_2|u2|cout~0_combout\ & ((\ALU_3|tempa~0_combout\) # (\b[3]~input_o\ $ (\Mux3~0_combout\)))) # (!\ALU_2|u2|cout~0_combout\ & (\ALU_3|tempa~0_combout\ & (\b[3]~input_o\ $ (\Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_2|u2|cout~0_combout\,
	datab => \b[3]~input_o\,
	datac => \Mux3~0_combout\,
	datad => \ALU_3|tempa~0_combout\,
	combout => \ALU_3|u2|cout~0_combout\);

-- Location: LCCOMB_X10_Y8_N16
\ALU_4|u4|z~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_4|u4|z~0_combout\ = (\Mux0~0_combout\ & (\Mux1~0_combout\)) # (!\Mux0~0_combout\ & (!\Mux1~0_combout\ & \ALU_3|u2|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~0_combout\,
	datab => \Mux1~0_combout\,
	datac => \ALU_3|u2|cout~0_combout\,
	combout => \ALU_4|u4|z~0_combout\);

-- Location: LCCOMB_X10_Y8_N10
\ALU_4|u4|z~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_4|u4|z~1_combout\ = (\Mux0~0_combout\ & ((\ALU_4|tempa~0_combout\ & ((\ALU_4|tempb~0_combout\) # (\ALU_4|u4|z~0_combout\))) # (!\ALU_4|tempa~0_combout\ & (\ALU_4|tempb~0_combout\ & \ALU_4|u4|z~0_combout\)))) # (!\Mux0~0_combout\ & 
-- (\ALU_4|tempa~0_combout\ $ (\ALU_4|tempb~0_combout\ $ (\ALU_4|u4|z~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100110010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~0_combout\,
	datab => \ALU_4|tempa~0_combout\,
	datac => \ALU_4|tempb~0_combout\,
	datad => \ALU_4|u4|z~0_combout\,
	combout => \ALU_4|u4|z~1_combout\);

-- Location: LCCOMB_X10_Y8_N12
\ALU_4|u2|cout~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_4|u2|cout~0_combout\ = (\ALU_3|u2|cout~0_combout\ & ((\ALU_4|tempa~0_combout\) # (\b[4]~input_o\ $ (\Mux3~0_combout\)))) # (!\ALU_3|u2|cout~0_combout\ & (\ALU_4|tempa~0_combout\ & (\b[4]~input_o\ $ (\Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[4]~input_o\,
	datab => \Mux3~0_combout\,
	datac => \ALU_3|u2|cout~0_combout\,
	datad => \ALU_4|tempa~0_combout\,
	combout => \ALU_4|u2|cout~0_combout\);

-- Location: IOIBUF_X10_Y22_N15
\a[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(5),
	o => \a[5]~input_o\);

-- Location: LCCOMB_X11_Y15_N26
\ALU_5|tempa~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_5|tempa~0_combout\ = \a[5]~input_o\ $ (((\Opcode[2]~input_o\ & !\Opcode[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Opcode[2]~input_o\,
	datac => \a[5]~input_o\,
	datad => \Opcode[1]~input_o\,
	combout => \ALU_5|tempa~0_combout\);

-- Location: IOIBUF_X10_Y15_N22
\b[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(5),
	o => \b[5]~input_o\);

-- Location: LCCOMB_X11_Y15_N28
\ALU_5|u3|c~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_5|u3|c~0_combout\ = \Mux3~0_combout\ $ (\ALU_5|tempa~0_combout\ $ (\b[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~0_combout\,
	datac => \ALU_5|tempa~0_combout\,
	datad => \b[5]~input_o\,
	combout => \ALU_5|u3|c~0_combout\);

-- Location: LCCOMB_X11_Y15_N30
\ALU_5|u4|z~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_5|u4|z~0_combout\ = (\Mux0~0_combout\ & (((\Mux1~0_combout\)))) # (!\Mux0~0_combout\ & (\ALU_5|u3|c~0_combout\ $ (((\ALU_4|u2|cout~0_combout\ & !\Mux1~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000110100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~0_combout\,
	datab => \ALU_4|u2|cout~0_combout\,
	datac => \Mux1~0_combout\,
	datad => \ALU_5|u3|c~0_combout\,
	combout => \ALU_5|u4|z~0_combout\);

-- Location: LCCOMB_X11_Y15_N24
\ALU_5|tempb~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_5|tempb~0_combout\ = \b[5]~input_o\ $ (((\Opcode[2]~input_o\ & ((!\Opcode[1]~input_o\))) # (!\Opcode[2]~input_o\ & (\Opcode[0]~input_o\ & \Opcode[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[5]~input_o\,
	datab => \Opcode[0]~input_o\,
	datac => \Opcode[2]~input_o\,
	datad => \Opcode[1]~input_o\,
	combout => \ALU_5|tempb~0_combout\);

-- Location: LCCOMB_X11_Y15_N16
\ALU_5|u4|z~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_5|u4|z~1_combout\ = (\ALU_5|u4|z~0_combout\ & ((\ALU_5|tempa~0_combout\) # ((\ALU_5|tempb~0_combout\) # (!\Mux0~0_combout\)))) # (!\ALU_5|u4|z~0_combout\ & (\ALU_5|tempa~0_combout\ & (\Mux0~0_combout\ & \ALU_5|tempb~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_5|u4|z~0_combout\,
	datab => \ALU_5|tempa~0_combout\,
	datac => \Mux0~0_combout\,
	datad => \ALU_5|tempb~0_combout\,
	combout => \ALU_5|u4|z~1_combout\);

-- Location: IOIBUF_X10_Y15_N8
\b[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(6),
	o => \b[6]~input_o\);

-- Location: LCCOMB_X11_Y15_N10
\ALU_6|tempb~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_6|tempb~0_combout\ = \b[6]~input_o\ $ (((\Opcode[2]~input_o\ & ((!\Opcode[1]~input_o\))) # (!\Opcode[2]~input_o\ & (\Opcode[0]~input_o\ & \Opcode[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[0]~input_o\,
	datab => \Opcode[2]~input_o\,
	datac => \b[6]~input_o\,
	datad => \Opcode[1]~input_o\,
	combout => \ALU_6|tempb~0_combout\);

-- Location: LCCOMB_X11_Y15_N6
\ALU_5|u2|cout~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_5|u2|cout~0_combout\ = (\ALU_4|u2|cout~0_combout\ & ((\ALU_5|tempa~0_combout\) # (\Mux3~0_combout\ $ (\b[5]~input_o\)))) # (!\ALU_4|u2|cout~0_combout\ & (\ALU_5|tempa~0_combout\ & (\Mux3~0_combout\ $ (\b[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~0_combout\,
	datab => \ALU_4|u2|cout~0_combout\,
	datac => \ALU_5|tempa~0_combout\,
	datad => \b[5]~input_o\,
	combout => \ALU_5|u2|cout~0_combout\);

-- Location: LCCOMB_X11_Y15_N8
\ALU_6|u4|z~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_6|u4|z~0_combout\ = (\Mux0~0_combout\ & (\Mux1~0_combout\)) # (!\Mux0~0_combout\ & (!\Mux1~0_combout\ & \ALU_5|u2|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~0_combout\,
	datac => \Mux1~0_combout\,
	datad => \ALU_5|u2|cout~0_combout\,
	combout => \ALU_6|u4|z~0_combout\);

-- Location: IOIBUF_X10_Y15_N1
\a[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(6),
	o => \a[6]~input_o\);

-- Location: LCCOMB_X11_Y15_N20
\ALU_6|tempa~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_6|tempa~0_combout\ = \a[6]~input_o\ $ (((\Opcode[2]~input_o\ & !\Opcode[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[6]~input_o\,
	datac => \Opcode[2]~input_o\,
	datad => \Opcode[1]~input_o\,
	combout => \ALU_6|tempa~0_combout\);

-- Location: LCCOMB_X11_Y15_N18
\ALU_6|u4|z~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_6|u4|z~1_combout\ = (\Mux0~0_combout\ & ((\ALU_6|tempb~0_combout\ & ((\ALU_6|u4|z~0_combout\) # (\ALU_6|tempa~0_combout\))) # (!\ALU_6|tempb~0_combout\ & (\ALU_6|u4|z~0_combout\ & \ALU_6|tempa~0_combout\)))) # (!\Mux0~0_combout\ & 
-- (\ALU_6|tempb~0_combout\ $ (\ALU_6|u4|z~0_combout\ $ (\ALU_6|tempa~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100110000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_6|tempb~0_combout\,
	datab => \ALU_6|u4|z~0_combout\,
	datac => \Mux0~0_combout\,
	datad => \ALU_6|tempa~0_combout\,
	combout => \ALU_6|u4|z~1_combout\);

-- Location: LCCOMB_X11_Y15_N14
\ALU_6|u2|cout~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_6|u2|cout~0_combout\ = (\ALU_5|u2|cout~0_combout\ & ((\ALU_6|tempa~0_combout\) # (\b[6]~input_o\ $ (\Mux3~0_combout\)))) # (!\ALU_5|u2|cout~0_combout\ & (\ALU_6|tempa~0_combout\ & (\b[6]~input_o\ $ (\Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_5|u2|cout~0_combout\,
	datab => \b[6]~input_o\,
	datac => \Mux3~0_combout\,
	datad => \ALU_6|tempa~0_combout\,
	combout => \ALU_6|u2|cout~0_combout\);

-- Location: IOIBUF_X0_Y7_N15
\a[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(7),
	o => \a[7]~input_o\);

-- Location: LCCOMB_X10_Y8_N6
\ALU_7|tempa~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_7|tempa~0_combout\ = \a[7]~input_o\ $ (((!\Opcode[1]~input_o\ & \Opcode[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[7]~input_o\,
	datac => \Opcode[1]~input_o\,
	datad => \Opcode[2]~input_o\,
	combout => \ALU_7|tempa~0_combout\);

-- Location: IOIBUF_X10_Y19_N15
\b[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(7),
	o => \b[7]~input_o\);

-- Location: LCCOMB_X11_Y15_N0
\ALU_7|u3|c~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_7|u3|c~0_combout\ = \ALU_7|tempa~0_combout\ $ (\Mux3~0_combout\ $ (\b[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALU_7|tempa~0_combout\,
	datac => \Mux3~0_combout\,
	datad => \b[7]~input_o\,
	combout => \ALU_7|u3|c~0_combout\);

-- Location: LCCOMB_X11_Y15_N2
\ALU_7|u4|z~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_7|u4|z~0_combout\ = (\Mux0~0_combout\ & (\Mux1~0_combout\)) # (!\Mux0~0_combout\ & (\ALU_7|u3|c~0_combout\ $ (((!\Mux1~0_combout\ & \ALU_6|u2|cout~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110110011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~0_combout\,
	datab => \Mux1~0_combout\,
	datac => \ALU_6|u2|cout~0_combout\,
	datad => \ALU_7|u3|c~0_combout\,
	combout => \ALU_7|u4|z~0_combout\);

-- Location: LCCOMB_X11_Y15_N12
\ALU_7|tempb~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_7|tempb~0_combout\ = \b[7]~input_o\ $ (((\Opcode[2]~input_o\ & ((!\Opcode[1]~input_o\))) # (!\Opcode[2]~input_o\ & (\Opcode[0]~input_o\ & \Opcode[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[7]~input_o\,
	datab => \Opcode[0]~input_o\,
	datac => \Opcode[2]~input_o\,
	datad => \Opcode[1]~input_o\,
	combout => \ALU_7|tempb~0_combout\);

-- Location: LCCOMB_X11_Y15_N4
\ALU_7|u4|z~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_7|u4|z~1_combout\ = (\Mux0~0_combout\ & ((\ALU_7|u4|z~0_combout\ & ((\ALU_7|tempa~0_combout\) # (\ALU_7|tempb~0_combout\))) # (!\ALU_7|u4|z~0_combout\ & (\ALU_7|tempa~0_combout\ & \ALU_7|tempb~0_combout\)))) # (!\Mux0~0_combout\ & 
-- (\ALU_7|u4|z~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~0_combout\,
	datab => \ALU_7|u4|z~0_combout\,
	datac => \ALU_7|tempa~0_combout\,
	datad => \ALU_7|tempb~0_combout\,
	combout => \ALU_7|u4|z~1_combout\);

-- Location: IOIBUF_X10_Y19_N1
\b[8]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(8),
	o => \b[8]~input_o\);

-- Location: IOIBUF_X10_Y18_N8
\a[8]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(8),
	o => \a[8]~input_o\);

-- Location: LCCOMB_X10_Y8_N24
\ALU_8|u4|z~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_8|u4|z~1_combout\ = (\Opcode[1]~input_o\ & (\Opcode[0]~input_o\ & !\Opcode[2]~input_o\)) # (!\Opcode[1]~input_o\ & ((\Opcode[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[0]~input_o\,
	datac => \Opcode[1]~input_o\,
	datad => \Opcode[2]~input_o\,
	combout => \ALU_8|u4|z~1_combout\);

-- Location: LCCOMB_X11_Y18_N10
\ALU_8|u4|z~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_8|u4|z~2_combout\ = \b[8]~input_o\ $ (\a[8]~input_o\ $ (((\Opcode[1]~input_o\ & \ALU_8|u4|z~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[8]~input_o\,
	datab => \a[8]~input_o\,
	datac => \Opcode[1]~input_o\,
	datad => \ALU_8|u4|z~1_combout\,
	combout => \ALU_8|u4|z~2_combout\);

-- Location: LCCOMB_X11_Y18_N20
\ALU_8|u4|z~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_8|u4|z~3_combout\ = (\b[8]~input_o\ & (\a[8]~input_o\ & ((!\ALU_8|u4|z~1_combout\)))) # (!\b[8]~input_o\ & (\ALU_8|u4|z~1_combout\ & (\a[8]~input_o\ $ (!\Opcode[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[8]~input_o\,
	datab => \a[8]~input_o\,
	datac => \Opcode[1]~input_o\,
	datad => \ALU_8|u4|z~1_combout\,
	combout => \ALU_8|u4|z~3_combout\);

-- Location: LCCOMB_X11_Y15_N22
\ALU_7|u2|cout~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_7|u2|cout~0_combout\ = (\ALU_7|tempa~0_combout\ & ((\ALU_6|u2|cout~0_combout\) # (\Mux3~0_combout\ $ (\b[7]~input_o\)))) # (!\ALU_7|tempa~0_combout\ & (\ALU_6|u2|cout~0_combout\ & (\Mux3~0_combout\ $ (\b[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~0_combout\,
	datab => \ALU_7|tempa~0_combout\,
	datac => \ALU_6|u2|cout~0_combout\,
	datad => \b[7]~input_o\,
	combout => \ALU_7|u2|cout~0_combout\);

-- Location: LCCOMB_X11_Y18_N0
\ALU_8|u4|z~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_8|u4|z~0_combout\ = (\Mux0~0_combout\ & (\Mux1~0_combout\)) # (!\Mux0~0_combout\ & (!\Mux1~0_combout\ & \ALU_7|u2|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~0_combout\,
	datac => \Mux1~0_combout\,
	datad => \ALU_7|u2|cout~0_combout\,
	combout => \ALU_8|u4|z~0_combout\);

-- Location: LCCOMB_X11_Y18_N30
\ALU_8|u4|z~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_8|u4|z~4_combout\ = (\Mux0~0_combout\ & ((\ALU_8|u4|z~2_combout\ & (!\ALU_8|u4|z~3_combout\ & \ALU_8|u4|z~0_combout\)) # (!\ALU_8|u4|z~2_combout\ & (\ALU_8|u4|z~3_combout\)))) # (!\Mux0~0_combout\ & (\ALU_8|u4|z~0_combout\ $ (((\ALU_8|u4|z~2_combout\ 
-- & !\ALU_8|u4|z~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110101000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_8|u4|z~2_combout\,
	datab => \ALU_8|u4|z~3_combout\,
	datac => \Mux0~0_combout\,
	datad => \ALU_8|u4|z~0_combout\,
	combout => \ALU_8|u4|z~4_combout\);

-- Location: IOIBUF_X11_Y0_N22
\b[9]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(9),
	o => \b[9]~input_o\);

-- Location: LCCOMB_X9_Y4_N2
\ALU_9|tempb~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_9|tempb~0_combout\ = \b[9]~input_o\ $ (((\Opcode[1]~input_o\ & (!\Opcode[2]~input_o\ & \Opcode[0]~input_o\)) # (!\Opcode[1]~input_o\ & (\Opcode[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[1]~input_o\,
	datab => \Opcode[2]~input_o\,
	datac => \b[9]~input_o\,
	datad => \Opcode[0]~input_o\,
	combout => \ALU_9|tempb~0_combout\);

-- Location: IOIBUF_X9_Y0_N1
\a[9]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(9),
	o => \a[9]~input_o\);

-- Location: LCCOMB_X9_Y4_N20
\ALU_9|tempa~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_9|tempa~0_combout\ = \a[9]~input_o\ $ (((\Opcode[2]~input_o\ & !\Opcode[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Opcode[2]~input_o\,
	datac => \a[9]~input_o\,
	datad => \Opcode[1]~input_o\,
	combout => \ALU_9|tempa~0_combout\);

-- Location: LCCOMB_X9_Y4_N30
\ALU_9|u3|c~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_9|u3|c~0_combout\ = \Mux3~0_combout\ $ (\b[9]~input_o\ $ (\a[9]~input_o\ $ (\Mux2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~0_combout\,
	datab => \b[9]~input_o\,
	datac => \a[9]~input_o\,
	datad => \Mux2~0_combout\,
	combout => \ALU_9|u3|c~0_combout\);

-- Location: LCCOMB_X9_Y4_N8
\ALU_9|u4|z~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_9|u4|z~0_combout\ = (\Mux0~0_combout\ & (((\Mux1~0_combout\)))) # (!\Mux0~0_combout\ & (\ALU_9|u3|c~0_combout\ $ (((\ALU_0|u2|cout~0_combout\ & !\Mux1~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_0|u2|cout~0_combout\,
	datab => \Mux1~0_combout\,
	datac => \ALU_9|u3|c~0_combout\,
	datad => \Mux0~0_combout\,
	combout => \ALU_9|u4|z~0_combout\);

-- Location: LCCOMB_X9_Y4_N26
\ALU_9|u4|z~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_9|u4|z~1_combout\ = (\ALU_9|tempb~0_combout\ & ((\ALU_9|u4|z~0_combout\) # ((\ALU_9|tempa~0_combout\ & \Mux0~0_combout\)))) # (!\ALU_9|tempb~0_combout\ & (\ALU_9|u4|z~0_combout\ & ((\ALU_9|tempa~0_combout\) # (!\Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_9|tempb~0_combout\,
	datab => \ALU_9|tempa~0_combout\,
	datac => \ALU_9|u4|z~0_combout\,
	datad => \Mux0~0_combout\,
	combout => \ALU_9|u4|z~1_combout\);

-- Location: IOIBUF_X10_Y20_N15
\a[10]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(10),
	o => \a[10]~input_o\);

-- Location: IOIBUF_X10_Y18_N22
\b[10]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(10),
	o => \b[10]~input_o\);

-- Location: LCCOMB_X11_Y18_N26
\ALU_10|u4|z~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_10|u4|z~1_combout\ = \a[10]~input_o\ $ (\b[10]~input_o\ $ (((\ALU_8|u4|z~1_combout\ & \Opcode[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001001101101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_8|u4|z~1_combout\,
	datab => \a[10]~input_o\,
	datac => \Opcode[1]~input_o\,
	datad => \b[10]~input_o\,
	combout => \ALU_10|u4|z~1_combout\);

-- Location: LCCOMB_X11_Y18_N28
\ALU_10|u4|z~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_10|u4|z~2_combout\ = (\ALU_8|u4|z~1_combout\ & (!\b[10]~input_o\ & (\a[10]~input_o\ $ (!\Opcode[1]~input_o\)))) # (!\ALU_8|u4|z~1_combout\ & (\a[10]~input_o\ & ((\b[10]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010010000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_8|u4|z~1_combout\,
	datab => \a[10]~input_o\,
	datac => \Opcode[1]~input_o\,
	datad => \b[10]~input_o\,
	combout => \ALU_10|u4|z~2_combout\);

-- Location: LCCOMB_X11_Y18_N24
\ALU_10|u4|z~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_10|u4|z~0_combout\ = (\Mux0~0_combout\ & ((\Mux1~0_combout\))) # (!\Mux0~0_combout\ & (\ALU_0|u2|cout~0_combout\ & !\Mux1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~0_combout\,
	datab => \ALU_0|u2|cout~0_combout\,
	datac => \Mux1~0_combout\,
	combout => \ALU_10|u4|z~0_combout\);

-- Location: LCCOMB_X11_Y18_N14
\ALU_10|u4|z~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_10|u4|z~3_combout\ = (\Mux0~0_combout\ & ((\ALU_10|u4|z~1_combout\ & (!\ALU_10|u4|z~2_combout\ & \ALU_10|u4|z~0_combout\)) # (!\ALU_10|u4|z~1_combout\ & (\ALU_10|u4|z~2_combout\)))) # (!\Mux0~0_combout\ & (\ALU_10|u4|z~0_combout\ $ 
-- (((\ALU_10|u4|z~1_combout\ & !\ALU_10|u4|z~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110101000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_10|u4|z~1_combout\,
	datab => \ALU_10|u4|z~2_combout\,
	datac => \Mux0~0_combout\,
	datad => \ALU_10|u4|z~0_combout\,
	combout => \ALU_10|u4|z~3_combout\);

-- Location: IOIBUF_X9_Y0_N8
\b[11]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(11),
	o => \b[11]~input_o\);

-- Location: LCCOMB_X9_Y4_N12
\ALU_11|tempb~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_11|tempb~0_combout\ = \b[11]~input_o\ $ (((\Opcode[1]~input_o\ & (!\Opcode[2]~input_o\ & \Opcode[0]~input_o\)) # (!\Opcode[1]~input_o\ & (\Opcode[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[1]~input_o\,
	datab => \Opcode[2]~input_o\,
	datac => \b[11]~input_o\,
	datad => \Opcode[0]~input_o\,
	combout => \ALU_11|tempb~0_combout\);

-- Location: IOIBUF_X13_Y0_N15
\a[11]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(11),
	o => \a[11]~input_o\);

-- Location: LCCOMB_X9_Y4_N14
\ALU_11|tempa~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_11|tempa~0_combout\ = \a[11]~input_o\ $ (((!\Opcode[1]~input_o\ & \Opcode[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010010110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[1]~input_o\,
	datab => \Opcode[2]~input_o\,
	datac => \a[11]~input_o\,
	combout => \ALU_11|tempa~0_combout\);

-- Location: LCCOMB_X9_Y4_N16
\ALU_11|u3|c~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_11|u3|c~0_combout\ = \Mux3~0_combout\ $ (\a[11]~input_o\ $ (\b[11]~input_o\ $ (\Mux2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~0_combout\,
	datab => \a[11]~input_o\,
	datac => \b[11]~input_o\,
	datad => \Mux2~0_combout\,
	combout => \ALU_11|u3|c~0_combout\);

-- Location: LCCOMB_X9_Y4_N10
\ALU_11|u4|z~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_11|u4|z~0_combout\ = (\Mux0~0_combout\ & (((\Mux1~0_combout\)))) # (!\Mux0~0_combout\ & (\ALU_11|u3|c~0_combout\ $ (((!\Mux1~0_combout\ & \ALU_0|u2|cout~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_11|u3|c~0_combout\,
	datab => \Mux1~0_combout\,
	datac => \ALU_0|u2|cout~0_combout\,
	datad => \Mux0~0_combout\,
	combout => \ALU_11|u4|z~0_combout\);

-- Location: LCCOMB_X9_Y4_N4
\ALU_11|u4|z~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_11|u4|z~1_combout\ = (\ALU_11|tempb~0_combout\ & ((\ALU_11|u4|z~0_combout\) # ((\Mux0~0_combout\ & \ALU_11|tempa~0_combout\)))) # (!\ALU_11|tempb~0_combout\ & (\ALU_11|u4|z~0_combout\ & ((\ALU_11|tempa~0_combout\) # (!\Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_11|tempb~0_combout\,
	datab => \Mux0~0_combout\,
	datac => \ALU_11|tempa~0_combout\,
	datad => \ALU_11|u4|z~0_combout\,
	combout => \ALU_11|u4|z~1_combout\);

-- Location: IOIBUF_X10_Y20_N8
\b[12]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(12),
	o => \b[12]~input_o\);

-- Location: IOIBUF_X10_Y18_N1
\a[12]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(12),
	o => \a[12]~input_o\);

-- Location: LCCOMB_X11_Y18_N18
\ALU_12|u4|z~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_12|u4|z~1_combout\ = (\ALU_8|u4|z~1_combout\ & (!\b[12]~input_o\ & (\Opcode[1]~input_o\ $ (!\a[12]~input_o\)))) # (!\ALU_8|u4|z~1_combout\ & (((\b[12]~input_o\ & \a[12]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_8|u4|z~1_combout\,
	datab => \Opcode[1]~input_o\,
	datac => \b[12]~input_o\,
	datad => \a[12]~input_o\,
	combout => \ALU_12|u4|z~1_combout\);

-- Location: LCCOMB_X11_Y18_N8
\ALU_12|u4|z~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_12|u4|z~0_combout\ = \b[12]~input_o\ $ (\a[12]~input_o\ $ (((\ALU_8|u4|z~1_combout\ & \Opcode[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_8|u4|z~1_combout\,
	datab => \Opcode[1]~input_o\,
	datac => \b[12]~input_o\,
	datad => \a[12]~input_o\,
	combout => \ALU_12|u4|z~0_combout\);

-- Location: LCCOMB_X11_Y18_N12
\ALU_12|u4|z~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_12|u4|z~2_combout\ = (\Mux0~0_combout\ & ((\ALU_12|u4|z~1_combout\ & (!\ALU_12|u4|z~0_combout\)) # (!\ALU_12|u4|z~1_combout\ & (\ALU_12|u4|z~0_combout\ & \ALU_10|u4|z~0_combout\)))) # (!\Mux0~0_combout\ & (\ALU_10|u4|z~0_combout\ $ 
-- (((!\ALU_12|u4|z~1_combout\ & \ALU_12|u4|z~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110100011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~0_combout\,
	datab => \ALU_12|u4|z~1_combout\,
	datac => \ALU_12|u4|z~0_combout\,
	datad => \ALU_10|u4|z~0_combout\,
	combout => \ALU_12|u4|z~2_combout\);

-- Location: IOIBUF_X13_Y0_N29
\b[13]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(13),
	o => \b[13]~input_o\);

-- Location: LCCOMB_X9_Y4_N6
\ALU_13|tempb~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_13|tempb~0_combout\ = \b[13]~input_o\ $ (((\Opcode[1]~input_o\ & (\Opcode[0]~input_o\ & !\Opcode[2]~input_o\)) # (!\Opcode[1]~input_o\ & ((\Opcode[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011101011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[1]~input_o\,
	datab => \Opcode[0]~input_o\,
	datac => \Opcode[2]~input_o\,
	datad => \b[13]~input_o\,
	combout => \ALU_13|tempb~0_combout\);

-- Location: IOIBUF_X9_Y0_N22
\a[13]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(13),
	o => \a[13]~input_o\);

-- Location: LCCOMB_X9_Y4_N0
\ALU_13|tempa~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_13|tempa~0_combout\ = \a[13]~input_o\ $ (((!\Opcode[1]~input_o\ & \Opcode[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[1]~input_o\,
	datab => \Opcode[2]~input_o\,
	datad => \a[13]~input_o\,
	combout => \ALU_13|tempa~0_combout\);

-- Location: LCCOMB_X9_Y4_N18
\ALU_13|u3|c~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_13|u3|c~0_combout\ = \Mux2~0_combout\ $ (\a[13]~input_o\ $ (\Mux3~0_combout\ $ (\b[13]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2~0_combout\,
	datab => \a[13]~input_o\,
	datac => \Mux3~0_combout\,
	datad => \b[13]~input_o\,
	combout => \ALU_13|u3|c~0_combout\);

-- Location: LCCOMB_X9_Y4_N28
\ALU_13|u4|z~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_13|u4|z~0_combout\ = (\Mux0~0_combout\ & (((\Mux1~0_combout\)))) # (!\Mux0~0_combout\ & (\ALU_13|u3|c~0_combout\ $ (((!\Mux1~0_combout\ & \ALU_0|u2|cout~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_13|u3|c~0_combout\,
	datab => \Mux1~0_combout\,
	datac => \ALU_0|u2|cout~0_combout\,
	datad => \Mux0~0_combout\,
	combout => \ALU_13|u4|z~0_combout\);

-- Location: LCCOMB_X9_Y4_N22
\ALU_13|u4|z~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_13|u4|z~1_combout\ = (\ALU_13|tempb~0_combout\ & ((\ALU_13|u4|z~0_combout\) # ((\ALU_13|tempa~0_combout\ & \Mux0~0_combout\)))) # (!\ALU_13|tempb~0_combout\ & (\ALU_13|u4|z~0_combout\ & ((\ALU_13|tempa~0_combout\) # (!\Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_13|tempb~0_combout\,
	datab => \ALU_13|tempa~0_combout\,
	datac => \ALU_13|u4|z~0_combout\,
	datad => \Mux0~0_combout\,
	combout => \ALU_13|u4|z~1_combout\);

-- Location: IOIBUF_X6_Y0_N15
\b[14]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(14),
	o => \b[14]~input_o\);

-- Location: LCCOMB_X10_Y4_N24
\ALU_14|tempb~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_14|tempb~0_combout\ = \b[14]~input_o\ $ (((\Opcode[2]~input_o\ & ((!\Opcode[1]~input_o\))) # (!\Opcode[2]~input_o\ & (\Opcode[0]~input_o\ & \Opcode[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[14]~input_o\,
	datab => \Opcode[0]~input_o\,
	datac => \Opcode[2]~input_o\,
	datad => \Opcode[1]~input_o\,
	combout => \ALU_14|tempb~0_combout\);

-- Location: IOIBUF_X9_Y0_N29
\a[14]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(14),
	o => \a[14]~input_o\);

-- Location: LCCOMB_X10_Y4_N18
\ALU_14|tempa~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_14|tempa~0_combout\ = \a[14]~input_o\ $ (((\Opcode[2]~input_o\ & !\Opcode[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \a[14]~input_o\,
	datac => \Opcode[2]~input_o\,
	datad => \Opcode[1]~input_o\,
	combout => \ALU_14|tempa~0_combout\);

-- Location: LCCOMB_X11_Y18_N6
\ALU_14|u4|z~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_14|u4|z~0_combout\ = (\Mux0~0_combout\ & ((\ALU_14|tempb~0_combout\ & ((\ALU_14|tempa~0_combout\) # (\ALU_10|u4|z~0_combout\))) # (!\ALU_14|tempb~0_combout\ & (\ALU_14|tempa~0_combout\ & \ALU_10|u4|z~0_combout\)))) # (!\Mux0~0_combout\ & 
-- (\ALU_14|tempb~0_combout\ $ (\ALU_14|tempa~0_combout\ $ (\ALU_10|u4|z~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100110010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~0_combout\,
	datab => \ALU_14|tempb~0_combout\,
	datac => \ALU_14|tempa~0_combout\,
	datad => \ALU_10|u4|z~0_combout\,
	combout => \ALU_14|u4|z~0_combout\);

-- Location: IOIBUF_X11_Y0_N29
\a[15]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(15),
	o => \a[15]~input_o\);

-- Location: IOIBUF_X15_Y0_N15
\b[15]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(15),
	o => \b[15]~input_o\);

-- Location: LCCOMB_X10_Y4_N8
\ALU_15|u3|c~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_15|u3|c~0_combout\ = \a[15]~input_o\ $ (\Mux2~0_combout\ $ (\Mux3~0_combout\ $ (\b[15]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a[15]~input_o\,
	datab => \Mux2~0_combout\,
	datac => \Mux3~0_combout\,
	datad => \b[15]~input_o\,
	combout => \ALU_15|u3|c~0_combout\);

-- Location: LCCOMB_X10_Y4_N10
\ALU_15|u4|z~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_15|u4|z~0_combout\ = (\Mux0~0_combout\ & (\Mux1~0_combout\)) # (!\Mux0~0_combout\ & (\ALU_15|u3|c~0_combout\ $ (((!\Mux1~0_combout\ & \ALU_0|u2|cout~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1~0_combout\,
	datab => \ALU_0|u2|cout~0_combout\,
	datac => \ALU_15|u3|c~0_combout\,
	datad => \Mux0~0_combout\,
	combout => \ALU_15|u4|z~0_combout\);

-- Location: LCCOMB_X10_Y4_N20
\ALU_15|tempb~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_15|tempb~0_combout\ = \b[15]~input_o\ $ (((\Opcode[1]~input_o\ & (\Opcode[0]~input_o\ & !\Opcode[2]~input_o\)) # (!\Opcode[1]~input_o\ & ((\Opcode[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011101011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[1]~input_o\,
	datab => \Opcode[0]~input_o\,
	datac => \Opcode[2]~input_o\,
	datad => \b[15]~input_o\,
	combout => \ALU_15|tempb~0_combout\);

-- Location: LCCOMB_X10_Y4_N14
\ALU_15|tempa~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_15|tempa~0_combout\ = \a[15]~input_o\ $ (((!\Opcode[1]~input_o\ & \Opcode[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[1]~input_o\,
	datac => \a[15]~input_o\,
	datad => \Opcode[2]~input_o\,
	combout => \ALU_15|tempa~0_combout\);

-- Location: LCCOMB_X10_Y4_N4
\ALU_15|u4|z~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_15|u4|z~1_combout\ = (\ALU_15|u4|z~0_combout\ & ((\ALU_15|tempb~0_combout\) # ((\ALU_15|tempa~0_combout\) # (!\Mux0~0_combout\)))) # (!\ALU_15|u4|z~0_combout\ & (\ALU_15|tempb~0_combout\ & (\ALU_15|tempa~0_combout\ & \Mux0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_15|u4|z~0_combout\,
	datab => \ALU_15|tempb~0_combout\,
	datac => \ALU_15|tempa~0_combout\,
	datad => \Mux0~0_combout\,
	combout => \ALU_15|u4|z~1_combout\);

-- Location: LCCOMB_X10_Y4_N30
\ALU_15|u2|cout~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_15|u2|cout~0_combout\ = (\ALU_0|u2|cout~0_combout\ & ((\ALU_15|tempa~0_combout\) # (\Mux3~0_combout\ $ (\b[15]~input_o\)))) # (!\ALU_0|u2|cout~0_combout\ & (\ALU_15|tempa~0_combout\ & (\Mux3~0_combout\ $ (\b[15]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~0_combout\,
	datab => \ALU_0|u2|cout~0_combout\,
	datac => \ALU_15|tempa~0_combout\,
	datad => \b[15]~input_o\,
	combout => \ALU_15|u2|cout~0_combout\);

-- Location: LCCOMB_X10_Y4_N0
\ALU_14|u2|cout~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \ALU_14|u2|cout~0_combout\ = (\ALU_0|u2|cout~0_combout\ & ((\ALU_14|tempa~0_combout\) # (\b[14]~input_o\ $ (\Mux3~0_combout\)))) # (!\ALU_0|u2|cout~0_combout\ & (\ALU_14|tempa~0_combout\ & (\b[14]~input_o\ $ (\Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[14]~input_o\,
	datab => \ALU_0|u2|cout~0_combout\,
	datac => \Mux3~0_combout\,
	datad => \ALU_14|tempa~0_combout\,
	combout => \ALU_14|u2|cout~0_combout\);

-- Location: LCCOMB_X10_Y3_N8
\Overflow~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Overflow~0_combout\ = \ALU_15|u2|cout~0_combout\ $ (\ALU_14|u2|cout~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ALU_15|u2|cout~0_combout\,
	datad => \ALU_14|u2|cout~0_combout\,
	combout => \Overflow~0_combout\);

-- Location: UNVM_X0_Y11_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_end_addr => -1,
	addr_range2_offset => -1,
	addr_range3_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X10_Y24_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

ww_Result(0) <= \Result[0]~output_o\;

ww_Result(1) <= \Result[1]~output_o\;

ww_Result(2) <= \Result[2]~output_o\;

ww_Result(3) <= \Result[3]~output_o\;

ww_Result(4) <= \Result[4]~output_o\;

ww_Result(5) <= \Result[5]~output_o\;

ww_Result(6) <= \Result[6]~output_o\;

ww_Result(7) <= \Result[7]~output_o\;

ww_Result(8) <= \Result[8]~output_o\;

ww_Result(9) <= \Result[9]~output_o\;

ww_Result(10) <= \Result[10]~output_o\;

ww_Result(11) <= \Result[11]~output_o\;

ww_Result(12) <= \Result[12]~output_o\;

ww_Result(13) <= \Result[13]~output_o\;

ww_Result(14) <= \Result[14]~output_o\;

ww_Result(15) <= \Result[15]~output_o\;

ww_Overflow <= \Overflow~output_o\;
END structure;


