module mux#(parameter DATA_WIDTH=32)(
	input SELECT,
	input [DATA_WIDTH-1:0] IN0,
	input [DATA_WIDTH-1:0] IN1,
	output [DATA_WIDTH-1:0] OUT
	);
	
	assign OUT = SELECT ? IN1: IN0;
endmodule
