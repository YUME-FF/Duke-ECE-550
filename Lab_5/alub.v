module alub(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //
	reg [31:0] data_result;
	
	always@(data_operandA or ctrl_ALUopcode)
	begin
		if(ctrl_ALUopcode == 5'b00010)
			data_result=data_operandA & data_operandB;
		else
			data_result=data_operandA | data_operandB;
	end
	
endmodule
