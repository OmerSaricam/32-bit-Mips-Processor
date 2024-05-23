
module mod_cu(
input reset,
	input CLK,
	input is_less,
	output reg we,  //write signal
	output reg s,
	output reg result
);


reg [1:0] curr_state, next_state;

localparam 	ADD 	= 2'b00;
localparam				COMP	= 2'b01;
localparam				SMALL = 2'b10;
localparam				LARGE	= 2'b11;
				
				
//State Registers			
always @(posedge CLK)
	begin
	if(reset)
		curr_state <= ADD;
	else
		curr_state <= next_state;
	end
	

//Next State Logic
always @(*)
	begin
	case(curr_state)
	ADD: 	begin
			next_state = COMP;
			end
	
	COMP: begin
			if(is_less)  
				next_state = SMALL;
			else
				next_state = LARGE;
			end
	
	SMALL: begin
			 end
	
	LARGE: begin
			 next_state = COMP;
             end
	
	endcase
	end
	
//Output Logic
always @(*)
	begin
	s = 1'b0;  
	we = 1'b0;   
	case(curr_state)
	ADD: 	begin
			s = 1'b0;
			we = 1'b1;
			end
	
	COMP: begin
			s = 1'b1;
			we = 1'b0;
			end
	
	SMALL: begin
			 result = 1'b1;
             //Here it is necessary to give the output to the result of the mod.
			 end
	
	LARGE: begin
			 result = 1'b0;
             s = 1'b1;
             we = 1'b1;
			 end
	
	endcase
	end
	

	


endmodule