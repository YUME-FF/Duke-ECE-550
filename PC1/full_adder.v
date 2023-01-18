module full_adder(
	Input_A, 
	Input_B,
	CIN,
	SUM,
	COUT
);
	 input Input_A;
	 input Input_B;
	 input CIN;
	 
    output SUM;
	 output COUT;
	 
	 wire	WIRE_0;
	 wire	WIRE_1;
	 wire	WIRE_2;

    xor XOR_0(WIRE_0, Input_A, Input_B);
    xor XOR_1(SUM, WIRE_0, CIN);
	 
    and AND_0(WIRE_1, WIRE_0, CIN);
    and AND_1(WIRE_2, Input_A, Input_B);
	 
    or OR_0(COUT, WIRE_1, WIRE_2);
	 
endmodule
