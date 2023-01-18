module Wallace_multipler(
    input [3:0] a,
    input [3:0] b, 
    output [7:0] product 
    );
    wire [3:0] c[3:0];
    wire [5:0] sum1,carry1;
    wire [6:0] sum2,carry2;
	 
    assign c[0]=b[0]?a:'d0;
    assign c[1]=b[1]?a:'d0;
    assign c[2]=b[2]?a:'d0;
    assign c[3]=b[3]?a:'d0;
    
	wire [6-1:0] csa1_a = {2'd0,c[0]};
	wire [6-1:0] csa1_b = {1'd0,(c[1]<<1)};
	wire [6-1:0] csa1_c = c[2]<<2;
	
	wire [7-1:0] csa2_a = {1'd0,sum1};
	wire [7-1:0] csa2_b = carry1<<1;
	wire [7-1:0] csa2_c = c[3]<<3;
    carry_save_adder #(.DATA_WIDTH(6)) csa1(csa1_a,csa1_b,csa1_c,sum1,carry1);
    carry_save_adder #(.DATA_WIDTH(7)) csa2(csa2_a,csa2_b,csa2_c,sum2,carry2);
    assign product = sum2 + (carry2<<1);
	
endmodule

