	module sll_gate#(parameter DATA_WIDTH=32)(
    input [DATA_WIDTH-1:0] INPUT_A,
	 input [4:0] ctrl_shiftamt,
    output [DATA_WIDTH-1:0] OUT_A
    );
	 
	 always@(ctrl_shiftamt)
	 begin
		if(ctrl_shiftamt[0] == 1'b1)
			INPUT_A>>1;
		if(ctrl_shiftamt[1] == 1'b1)
			INPUT_A>>2;
		if(ctrl_shiftamt[2] == 1'b1)
			INPUT_A>>4;
		if(ctrl_shiftamt[3] == 1'b1)
			INPUT_A>>8;
		if(ctrl_shiftamt[4] == 1'b1)
			INPUT_A>>16;
		OUT_A<=INPUT_A;
	 end
	 
endmodule
