	module sra_gate#(parameter DATA_WIDTH=32)(
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
				if(index < DATA_WIDTH - 1)
					begin
						mux #(1) MUX_SRA00(ctrl_shiftamt[0], INPUT_A[index], INPUT_A[index+1],  TEMP_A0[index]);
					end
				else
					begin
						mux #(1) MUX_SRA01(ctrl_shiftamt[0], INPUT_A[index], INPUT_A[31], TEMP_A0[index]);
					end
        end
		
		for(index=0;index<DATA_WIDTH;index=index+1'b1)
        begin: identifier_sra_1
				if(index < DATA_WIDTH - 2)
					begin
						mux #(1) MUX_SRA10(ctrl_shiftamt[1], TEMP_A0[index], TEMP_A0[index+2],  TEMP_A1[index]);
					end
				else
					begin
						mux #(1) MUX_SRA11(ctrl_shiftamt[1], TEMP_A0[index], INPUT_A[31], TEMP_A1[index]);
					end
        end

		for(index=0;index<DATA_WIDTH;index=index+1'b1)
        begin: identifier_sra_2
				if(index < DATA_WIDTH - 4)
					begin
						mux #(1) MUX_SRA20(ctrl_shiftamt[2], TEMP_A1[index], TEMP_A1[index+4],  TEMP_A2[index]);
					end
				else
					begin
						mux #(1) MUX_SRA21(ctrl_shiftamt[2], TEMP_A1[index], INPUT_A[31], TEMP_A2[index]);
					end
        end
	
		for(index=0;index<DATA_WIDTH;index=index+1'b1)
        begin: identifier_sra_3
				if(index < DATA_WIDTH - 8)
					begin
						mux #(1) MUX_SRA30(ctrl_shiftamt[3], TEMP_A2[index], TEMP_A2[index+8],  TEMP_A3[index]);
					end
				else
					begin
						mux #(1) MUX_SRA31(ctrl_shiftamt[3], TEMP_A2[index], INPUT_A[31], TEMP_A3[index]);
					end
        end
		  
		for(index=0;index<DATA_WIDTH;index=index+1'b1)
        begin: identifier_sra_4
				if(index < DATA_WIDTH - 16)
					begin
						mux #(1) MUX_SRA40(ctrl_shiftamt[4], TEMP_A3[index], TEMP_A3[index+16],  OUT_A[index]);
					end
				else
					begin
						mux #(1) MUX_SRA41(ctrl_shiftamt[4], TEMP_A3[index], INPUT_A[31], OUT_A[index]);
					end
        end
    endgenerate
endmodule
