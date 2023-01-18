module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;

   /* YOUR CODE HERE */
	wire [31:0] DECODER_OUT;
	decoder decoder_0(ctrl_writeEnable, ctrl_writeReg, DECODER_OUT);
	
	wire [31:0] REG[31:0];
	
	dffe_ref DFFE_REG0(REG[0], 32'h00000000, clock, DECODER_OUT[0], ctrl_reset);
	
	 generate
		genvar index;
		for(index=1;index<32;index=index+1'b1)
        begin: REG_WRITE
				dffe_ref DREG(REG[index], data_writeReg, clock, DECODER_OUT[index], ctrl_reset);
        end
	 endgenerate
	
	wire [31:0] PRE_A, PRE_B;
	PRE_TRISTATE_BUF PREA(ctrl_readRegA, PRE_A);
	PRE_TRISTATE_BUF PREB(ctrl_readRegB, PRE_B);
	
	wire [31:0] REG_TMPA[31:0], REG_TMPB[31:0];
	
	generate
		genvar index2;
		for(index2=0;index2<32;index2=index2+1'b1)
        begin: REISTEATE
				assign REG_TMPA[index2] = PRE_A[index2] ? REG[index2] : 1'bz;
				assign REG_TMPB[index2] = PRE_B[index2] ? REG[index2] : 1'bz;
        end
	 endgenerate
	
	assign data_readRegA = REG_TMPA[ctrl_readRegA];
	assign data_readRegB = REG_TMPB[ctrl_readRegB];
	
endmodule
