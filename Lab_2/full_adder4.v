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
// CREATED		"Thu Sep 08 22:02:37 2022"

module full_adder4(
	c1,
	a,
	b,
	c2,
	s
);


input wire	c1;
input wire	[3:0] a;
input wire	[3:0] b;
output wire	c2;
output wire	[3:0] s;

wire	[3:0] s_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;





full_adder	b2v_inst(
	.a(a[0]),
	.b(b[0]),
	.c_in(c1),
	.sum(s_ALTERA_SYNTHESIZED[0]),
	.c_out(SYNTHESIZED_WIRE_0));


full_adder	b2v_inst1(
	.a(a[1]),
	.b(b[1]),
	.c_in(SYNTHESIZED_WIRE_0),
	.sum(s_ALTERA_SYNTHESIZED[1]),
	.c_out(SYNTHESIZED_WIRE_1));


full_adder	b2v_inst2(
	.a(a[2]),
	.b(b[2]),
	.c_in(SYNTHESIZED_WIRE_1),
	.sum(s_ALTERA_SYNTHESIZED[2]),
	.c_out(SYNTHESIZED_WIRE_2));


full_adder	b2v_inst3(
	.a(a[3]),
	.b(b[3]),
	.c_in(SYNTHESIZED_WIRE_2),
	.sum(s_ALTERA_SYNTHESIZED[3]),
	.c_out(c2));

assign	s = s_ALTERA_SYNTHESIZED;

endmodule
