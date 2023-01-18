	module not_gate#(parameter DATA_WIDTH=32)(
    input [DATA_WIDTH-1:0] INPUT_A,
    output [DATA_WIDTH-1:0] NOT_A
    );
    generate
        genvar index;
        for(index=0;index<DATA_WIDTH;index=index+1'b1)
            begin: identifier_not
					 not (NOT_A[index], INPUT_A[index]);
            end
    endgenerate
endmodule
