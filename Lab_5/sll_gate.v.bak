	module sll_gate#(parameter DATA_WIDTH=32)(
    input [DATA_WIDTH-1:0] INPUT_A,
	 input [4:0] ctrl_shiftamt,
    output [DATA_WIDTH-1:0] OUT_A
    );
	 
	 wire [DATA_WIDTH-1:0] TEMP_A0;
	 wire [DATA_WIDTH-1:0] TEMP_A1;
	 wire [DATA_WIDTH-1:0] TEMP_A2;
	 wire [DATA_WIDTH-1:0] TEMP_A3;
    generate
		genvar index;
		for(index=0;index<DATA_WIDTH;index=index+1'b1)
        begin: identifier_sra_0
				if(index >= 1)
					begin
						mux #(1) MUX_SLL00(ctrl_shiftamt[0], INPUT_A[index], INPUT_A[index-1],  TEMP_A0[index]);
					end
				else
					begin
						mux #(1) MUX_SLL01(ctrl_shiftamt[0], INPUT_A[index], 1'b0, TEMP_A0[index]);
					end
        end
		  
		for(index=0;index<DATA_WIDTH;index=index+1'b1)
        begin: identifier_sra_1
				if(index >= 2)
					begin
						mux #(1) MUX_SLL10(ctrl_shiftamt[1], TEMP_A0[index], TEMP_A0[index-2],  TEMP_A1[index]);
					end
				else
					begin
						mux #(1) MUX_SLL11(ctrl_shiftamt[1], TEMP_A0[index], 1'b0, TEMP_A1[index]);
					end
        end
		
		for(index=0;index<DATA_WIDTH;index=index+1'b1)
        begin: identifier_sra_2
				if(index >= 4)
					begin
						mux #(1) MUX_SLL20(ctrl_shiftamt[2], TEMP_A1[index], TEMP_A1[index-4],  TEMP_A2[index]);
					end
				else
					begin
						mux #(1) MUX_SLL21(ctrl_shiftamt[2], TEMP_A1[index], 1'b0, TEMP_A2[index]);
					end
        end
		
		for(index=0;index<DATA_WIDTH;index=index+1'b1)
        begin: identifier_sra_3
				if(index >= 8)
					begin
						mux #(1) MUX_SLL30(ctrl_shiftamt[3], TEMP_A2[index], TEMP_A2[index-8],  TEMP_A3[index]);
					end
				else
					begin
						mux #(1) MUX_SLL31(ctrl_shiftamt[3], TEMP_A2[index], 1'b0, TEMP_A3[index]);
					end
        end
		
		for(index=0;index<DATA_WIDTH;index=index+1'b1)
        begin: identifier_sra_4
				if(index >= 16)
					begin
						mux #(1) MUX_SLL40(ctrl_shiftamt[4], TEMP_A3[index], TEMP_A3[index-16],  OUT_A[index]);
					end
				else
					begin
						mux #(1) MUX_SLL41(ctrl_shiftamt[4], TEMP_A3[index], 1'b0, OUT_A[index]);
					end
        end
    endgenerate
endmodule
