module ripple_carry_adder_2(
	INPUT_A, 
	INPUT_B, 
	CIN, 
	
	SUM, 
	COUT, 
	FLAG
	);
	
    input [1:0] INPUT_A;
    input [1:0] INPUT_B;
    input  CIN;
	 
    output [1:0] SUM;
    output COUT;
	 output FLAG;
	 
	 
	 full_adder FA_RCA_0(INPUT_A[0], INPUT_B[0], CIN, SUM[0], FLAG);
	 full_adder FA_RCA_1(INPUT_A[1], INPUT_B[1], FLAG, SUM[1], COUT);
	  
endmodule
