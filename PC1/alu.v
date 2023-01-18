module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //
	wire [31:0] ADD_RESULT, SUB_RESSULT;
	wire COUT_1, COUT_2, ADD_OVERFLOW,SUB_OVERFLOW;
	
	add_sub #(32) ADD_ALU(data_operandA, data_operandB, 1'b0, ADD_RESULT, COUT_1, ADD_OVERFLOW);
	add_sub #(32) SUB_ALU(data_operandA, data_operandB, 1'b1, SUB_RESSULT, COUT_2, SUB_OVERFLOW);
	
	mux #(32) MUX_ADDSUB(ctrl_ALUopcode[0], ADD_RESULT, SUB_RESSULT, data_result);
	mux #(1) MUX_OVERFLOW(ctrl_ALUopcode[0], ADD_OVERFLOW, SUB_OVERFLOW, overflow);
	
	
	
endmodule
