// set the timescale
`timescale 1 ns / 100 ps
module style_tb();
	reg w;
	reg clock;
	wire count;
	wire [2:0] current_state;
	wire [2:0] next_state;
	
	style test_style(clock, w, count, current_state, next_state);
	
	initial begin
		$display($time, "simulation start");
		clock = 1'b0;
		@(negedge clock);
		w = 1'b0;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		@(negedge clock);
		w = 1'b1;
		#100 w = 1'b0;
		#40 w=1'b1;
		@(negedge clock);
		$stop;
	end
	always
		#10 clock =~clock;
endmodule
