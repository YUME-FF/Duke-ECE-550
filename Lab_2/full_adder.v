// Copyright (C) 2017  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Intel and sold by Intel or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 17.0.0 Build 595 04/25/2017 SJ Lite Edition"
// CREATED		"Thu Sep 08 22:16:59 2022"

module full_adder(
	a,
	b,
	c_in,
	sum,
	c_out
);


input wire	a;
input wire	b;
input wire	c_in;
output wire	sum;
output wire	c_out;

wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;




assign	SYNTHESIZED_WIRE_4 = a ^ b;

assign	sum = SYNTHESIZED_WIRE_4 ^ c_in;

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_4 & c_in;

assign	SYNTHESIZED_WIRE_2 = a & b;

assign	c_out = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;


endmodule
