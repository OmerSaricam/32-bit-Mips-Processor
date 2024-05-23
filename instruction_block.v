module instruction_block(
output reg [31:0] instruction,
input [31:0] pc
);

	//WARN! I reduced the memory to make it compile faster.
	//reg [31:0] instructions [1023:0];  //For 1024 instructions

    //WARN! This can hold 265 instruction at most
    reg [31:0] instructions [255:0];


	initial begin 
		$readmemb("instructionMemory.mem", instructions);
	end
	
	always @ (pc) begin
		instruction = instructions[pc];
	end



endmodule