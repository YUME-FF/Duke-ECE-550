module half_adder 
(
	input 	IN_a,
	input 	IN_b,
	output 	s,
	output  C_o
);

assign s    = IN_a ^ IN_b ;
assign C_o  = IN_a & IN_b ;

endmodule