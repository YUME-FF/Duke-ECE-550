module wtm(
	input [4:0] a,
	input [4:0] b,
	output [6:0] ans,
	output [6:0] btest
	);
	
	wire [4:0] c[4:0];
	
   wire [6:0] sum1,carry1;
   wire [7:0] sum2,carry2;
	wire [8:0] sum3,carry3;
	
   assign c[0]=b[0]?a:'d0;
   assign c[1]=b[1]?a:'d0;
   assign c[2]=b[2]?a:'d0;
   assign c[3]=b[3]?a:'d0;
	assign c[4]=b[4]?a:'d0;
	
	wire [7-1:0] csa1_a = {2'd0,c[0]};
	wire [7-1:0] csa1_b = {1'd0,c[1],1'd0};
	wire [7-1:0] csa1_c = c[2]<<2;
	
	wire [8-1:0] csa2_a = {1'd0,sum1};
	wire [8-1:0] csa2_b = carry1<<1;
	wire [8-1:0] csa2_c = c[3]<<3;
	
	wire [9-1:0] csa3_a = {1'd0,sum2};
	wire [9-1:0] csa3_b = carry2<<1;
	wire [9-1:0] csa3_c = c[4]<<4;
	
   carry_save_adder #(.DATA_WIDTH(7)) csa1(csa1_a,csa1_b,csa1_c,sum1,carry1);
   carry_save_adder #(.DATA_WIDTH(8)) csa2(csa2_a,csa2_b,csa2_c,sum2,carry2);
	carry_save_adder #(.DATA_WIDTH(9)) csa3(csa3_a,csa3_b,csa3_c,sum3,carry3);
   assign ans = csa1_b;
	
endmodule

