	module or_gate#(parameter DATA_WIDTH=32)(
    input [DATA_WIDTH-1:0] INPUT_A,
	 input [DATA_WIDTH-1:0] INPUT_B,
    output [DATA_WIDTH-1:0] OUT_AB
    );

	 always@(INPUT_A or INPUT_B)
	 begin
		OUT_AB=INPUT_A || INPUT_B;
	 end
endmodule