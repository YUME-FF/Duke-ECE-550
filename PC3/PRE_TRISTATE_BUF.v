module PRE_TRISTATE_BUF(SELECT, OUT);
	input [4:0] SELECT;
	output [31:0] OUT;
	
	wire [31:0] TMP_0, TMP_1, TMP_2, TMP_3;
	
	assign TMP_0 = SELECT[0] ? 32'h00000002 : 32'h00000001;
	assign TMP_1 = SELECT[1] ? {TMP_0[29:0], 2'b00} : TMP_0;
	assign TMP_2 = SELECT[2] ? {TMP_1[27:0], 4'h0} : TMP_1;
	assign TMP_3 = SELECT[3] ? {TMP_2[23:0], 8'h00} : TMP_2;
	assign OUT = SELECT[4] ? {TMP_3[15:0], 16'h0000} : TMP_3;	
	
endmodule
