module mips(
input clock
);

reg [31:0] program_counter;
wire [31:0] instruction;

wire regDst_mips, branch_mips, memRead_mips, memWrite_mips, ALUsrc_mips, regWrite_mips, jump_mips, byteOperations_mips, move_mips;
wire [2:0] ALUop_mips;

wire [31:0] read_data1_mips, read_data2_mips;
wire [4:0] write_register_in;


wire [31:0] signExtended_data;

wire [2:0] alu_ctr_mips;


wire [31:0] alu_src2_in, alu_result_mips;
wire zero_bit_mips;

wire [31:0] read_data_from_mem_mips;

wire [32:0] data_from_mem_for_lb_mips, in_to_mux3, out_of_mux3;

wire [31:0] write_data_in_register;


wire dead1, dead2;
wire [31:0] pc_plus_1, pc_plus_1_plus_signExtend, mux4_out;


initial begin
    program_counter = 32'b0;
end


instruction_block ins_block(
.instruction(instruction),
.pc(program_counter)
);



control_unit controlUnit(
.regDst(regDst_mips),
.branch(branch_mips),
.memRead(memRead_mips), //(This can also be used as memToReg)
.memWrite(memWrite_mips),
.ALUop(ALUop_mips), //(This was assigned as [1:0] before, by mistake. It should be [2:0])
.ALUsrc(ALUsrc_mips),
.regWrite(regWrite_mips),
.jump(jump_mips),
.byteOperations(byteOperations_mips), //(This is an optional signal for lb and sb operations)
.move(move_mips), //(This is an optional signal for MOVE operation)
.opcode(instruction[31:26])
);





assign write_register_in = regDst_mips ? instruction[15:11] : ( (jump_mips && instruction[26] == 1) ? 5'b11111 : instruction[20:16]) ;

//assign write_data_in_register = move_mips ? read_data1_mips : out_of_mux3;
assign write_data_in_register = move_mips ? read_data1_mips : ( (jump_mips && instruction[26] == 1) ? pc_plus_1  : out_of_mux3);

wire must_write;

assign must_write = (regWrite_mips || (jump_mips && instruction[26] == 1)) ? 1 : 0;

register_block reg_block(
.read_data1(read_data1_mips),
.read_data2(read_data2_mips),
.byteOperations(byteOperations_mips), //(This is an optional signal for lb and sb operations)
.write_data(write_data_in_register),  //WARN!!! Burası ayarlanmalı. 32 bit
.read_reg1(instruction[25:21]),
.read_reg2(instruction[20:16]), 
.write_reg(write_register_in), 
.regWrite(must_write)
);






sign_extend signExtend(
.sign_ext_imm(signExtended_data),
.imm(instruction[15:0])
);






alu_control aluControl(
.alu_ctr(alu_ctr_mips),
.function_code(instruction[5:0]),
.ALUop(ALUop_mips)
);




assign alu_src2_in = ALUsrc_mips ? signExtended_data : read_data2_mips;

alu ALU(
.alu_src1(read_data1_mips),
.alu_src2(alu_src2_in),
.alu_ctr(alu_ctr_mips), //ALUop
.zero_bit(zero_bit_mips),
.alu_result(alu_result_mips)
);




memory_block memoryBlock(
    .read_data(read_data_from_mem_mips),
    .byteOperations(byteOperations_mips), // (This is an optional signal for lb and sb operations)
    .address(alu_result_mips[17:0]),
    .write_data(read_data2_mips),
    .memRead(memRead_mips),
    .memWrite(memWrite_mips)
);




//extend for lb part
assign data_from_mem_for_lb_mips = {24'b0, read_data_from_mem_mips[7:0]};

assign in_to_mux3 = byteOperations_mips ? data_from_mem_for_lb_mips : read_data_from_mem_mips;

assign out_of_mux3 = memRead_mips ? in_to_mux3 : alu_result_mips;




wire [31:0] shifted_address_mips;

shift_left_2 shiftLeft2(
.shifted_address(shifted_address_mips),
.address(signExtended_data)
);





alu adder_for_pc_increment(
.alu_src1(program_counter),
.alu_src2(32'b00000000000000000000000000000001),
.alu_ctr(3'b101), //ALUop
.zero_bit(dead1),
.alu_result(pc_plus_1)
);


alu adder_for_beq_bne(
.alu_src1(signExtended_data),
.alu_src2(pc_plus_1),
.alu_ctr(3'b101), //ALUop
.zero_bit(dead2),
.alu_result(pc_plus_1_plus_signExtend)
);


assign mux4_out = (branch_mips && zero_bit_mips && instruction[31:26] == 6'b100011) ? pc_plus_1_plus_signExtend : (  (instruction[31:26] == 6'b000000 && instruction[6:0] == 6'b001000) ? read_data1_mips  : ( (jump_mips) ?   {6'b0, instruction[25:0]}   : ( (branch_mips && !zero_bit_mips && instruction[31:26] == 6'b100111) ? pc_plus_1_plus_signExtend : pc_plus_1) ) );



always@(posedge clock) begin

    program_counter = mux4_out;
end



endmodule