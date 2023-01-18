	module carry_save_adder#(parameter DATA_WIDTH=32)(
    input [DATA_WIDTH-1:0] INPUT_A,
    input [DATA_WIDTH-1:0] INPUT_B,
    input [DATA_WIDTH-1:0] cin,
    output [DATA_WIDTH-1:0] sum,
    output [DATA_WIDTH-1:0] cout
    );
    generate
        genvar index;
        for(index=0;index<DATA_WIDTH;index=index+1'b1)
            begin: identifier_csa
					 full_adder(INPUT_A[index], INPUT_B[index, cin[index], sum[index], cout[index]);
            end
    endgenerate
endmodule