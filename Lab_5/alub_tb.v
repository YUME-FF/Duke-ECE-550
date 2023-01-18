`timescale 1 ns / 100 ps

module alub_tb();

    // inputs to the ALU are reg type

    reg  clock;
    reg [31:0] data_operandA, data_operandB, data_expected;
    reg [4:0] ctrl_ALUopcode, ctrl_shiftamt;


    // outputs from the ALU are wire type
    wire [31:0] data_result;
    wire isNotEqual, isLessThan, overflow;


    // Tracking the number of errors
    integer errors;
    integer index;    // for testing...


    // Instantiate ALU
    alub alu_ut(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt,
        data_result, isNotEqual, isLessThan, overflow);
//		 alu alu_ut(data_operandA, data_result);

    initial

    begin
        $display($time, " << Starting the Simulation >>");
        clock = 1'b0;    // at time 0
        errors = 0;
		  

        checkOr();
		  checkAnd();

        if(errors == 0) begin
            $display("The simulation completed without errors");
        end
        else begin
            $display("The simulation failed with %d errors", errors);
        end

        $stop;
    end

    // Clock generator
    always
         #10     clock = ~clock;

    task checkOr;
        begin
            @(negedge clock);
            assign ctrl_ALUopcode = 5'b00011;
            assign ctrl_shiftamt = 5'b00000;

            assign data_operandA = 32'h00000000;
            assign data_operandB = 32'h00000000;

            @(negedge clock);
            if(data_result !== 32'h00000000) begin
                $display("**Error in OR (test 1); expected: %h, actual: %h", 32'h00000000, data_result);
                errors = errors + 1;
            end

            @(negedge clock);
            assign data_operandA = 32'hFFFFFF0F;
            assign data_operandB = 32'h00000000;

            @(negedge clock);
            if(data_result !== 32'hFFFFFFFF) begin
                $display("**Error in OR (test 2); expected: %h, actual: %h", 32'hFFFFFFFF, data_result);
                errors = errors + 1;
            end

            @(negedge clock);
            assign data_operandA = 32'h00000000;
            assign data_operandB = 32'hFFFFFFFF;

            @(negedge clock);
            if(data_result !== 32'hFFFFFFFF) begin
                $display("**Error in OR (test 3); expected: %h, actual: %h", 32'hFFFFFFFF, data_result);
                errors = errors + 1;
            end

            @(negedge clock);
            assign data_operandA = 32'hFFFFFFFF;
            assign data_operandB = 32'hFFFFFFFF;

            @(negedge clock);
            if(data_result !== 32'hFFFFFFFF) begin
                $display("**Error in OR (test 4); expected: %h, actual: %h", 32'hFFFFFFFF, data_result);
                errors = errors + 1;
            end
        end
    endtask

   

   task checkAnd;
        begin
            @(negedge clock);
            assign ctrl_ALUopcode = 5'b00010;
            assign ctrl_shiftamt = 5'b00000;

            assign data_operandA = 32'h00000000;
            assign data_operandB = 32'h00000000;

            @(negedge clock);
            if(data_result !== 32'h00000000) begin
                $display("**Error in AND (test 5); expected: %h, actual: %h", 32'h00000000, data_result);
                errors = errors + 1;
            end

            @(negedge clock);
            assign data_operandA = 32'hFFFFFFFF;
            assign data_operandB = 32'h000000F0;

            @(negedge clock);
            if(data_result !== 32'h000000F0) begin
                $display("**Error in AND (test 6); expected: %h, actual: %h", 32'h00000000, data_result);
                errors = errors + 1;
            end

            @(negedge clock);
            assign data_operandA = 32'h00000000;
            assign data_operandB = 32'hFFFFFFFF;

            @(negedge clock);
            if(data_result !== 32'h00000000) begin
                $display("**Error in AND (test 7); expected: %h, actual: %h", 32'h00000000, data_result);
                errors = errors + 1;
            end

            @(negedge clock);
            assign data_operandA = 32'hFFFFFFFF;
            assign data_operandB = 32'hFFFFFFFF;

            @(negedge clock);
            if(data_result !== 32'hFFFFFFFF) begin
                $display("**Error in AND (test 8); expected: %h, actual: %h", 32'hFFFFFFFF, data_result);
                errors = errors + 1;
            end
        end
    endtask
    
endmodule
