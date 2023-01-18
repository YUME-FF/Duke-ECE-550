	module carry_save_adder#(parameter DATA_WIDTH=32)(
    input [DATA_WIDTH-1:0] INPUT_A,
    input [DATA_WIDTH-1:0] INPUT_B,
    input CIN,
    output [DATA_WIDTH-1:0] SUM,
    output COUT,
	 output [DATA_WIDTH/2-1:0] FLAG
    );
	 
	 generate
		 if (DATA_WIDTH == 4)
			 begin
				wire [1:0] RSA_SUM_1;
				wire [1:0] RSA_SUM_2;
				
				wire RSA_COUT_0;
				wire RSA_COUT_1;
				wire RSA_COUT_2;
	 
				wire FLAG_1;
				wire FLAG_2;
	 
				ripple_carry_adder_2 RCA2_CSA4_0(INPUT_A[1:0], INPUT_B[1:0], CIN,  SUM[1:0],  RSA_COUT_0, FLAG[0]);
				ripple_carry_adder_2 RCA2_CSA4_1(INPUT_A[3:2], INPUT_B[3:2], 1'b0, RSA_SUM_1, RSA_COUT_1, FLAG_1);
				ripple_carry_adder_2 RCA2_CSA4_2(INPUT_A[3:2], INPUT_B[3:2], 1'b1, RSA_SUM_2, RSA_COUT_2, FLAG_2);
	
				mux #(1) MUX1_CSA4_0(RSA_COUT_0, RSA_COUT_1, RSA_COUT_2, COUT);
				mux #(2) MUX2_CSA4_0(RSA_COUT_0, RSA_SUM_1, RSA_SUM_2, SUM[3:2]);
				mux #(1) MUX1_CSA4_1(RSA_COUT_0, FLAG_1, FLAG_2, FLAG[1]);
			end
		else
			begin
				wire [DATA_WIDTH/2-1:0] CSA_SUM_1;
				wire [DATA_WIDTH/2-1:0] CSA_SUM_2;
	 
				wire CSA_COUT_0;
				wire CSA_COUT_1;
				wire CSA_COUT_2;
	 
				wire [DATA_WIDTH/4-1:0] FLAG_1;
				wire [DATA_WIDTH/4-1:0] FLAG_2;
	  
				carry_save_adder #(DATA_WIDTH/2) CSA_0(INPUT_A[DATA_WIDTH/2-1:0], INPUT_B[DATA_WIDTH/2-1:0], CIN, SUM[DATA_WIDTH/2-1:0],  CSA_COUT_0, FLAG[DATA_WIDTH/4-1:0]);
				carry_save_adder #(DATA_WIDTH/2) CSA_1(INPUT_A[DATA_WIDTH-1:DATA_WIDTH/2], INPUT_B[DATA_WIDTH-1:DATA_WIDTH/2], 1'b0, CSA_SUM_1, CSA_COUT_1, FLAG_1);
				carry_save_adder #(DATA_WIDTH/2) CSA_2(INPUT_A[DATA_WIDTH-1:DATA_WIDTH/2], INPUT_B[DATA_WIDTH-1:DATA_WIDTH/2], 1'b1, CSA_SUM_2, CSA_COUT_2, FLAG_2);
	
				mux #(1) MUX1_CSA_0(CSA_COUT_0, CSA_COUT_1, CSA_COUT_2, COUT);
				mux #(DATA_WIDTH/2) MUX2_CSA_0(CSA_COUT_0, CSA_SUM_1, CSA_SUM_2, SUM[DATA_WIDTH-1:DATA_WIDTH/2]);
				mux #(DATA_WIDTH/4) MUX1_CSA_1(CSA_COUT_0, FLAG_1, FLAG_2, FLAG[DATA_WIDTH/2-1:DATA_WIDTH/4]);
			end
	endgenerate
endmodule
