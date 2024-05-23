

module sign_extend (
output [31:0] sign_ext_imm,
input [15:0] imm
);



xor xor0 (sign_ext_imm[0], 1'b0, imm[0]);
xor xor1 (sign_ext_imm[1], 1'b0, imm[1]);
xor xor2 (sign_ext_imm[2], 1'b0, imm[2]);
xor xor3 (sign_ext_imm[3], 1'b0, imm[3]);
xor xor4 (sign_ext_imm[4], 1'b0, imm[4]);
xor xor5 (sign_ext_imm[5], 1'b0, imm[5]);
xor xor6 (sign_ext_imm[6], 1'b0, imm[6]);
xor xor7 (sign_ext_imm[7], 1'b0, imm[7]);
xor xor8 (sign_ext_imm[8], 1'b0, imm[8]);
xor xor9 (sign_ext_imm[9], 1'b0, imm[9]);
xor xor10 (sign_ext_imm[10], 1'b0, imm[10]);
xor xor11 (sign_ext_imm[11], 1'b0, imm[11]);
xor xor12 (sign_ext_imm[12], 1'b0, imm[12]);
xor xor13 (sign_ext_imm[13], 1'b0, imm[13]);
xor xor14 (sign_ext_imm[14], 1'b0, imm[14]);
xor xor15 (sign_ext_imm[15], 1'b0, imm[15]);

xor xor16 (sign_ext_imm[16], 1'b0, imm[15]);
xor xor17 (sign_ext_imm[17], 1'b0, imm[15]);
xor xor18 (sign_ext_imm[18], 1'b0, imm[15]);
xor xor19 (sign_ext_imm[19], 1'b0, imm[15]);
xor xor20 (sign_ext_imm[20], 1'b0, imm[15]);
xor xor21 (sign_ext_imm[21], 1'b0, imm[15]);
xor xor22 (sign_ext_imm[22], 1'b0, imm[15]);
xor xor23 (sign_ext_imm[23], 1'b0, imm[15]);
xor xor24 (sign_ext_imm[24], 1'b0, imm[15]);
xor xor25 (sign_ext_imm[25], 1'b0, imm[15]);
xor xor26 (sign_ext_imm[26], 1'b0, imm[15]);
xor xor27 (sign_ext_imm[27], 1'b0, imm[15]);
xor xor28 (sign_ext_imm[28], 1'b0, imm[15]);
xor xor29 (sign_ext_imm[29], 1'b0, imm[15]);
xor xor30 (sign_ext_imm[30], 1'b0, imm[15]);
xor xor31 (sign_ext_imm[31], 1'b0, imm[15]);


endmodule

