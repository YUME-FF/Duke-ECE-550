module ifequal(
	IN0, 
	IN1, 
	OUT
);
	input [31:0] IN0;
	input [31:0] IN1;
	output OUT;
	
	wire [31:0] TEMP_0;
	wire [15:0] TEMP_1;
	wire [7:0] TEMP_2;
	wire [3:0] TEMP_3;
	wire [1:0] TEMP_4;
	
	generate
      genvar index;
        for(index=0;index<32;index=index+1'b1)
				begin: identifier_ifequal
					xor(TEMP_0[index], IN0[index], IN1[index]);
            end
    endgenerate
	 
	 or TEMP_1_0(TEMP_1[0], TEMP_0[0], TEMP_0[1]);
	 or TEMP_1_1(TEMP_1[1], TEMP_0[2], TEMP_0[3]);
	 or TEMP_1_2(TEMP_1[2], TEMP_0[4], TEMP_0[5]);
	 or TEMP_1_3(TEMP_1[3], TEMP_0[6], TEMP_0[7]);
	 or TEMP_1_4(TEMP_1[4], TEMP_0[8], TEMP_0[9]);
	 or TEMP_1_5(TEMP_1[5], TEMP_0[10], TEMP_0[11]);
	 or TEMP_1_6(TEMP_1[6], TEMP_0[12], TEMP_0[13]);
	 or TEMP_1_7(TEMP_1[7], TEMP_0[14], TEMP_0[15]);
	 or TEMP_1_8(TEMP_1[8], TEMP_0[16], TEMP_0[17]);
	 or TEMP_1_9(TEMP_1[9], TEMP_0[18], TEMP_0[19]);
	 or TEMP_1_10(TEMP_1[10], TEMP_0[20], TEMP_0[21]);
	 or TEMP_1_11(TEMP_1[11], TEMP_0[22], TEMP_0[23]);
	 or TEMP_1_12(TEMP_1[12], TEMP_0[24], TEMP_0[25]);
	 or TEMP_1_13(TEMP_1[13], TEMP_0[26], TEMP_0[27]);
	 or TEMP_1_14(TEMP_1[14], TEMP_0[28], TEMP_0[29]);
	 or TEMP_1_15(TEMP_1[15], TEMP_0[30], TEMP_0[31]);
	 
	 or TEMP_2_0(TEMP_2[0], TEMP_1[0], TEMP_1[1]);
	 or TEMP_2_1(TEMP_2[1], TEMP_1[2], TEMP_1[3]);
	 or TEMP_2_2(TEMP_2[2], TEMP_1[4], TEMP_1[5]);
	 or TEMP_2_3(TEMP_2[3], TEMP_1[6], TEMP_1[7]);
	 or TEMP_2_4(TEMP_2[4], TEMP_1[8], TEMP_1[9]);
	 or TEMP_2_5(TEMP_2[5], TEMP_1[10], TEMP_1[11]);
	 or TEMP_2_6(TEMP_2[6], TEMP_1[12], TEMP_1[13]);
	 or TEMP_2_7(TEMP_2[7], TEMP_1[14], TEMP_1[15]);
	 
	 or TEMP_3_0(TEMP_3[0], TEMP_2[0], TEMP_2[1]);
	 or TEMP_3_1(TEMP_3[1], TEMP_2[2], TEMP_2[3]);
	 or TEMP_3_2(TEMP_3[2], TEMP_2[4], TEMP_2[5]);
	 or TEMP_3_3(TEMP_3[3], TEMP_2[6], TEMP_2[7]);	 
	 
	 or TEMP_4_0(TEMP_4[0], TEMP_3[0], TEMP_3[1]);
	 or TEMP_4_1(TEMP_4[1], TEMP_3[2], TEMP_3[3]); 
	 
	 or(OUT, TEMP_4[0], TEMP_4[1]);
endmodule
