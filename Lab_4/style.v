// edgeDetector.v
// Moore and Mealy Implementation

module style
(
    input wire clk, reset, 
    output reg count, 
    output reg [2:0] current_state, 
	 output reg [2:0] next_state
);
    
localparam [2:0] // 3 states are required for Moore
    Moore_0 =  3'b000,
    Moore_1 =  3'b001,
	 Moore_2 =  3'b010,
	 Moore_3 =  3'b011,
	 Moore_4 =  3'b100,
	 Moore_5 =  3'b101,
	 Moore_6 =  3'b110,
	 Moore_7 =  3'b111;

reg [1:0] flag;
reg[2:0] stateMoore_reg, stateMoore_next;

always @(posedge clk, posedge reset)
begin
    if(reset) // go to state zero if rese
        begin
		  stateMoore_reg <= stateMoore_next;
        end
    else // otherwise update the states
        begin
		  stateMoore_reg <= Moore_0;
        end
end

// Moore Design 
always @(stateMoore_reg)
begin
    // store current state as next
    stateMoore_next = stateMoore_reg; // required: when no case statement is satisfied
	 count = 1'b0;
	 current_state = 3'b000;
	 next_state = 3'b001;
    case(stateMoore_reg)
        Moore_0: // set 'tick = 1' if state = zero and level = '1'
				begin
                stateMoore_next = Moore_1; // otherwise remain in same state.
					 flag = 2'b00;
					 current_state = 3'b000;
					 next_state = 3'b001;
				end
        Moore_1: 
            begin
                stateMoore_next = Moore_2;
					 if(flag == 2'b00)
						begin
							flag = 2'b01;
						end
					else
						begin
							flag = 2'b00;
						end	
					current_state = 3'b001;
					next_state = 3'b010;	
            end
		  Moore_2: 
            begin
                stateMoore_next = Moore_3;
					 if(flag == 2'b01)
						begin
							flag = 2'b10;
						end
					else
						begin
							flag = 2'b00;
						end
					current_state = 3'b010;
					 next_state = 3'b011;
            end
		  Moore_3: 
            begin
                stateMoore_next = Moore_4;
					 if(flag == 2'b10)
						begin
							flag = 2'b11;
						end
					else
						begin
							flag = 2'b00;
						end
					current_state = 3'b011;
					 next_state = 3'b100;
            end
		 Moore_4: 
            begin
                stateMoore_next = Moore_0;
					 if(flag == 2'b11)
						begin
							flag = 2'b00;
							count = 1'b1;
						end
					else
						begin
							flag = 2'b00;
						end
					current_state = 3'b100;
					 next_state = 3'b000;
            end
		 Moore_5: 
            begin
                stateMoore_next = Moore_0;
					 flag = 2'b00;
					 current_state = 3'b101;
					 next_state = 3'b000;
            end
		 Moore_6: 
            begin
                stateMoore_next = Moore_0;
					 flag = 2'b00;
					 current_state = 3'b110;
					 next_state = 3'b000;
            end
		 Moore_7: 
            begin
                stateMoore_next = Moore_0;
					 flag = 2'b00;
					 current_state = 3'b111;
					 next_state = 3'b000;
            end
    endcase
end
endmodule