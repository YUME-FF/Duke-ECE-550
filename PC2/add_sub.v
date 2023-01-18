module add_sub#(parameter DATA_WIDTH=32)(
	input [DATA_WIDTH-1:0] INPUT_A,
	input [DATA_WIDTH-1:0] INPUT_B,
	input SELECT,
	
	output [DATA_WIDTH-1:0] SUM,
	output COUT,
	output OVERFLOW
	);
	
	wire [DATA_WIDTH-1:0] NOT_B;
	wire [DATA_WIDTH-1:0] OUT_B;
	wire [DATA_WIDTH/2-1:0] FLAG;
	
	not_gate #(DATA_WIDTH) NOTGATE_ADDSUB(INPUT_B, NOT_B);
	mux #(DATA_WIDTH) MUX_ADDSUB(SELECT, INPUT_B, NOT_B, OUT_B);
	
	carry_save_adder #(DATA_WIDTH) CSA_ADDSUB(INPUT_A, OUT_B, SELECT, SUM, COUT, FLAG);
	//carry_save_adder_4 CSA_ADDSUB(INPUT_A, OUT_B, SELECT, SUM, COUT, FLAG);
	
	xor XOR_0(OVERFLOW, COUT, FLAG[DATA_WIDTH/2-1]);

endmodule
