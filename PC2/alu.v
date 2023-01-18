module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //
	wire [31:0] ADD_RESULT, SUB_RESSULT, AND_RESULT, OR_RESULT, SLL_RESULT, SRA_RESULT;
	wire [31:0] ADDSUB_RESSULT, ANDOR_RESULT, SLLSRA_RESULT, AS_AO_RESULT;
	wire COUT_1, COUT_2, ADD_OVERFLOW, SUB_OVERFLOW, temp1, temp2;
	
	add_sub #(32) ADD_ALU(data_operandA, data_operandB, 1'b0, ADD_RESULT, COUT_1, ADD_OVERFLOW);
	add_sub #(32) SUB_ALU(data_operandA, data_operandB, 1'b1, SUB_RESSULT, COUT_2, SUB_OVERFLOW);
	
	and_gate #(32) AND_ALU(data_operandA, data_operandB, AND_RESULT);
	or_gate #(32) OR_ALU(data_operandA, data_operandB, OR_RESULT);
	
	sll_gate #(32) SLL_ALU(data_operandA, ctrl_shiftamt, SLL_RESULT);
	sra_gate #(32) SRA_ALU(data_operandA, ctrl_shiftamt, SRA_RESULT);
	
	mux #(32) MUX_ADDSUB(ctrl_ALUopcode[0], ADD_RESULT, SUB_RESSULT, ADDSUB_RESSULT);
	mux #(32) MUX_ADNOR(ctrl_ALUopcode[0], AND_RESULT, OR_RESULT, ANDOR_RESULT);
	mux #(32) MUX_SLLSRA(ctrl_ALUopcode[0], SLL_RESULT, SRA_RESULT, SLLSRA_RESULT);
	
	mux #(32) MUX_AS_AO(ctrl_ALUopcode[1], ADDSUB_RESSULT, ANDOR_RESULT, AS_AO_RESULT);
	mux #(32) MUX_OUT(ctrl_ALUopcode[2], AS_AO_RESULT, SLLSRA_RESULT, data_result);
	
	
	ifequal IFEQUAL(SUB_RESSULT, 32'h00000000, isNotEqual);
	mux #(1) IS_LESSTHAN(SUB_OVERFLOW, SUB_RESSULT[31], data_operandA[31], isLessThan);
	
	mux #(1) MUX_OVERFLOW_0(ctrl_ALUopcode[0], ADD_OVERFLOW, SUB_OVERFLOW, temp1);
	mux #(1) MUX_OVERFLOW_1(ctrl_ALUopcode[1], temp1, 1'b0, temp2);
	mux #(1) MUX_OVERFLOW_2(ctrl_ALUopcode[2], temp2, 1'b0, overflow);
	
	
endmodule
