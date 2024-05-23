module control_unit (
output regDst,
output branch,
output memRead, //(This can also be used as memToReg)
output memWrite,
output [2:0] ALUop, //(This was assigned as [1:0] before, by mistake. It should be [2:0])
output ALUsrc,
output regWrite,
output jump,
output byteOperations, //(This is an optional signal for lb and sb operations)
output move, //(This is an optional signal for MOVE operation)
input [5:0] opcode
);


wire is_r_type, is_addi, is_subi, is_andi, is_ori, is_lw, is_sw, is_lb, is_sb, is_slti, is_beq, is_bne, is_jump, is_jal, is_move;


wire not_opcode[5:0];

not not0(not_opcode[0], opcode[0]);
not not1(not_opcode[1], opcode[1]);
not not2(not_opcode[2], opcode[2]);
not not3(not_opcode[3], opcode[3]);
not not4(not_opcode[4], opcode[4]);
not not5(not_opcode[5], opcode[5]);





nor nor1(is_r_type, opcode[5], opcode[4], opcode[3], opcode[2], opcode[1], opcode[0]);

and and0(is_addi, not_opcode[5], not_opcode[4], not_opcode[3], not_opcode[2], opcode[1], not_opcode[0]);

and and2(is_subi, not_opcode[5], not_opcode[4], not_opcode[3], not_opcode[2], opcode[1], opcode[0]);

and and3(is_andi, not_opcode[5], not_opcode[4], not_opcode[3], opcode[2], not_opcode[1], not_opcode[0]);

and and4(is_ori, not_opcode[5], not_opcode[4], not_opcode[3], opcode[2], not_opcode[1], opcode[0]);

and and5(is_lw, not_opcode[5], not_opcode[4], opcode[3], not_opcode[2], not_opcode[1], not_opcode[0]);

and and6(is_sw, not_opcode[5], opcode[4], not_opcode[3], not_opcode[2], not_opcode[1], not_opcode[0]);

and and7(is_lb, not_opcode[5], not_opcode[4], opcode[3], not_opcode[2], not_opcode[1], opcode[0]);

and and8(is_sb, not_opcode[5], opcode[4], not_opcode[3], not_opcode[2], not_opcode[1], opcode[0]);

and and9(is_slti, not_opcode[5], not_opcode[4], not_opcode[3], opcode[2], opcode[1], opcode[0]);

and and10(is_beq, opcode[5], not_opcode[4], not_opcode[3], not_opcode[2], opcode[1], opcode[0]);

and and11(is_bne, opcode[5], not_opcode[4], not_opcode[3], opcode[2], opcode[1], opcode[0]);

and and12(is_jump, opcode[5], opcode[4], opcode[3], not_opcode[2], not_opcode[1], not_opcode[0]);

and and13(is_jal, opcode[5], opcode[4], opcode[3], not_opcode[2], not_opcode[1], opcode[0]);

and and14(is_move, opcode[5], not_opcode[4], not_opcode[3], not_opcode[2], not_opcode[1], not_opcode[0]);





or or0(regDst, is_r_type);

or or1(ALUsrc,  is_addi, is_subi, is_lw, is_sw, is_lb, is_sb, is_slti, is_andi, is_ori);

or or2(regWrite, is_r_type, is_addi, is_subi, is_andi, is_ori, is_lw,  is_lb,  is_slti, is_jal, is_move);

or or3(memRead,  is_lw,  is_lb);

or or4(memWrite, is_sw,  is_sb);

or or5(branch, is_beq, is_bne );

or or6(jump, is_jump, is_jal);

or or7(move, is_move);

or or8(byteOperations,is_lb, is_sb);


// For Aluop

or or9(ALUop[0], is_ori, is_addi, is_lb, is_sb, is_lw, is_sw, is_r_type);

or or10(ALUop[1], is_subi, is_beq, is_bne, is_r_type);

or or11(ALUop[2], is_slti, is_addi, is_lb, is_sb, is_lw, is_sw, is_subi, is_beq, is_bne, is_r_type);



endmodule

