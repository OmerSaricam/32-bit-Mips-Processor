
module variant_tb();

reg clk_tb;


mips Mips(
.clock(clk_tb)
);


initial begin
    clk_tb = 1'b0;
end

always begin
    #10;
    clk_tb <= ~clk_tb;
end


endmodule





//testbench for alu_control
/*
module variant_tb();



wire [2:0] alu_ctr_tb;
reg [5:0] function_code_tb;
reg [2:0] ALUop_tb;


alu_control alu_cntl(
.alu_ctr(alu_ctr_tb),
.function_code(function_code_tb),
.ALUop(ALUop_tb)
);


initial begin

	//clk_tb = 1'b0;
    //reset_tb = 1'b1;

    function_code_tb = 6'b000000;
    ALUop_tb = 3'b000;

    #20;
    function_code_tb = 6'b000000;
    ALUop_tb = 3'b001;

    #20;
    function_code_tb = 6'b000000;
    ALUop_tb = 3'b100;

    #20;
    function_code_tb = 6'b000000;
    ALUop_tb = 3'b101;

    #20;
    function_code_tb = 6'b000000;
    ALUop_tb = 3'b110;

    #20;
    function_code_tb = 6'b000010;
    ALUop_tb = 3'b111;

    #20;
    function_code_tb = 6'b000011;
    ALUop_tb = 3'b111;

    #20;
    function_code_tb = 6'b0000100;
    ALUop_tb = 3'b111;

    #20;
    function_code_tb = 6'b000101;
    ALUop_tb = 3'b111;

    #20;
    function_code_tb = 6'b000111;
    ALUop_tb = 3'b111;
    
    #20

    $stop;
	 

end


endmodule
*/





//testbench for control unit
/*
module variant_tb();



wire move_tb, byteOperations_tb, jump_tb, regWrite_tb, ALUsrc_tb, memWrite_tb, memRead_tb, branch_tb, regDst_tb;
reg [5:0] opcode_tb;
wire [2:0] ALUop_tb;


control_unit cntr_unit(
.regDst(regDst_tb),
.branch(branch_tb),
.memRead(memRead_tb), //(This can also be used as memToReg)
.memWrite(memWrite_tb),
.ALUop(ALUop_tb), //(This was assigned as [1:0] before, by mistake. It should be [2:0])
.ALUsrc(ALUsrc_tb),
.regWrite(regWrite_tb),
.jump(jump_tb),
.byteOperations(byteOperations_tb), //(This is an optional signal for lb and sb operations)
.move(move_tb), //(This is an optional signal for MOVE operation)
.opcode(opcode_tb)
);


initial begin

	//clk_tb = 1'b0;
    //reset_tb = 1'b1;

    opcode_tb = 6'b000000;

    #20;
    opcode_tb = 6'b000000;

    #20;
    opcode_tb = 6'b000010;

    #20;
    opcode_tb = 6'b000011;

    #20;
    opcode_tb = 6'b000100;

    #20;
    opcode_tb = 6'b000101;

    #20;
    opcode_tb = 6'b001000;

    #20;
    opcode_tb = 6'b010000;

    #20;
    opcode_tb = 6'b001001;

    #20;
    opcode_tb = 6'b010001;

    #20;
    opcode_tb = 6'b000111;

    #20;
    opcode_tb = 6'b100011;

    #20;
    opcode_tb = 6'b100111;

    #20;
    opcode_tb = 6'b111000;

    #20;
    opcode_tb = 6'b111001;


    $stop;
	 

end


endmodule
*/


//testbench for memory block
/*
module variant_tb();


wire [31:0]  read_data_tb;

reg byteOperations_tb, memRead_tb, memWrite_tb;
reg [17:0] address_tb;
reg [31:0] write_data_tb;


memory_block mem_block(
.read_data(read_data_tb),
.byteOperations(byteOperations_tb), //(This is an optional signal for lb and sb operations)
.address(address_tb),
.write_data(write_data_tb),
.memRead(memRead_tb),
.memWrite(memWrite_tb)
);



initial begin

	//clk_tb = 1'b0;
    //reset_tb = 1'b1;

    byteOperations_tb = 0;
    memWrite_tb = 0;
    memRead_tb = 1;
    address_tb = 0;
    write_data_tb = 32'b11111111111111111111111111111111;


    #20;
    byteOperations_tb = 0;
    memWrite_tb = 0;
    memRead_tb = 1;
    address_tb = 4;
    write_data_tb = 32'b11111111111111111111111111111111;

    #20;
    byteOperations_tb = 0;
    memWrite_tb = 0;
    memRead_tb = 1;
    address_tb = 60;
    write_data_tb = 32'b11111111111111111111111111111111;

    #20;
    byteOperations_tb = 0;
    memWrite_tb = 1;
    memRead_tb = 0;
    address_tb = 60;
    write_data_tb = 32'b11111111111111111111111111111111;

    #20;

    byteOperations_tb = 0;
    memWrite_tb = 0;
    memRead_tb = 1;
    address_tb = 60;
    write_data_tb = 32'b11111111111111111111111111111111;

    #20;


    $stop;
	 

end


endmodule

*/






// Testbench for register_block
/*
module variant_tb();


wire [31:0]  read_data1_tb, read_data2_tb;
reg [31:0]  pc_tb; 

reg byteOperations_tb, regWrite_tb;
reg [4:0] read_reg1_tb, read_reg2_tb, write_reg_tb;
reg [31:0] write_data_tb;


register_block reg_block (
.read_data1(read_data1_tb),
.read_data2(read_data2_tb),
.byteOperations(byteOperations_tb), //(This is an optional signal for lb and sb o.write_data,
.write_data(write_data_tb),
.read_reg1(read_reg1_tb),
.read_reg2(read_reg2_tb), //(These were assigned as [5:0] before, by mistake.
.write_reg(write_reg_tb), //They should be [4:0] since register addresses are 5 bits long, not 6)
.regWrite(regWrite_tb)
);



initial begin

	//clk_tb = 1'b0;
    //reset_tb = 1'b1;

    byteOperations_tb = 0;
    regWrite_tb = 0;
    read_reg1_tb = 0;
    read_reg2_tb = 1;
    write_reg_tb = 31;
    write_data_tb = 32'b0;

    #20;
    byteOperations_tb = 0;
    regWrite_tb = 0;
    read_reg1_tb = 30;
    read_reg2_tb = 31;
    write_reg_tb = 31;
    write_data_tb = 32'b0;

    #20;
    byteOperations_tb = 0;
    regWrite_tb = 1;
    read_reg1_tb = 2;
    read_reg2_tb = 3;
    write_reg_tb = 31;
    write_data_tb = 32'b11111111111100111111111111111111;

    #20;
    byteOperations_tb = 0;
    regWrite_tb = 0;
    read_reg1_tb = 30;
    read_reg2_tb = 31;
    write_reg_tb = 31;
    write_data_tb = 32'b0;

    #20;


    $stop;
	 

end


endmodule
*/






//testbench for register_block.v
/*
module variant_tb();


wire [31:0]  instruction_tb;
reg [31:0]  pc_tb; 



instruction_block ins(
.instruction(instruction_tb),
.pc(pc_tb)
);



reg [31:0] index0;
reg signed [31:0]index1, index2;


initial begin

	//clk_tb = 1'b0;
    //reset_tb = 1'b1;

    pc_tb = 0;
    #20;
    pc_tb = 1;
    #20;
    pc_tb = 2;
    #20;
    pc_tb = 3;
    #20;




    $stop;
	 

end


endmodule
*/


/*
//testbench for alu
module variant_tb();


wire [31:0]  r_tb;
reg [31:0]  a_tb, b_tb; 

reg [2:0] ALUop_tb; 

wire zero_bit_tb;


alu alu_(
.alu_src1(a_tb),
.alu_src2(b_tb),
.alu_ctr(ALUop_tb), //ALUop
.zero_bit(zero_bit_tb),
.alu_result(r_tb)
);



reg [31:0] index0;
reg signed [31:0]index1, index2;


initial begin

	//clk_tb = 1'b0;
    //reset_tb = 1'b1;

    for (index0 = 0 ; index0 < 7; index0 = index0 + 1) begin
        ALUop_tb = index0;

        for (index1 = -50; index1 < 100 ; index1 = index1 + 1 ) begin
            a_tb = index1;

            for (index2 = -50; index2 < 100; index2 = index2 + 1) begin
                b_tb = index2;
					 
					 #50;
            end

        end
    end


    $stop;
	 

end


endmodule
*/


